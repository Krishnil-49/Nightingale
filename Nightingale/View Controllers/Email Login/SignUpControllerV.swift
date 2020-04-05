//
//  SignUpControllerV.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 01/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit

class SignUpControllerV: UIViewController {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "What's your name?"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Name"
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return textField
    }()
    
    let nameAlertLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This appears on your Nightingale profile."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let nameStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    let createButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CREATE", for: UIControl.State.normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant:  150).isActive = true
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleCreate), for: .touchUpInside)
        return button
    }()
    
    let termsOfServiceAlertLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "By creating an account, you agree to Nightingale's Terms of Service."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 11)
        return label
    }()
    
    let privacyPolicyAlertLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To learn more about how Nightingale collects, uses, shares and protects\nyour personal data please read Nightingale's Privacy Policy."
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 11)
        return label
    }()
    
    let finalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 30
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupViews()
    }
    
    func setupViews(){
        
        nameStack.addArrangedSubview(nameLabel)
        nameStack.addArrangedSubview(nameTextField)
        nameStack.addArrangedSubview(nameAlertLabel)
        
        finalStack.addArrangedSubview(nameStack)
        finalStack.addArrangedSubview(createButton)
        finalStack.addArrangedSubview(termsOfServiceAlertLabel)
        finalStack.addArrangedSubview(privacyPolicyAlertLabel)
        
        view.addSubview(finalStack)
        
        finalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        finalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func handleCreate(){
        navigationController?.pushViewController(CustomTabBarController(), animated: true)
    }

}
