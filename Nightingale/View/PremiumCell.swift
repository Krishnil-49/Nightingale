//
//  PremiumCell.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 22/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit

class PremiumCell: UICollectionViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Premium PackageName"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "From ₹13.00"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "/Day"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let featureLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose a day, week or month of Premium. • Pay with PayTM or UPI. • Top up when you want"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let getPremiumButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("GET PREMIUM", for: UIControl.State.normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handelGetPremium), for: .touchUpInside)
        return button
    }()
    
    let termsAndConditionLabel: UILabel = {
        let label = UILabel()
        label.text = "Prices vary according to duration of plan. Terms and condition apply"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    let premiumStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    let finalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .green
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpViews(){
        
        addSubview(finalStackView)
        finalStackView.addArrangedSubview(premiumStackView)
        finalStackView.addArrangedSubview(featureLabel)
        finalStackView.addArrangedSubview(getPremiumButton)
        finalStackView.addArrangedSubview(termsAndConditionLabel)
        
//        finalStackView.frame = CGRect(x: 20, y: 20, width: frame.width - 40, height: frame.height - 40)
        finalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        finalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        finalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        finalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true

        premiumStackView.addArrangedSubview(nameLabel)
        premiumStackView.addArrangedSubview(priceStackView)
                
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(durationLabel)
                
    }
    
    @objc func handelGetPremium(){
        
    }
}
