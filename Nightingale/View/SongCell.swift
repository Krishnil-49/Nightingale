//
//  SongCell.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 05/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit

class SongCell: UICollectionViewCell{
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "senorita")
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let name: UILabel = {  
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senorita"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(imageView)
        addSubview(name)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        name.frame = CGRect(x: 0, y: frame.width, width: frame.width, height: 44)
    }
    
}
