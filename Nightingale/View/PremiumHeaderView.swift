//
//  PremiumHeaderView.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 22/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit

class PremiumHeaderView: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let offerCellID = "OfferCellID"
    
    let freeOfferLabelText: [String] = ["Ad breaks", "Play in shuffle", "6 skips per hour", "Streaming only", "Basic audio quality"]
    let premiumOfferLabelText: [String] = ["Ad-free music", "Play any song", "Unlimited skips", "Offline listening", "Extreme audio quality"]
    
    let offerLabel: UILabel = {
        let label = UILabel()
        label.text = "Try Premium free for 1 month"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let offersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.clipsToBounds = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.backgroundColor = .black
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
//    let seperatorView: UIView = {
//        let view = UIView()
//        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        offersCollectionView.delegate = self
        offersCollectionView.dataSource = self
        offersCollectionView.register(OfferCell.self, forCellWithReuseIdentifier: offerCellID)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpViews(){
        addSubview(offerLabel)
        addSubview(offersCollectionView)
        addSubview(pageControl)
//        addSubview(seperatorView)
        
        offerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        offerLabel.widthAnchor.constraint(equalToConstant: (frame.width/5)*4).isActive = true
        offerLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        offersCollectionView.topAnchor.constraint(equalTo: offerLabel.bottomAnchor, constant: 30).isActive = true
        offersCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        offersCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        offersCollectionView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        pageControl.topAnchor.constraint(equalTo: offersCollectionView.bottomAnchor).isActive = true
//        pageControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
//        seperatorView.frame = CGRect(x: 12, y: frame.height-2, width: frame.width-24, height: 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: offerCellID, for: indexPath) as! OfferCell
        
        cell.freeOfferLabel.text = freeOfferLabelText[indexPath.item]
        cell.premiumOfferLabel.text = premiumOfferLabelText[indexPath.item]
        
        cell.layer.cornerRadius = 12
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (frame.width/3)*2
        return .init(width: width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: (frame.width/3)/2, bottom: 0, right: (frame.width/3)/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return frame.width/3
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/frame.width)
    }
    
}
