//
//  LoginViewController.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 28/02/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class LoginOptionsController: UIViewController{
    
    let featureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Millions of songs."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()
    
    let featureLabelCont: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Free on Nightingale."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Continue with"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let labelStack1: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .leading
        return stack
    }()
    
    let labelStack2: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 40
        return stack
    }()
    
    let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()
    
    let phoneLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "iPhone")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        button.setImage(image, for: UIControl.State.normal)
        button.setTitle("  PHONE NUMBER", for: UIControl.State.normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant:  200).isActive = true
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        return button
    }()
    
    let facebookLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "facebook")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        button.setImage(image, for: UIControl.State.normal)
        button.setTitle("  FACEBOOK", for: UIControl.State.normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant:  200).isActive = true
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleFacebookLogin), for: .touchUpInside)
        return button
    }()
    
    let emailLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "email")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        button.setImage(image, for: UIControl.State.normal)
        button.setTitle("    EMAIL", for: UIControl.State.normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant:  200).isActive = true
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleEmailLogin), for: .touchUpInside)
        return button
    }()
    
    let finalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 15
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupViews(){
        
        view.backgroundColor = .black
        
        labelStack1.addArrangedSubview(featureLabel)
        labelStack1.addArrangedSubview(featureLabelCont)

        labelStack2.addArrangedSubview(labelStack1)
        labelStack2.addArrangedSubview(label3)

        buttonStack.addArrangedSubview(phoneLoginButton)
        buttonStack.addArrangedSubview(facebookLoginButton)
        buttonStack.addArrangedSubview(emailLoginButton)
        
        finalStack.addArrangedSubview(labelStack2)
        finalStack.addArrangedSubview(buttonStack)
        
        view.addSubview(finalStack)
        
        finalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        finalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.height/6).isActive = true
        
    }
    
    @objc func handleEmailLogin(){
        navigationController?.pushViewController(EmailLoginController(), animated: true)
    }
    
    @objc func handleFacebookLogin(){
        LoginManager().logIn(permissions: ["email", "public_profile"], from: self) { (result, error) in
            if let error = error {
                print("There was an error in signing in with Facebook: \(error)")
                return
            }
            
            print("Successfully logged in with facebook")
            self.logIntoFirebaseUsingFacebook()
            self.showUserDetails()
        }
    }
    
    fileprivate func logIntoFirebaseUsingFacebook(){
        
        guard let accessToken = AccessToken.current else { return }
        
        let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
        
        Auth.auth().signIn(with: credential) { (result, error) in
            if let error = error{
                print("There was an error in signing into firebase with facebook: \(error)")
                return
            }
            print("Successfully logged into firebase with facebook")
            self.navigationController?.pushViewController(CustomTabBarController(), animated: true)
        }
        
        
    }
    
    fileprivate func showUserDetails(){

        GraphRequest(graphPath: "/me", parameters: ["fields" : "id, name, email"]).start { (connection, result, error) in
            if let error = error {
                print("There was an error in getting user information from Facebook graph request: \(error)")
                return
            }
            
            guard let data = result as? NSDictionary else { return }
            guard let email = data["email"] as? NSString else { return }

        }

    }
    
}
