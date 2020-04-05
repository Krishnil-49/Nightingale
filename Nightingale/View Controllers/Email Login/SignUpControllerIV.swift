//
//  SignUpControllerIV.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 01/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit

class SignUpControllerIV: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "What's your gender?"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let genderPicker: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.insertSegment(withTitle: "Female", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Male", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Non-binary", at: 2, animated: true)
        segmentedControl.backgroundColor = .white
        segmentedControl.selectedSegmentTintColor = .lightGray
        return segmentedControl
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: UIControl.State.normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant:  150).isActive = true
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
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
        
        finalStack.addArrangedSubview(label)
        finalStack.addArrangedSubview(genderPicker)
        finalStack.addArrangedSubview(nextButton)
        
        view.addSubview(finalStack)
        
        finalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        finalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func handleNext(){
        navigationController?.pushViewController(SignUpControllerV(), animated: true)
    }
    
}
