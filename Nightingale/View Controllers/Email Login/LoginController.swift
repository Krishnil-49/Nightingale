//
//  LoginController.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 29/02/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Email"
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        return textField
    }()
    
    let emailStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        return textField
    }()
    
    let passwordStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    let componentsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 30
        return stack
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOG IN", for: UIControl.State.normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant:  150).isActive = true
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    let forgetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("FORGOT YOUR PASSWORD?", for: UIControl.State.normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.widthAnchor.constraint(equalToConstant:  200).isActive = true
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
//        button.addTarget(self, action: #selector(handelLogin), for: .touchUpInside)
        return button
    }()
    
    let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    
    let finalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 40
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupViews()
    }
    
    func setupViews(){
        
        emailStack.addArrangedSubview(emailLabel)
        emailStack.addArrangedSubview(emailTextField)
        passwordStack.addArrangedSubview(passwordLabel)
        passwordStack.addArrangedSubview(passwordTextField)
        
        componentsStack.addArrangedSubview(emailStack)
        componentsStack.addArrangedSubview(passwordStack)
        
        buttonStack.addArrangedSubview(loginButton)
        buttonStack.addArrangedSubview(forgetPasswordButton)
        
        finalStack.addArrangedSubview(componentsStack)
        finalStack.addArrangedSubview(buttonStack)
        
        view.addSubview(finalStack)
        
        finalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        finalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
    }
    
    @objc func handleLogin(){
        
//        if let email = emailTextField.text, let password = passwordLabel.text{
//
//            Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
//                if let e = error{
//                    print("There was a problem in logging in: \(e)")
//                }
//            }
//
//        }
        
        navigationController?.pushViewController(CustomTabBarController(), animated: true)
        
    }
    
}
