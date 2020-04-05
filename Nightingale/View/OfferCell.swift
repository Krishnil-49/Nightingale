//
//  OfferCell.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 23/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit

class OfferCell: UICollectionViewCell {
    
    let freeOfferView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return view
    }()
    
    let freeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "FREE"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.8028434327, green: 0.8028434327, blue: 0.8028434327, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let freeOfferLabel: UILabel = {
        let label = UILabel()
        label.text = "Ad breaks"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let premiumOfferView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return view
    }()
    
    let premiumTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "PREMIUM"
        label.textColor = #colorLiteral(red: 0.8028434327, green: 0.8028434327, blue: 0.8028434327, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let premiumOfferLabel: UILabel = {
        let label = UILabel()
        label.text = "Ad-free music"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpViews(){
        
        addSubview(freeOfferView)
        freeOfferView.addSubview(freeTitleLabel)
        freeOfferView.addSubview(freeOfferLabel)
        addSubview(premiumOfferView)
        premiumOfferView.addSubview(premiumTitleLabel)
        premiumOfferView.addSubview(premiumOfferLabel)
        
        freeOfferView.frame = CGRect(x: 0, y: 0, width: frame.width/2, height: frame.height)
        freeTitleLabel.frame = CGRect(x: 0, y: 5, width: freeOfferView.frame.width, height: 20)
        freeOfferLabel.frame = CGRect(x: 6, y: 30, width: freeOfferView.frame.width-12, height: freeOfferView.frame.height-40)
        
        premiumOfferView.frame = CGRect(x: frame.width/2, y: 0, width: frame.width/2, height: frame.height)
        premiumTitleLabel.frame = CGRect(x: 0, y: 5, width: premiumOfferView.frame.width, height: 20)
        premiumOfferLabel.frame = CGRect(x: 6, y: 30, width: premiumOfferView.frame.width-12, height: premiumOfferView.frame.height-40)
        
    }
    
}
