//
//  SettingsViewController.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 05/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class SettingsViewController: UIViewController {

    let logOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOG OUT", for: UIControl.State.normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant:  250).isActive = true
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleLogOut), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
    }
    
    fileprivate func setUpViews(){
        
        view.addSubview(logOutButton)
        logOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    @objc fileprivate func handleLogOut (){
        LoginManager().logOut()
        
        do{
            try Auth.auth().signOut()
            print("Sucessfully logged out of Firebase")
        }catch{
            print("There was an error in signing out of Firebase: \(error)")
            return
        }

        UIApplication.shared.windows.first?.rootViewController = LoginOptionsController()
        
        navigationController?.popToRootViewController(animated: true)
    }
    

}
