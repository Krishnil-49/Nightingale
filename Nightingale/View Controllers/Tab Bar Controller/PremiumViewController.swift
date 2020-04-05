//
//  PremiumViewController.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 05/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit

class PremiumViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    fileprivate let headerID = "PremiumHeader"
    fileprivate let cellID = "PremiumCell"
    
    let premiumPackageDetails: [Premium] = [
        Premium(name: "Premium Prepaid", price: "From ₹13.00", duration: "/DAY", feature: "Choose a day, week or month of Premium. • Pay with PayTM or UPI. • Top up when you want", buttonTitle: "GET PREMIUM", termsAndCondition: "Prices vary according to duration of plan. Terms and condition apply"),
        Premium(name: "Premium Individual", price: "Free", duration: "FOR 1 MONTH", feature: "Ad-free music • Download to listern offline • Unlimited skips • On-demand playback • Cancel anytime", buttonTitle: "TRY 1 MONTH FREE", termsAndCondition: "Only ₹119.00/month after offer period. Cancel anytime. Terms and condition apply."),
        Premium(name: "Premium Student", price: "Free", duration: "FOR 1 MONTH", feature: "Ad-free music • Download to listern offline • Unlimited skips • On-demand playback • Cancel anytime", buttonTitle: "TRY 1 MONTH FREE", termsAndCondition: "Only ₹59.00/month after offer period. Cancel anytime. Terms and condition apply."),
        Premium(name: "Premium Family", price: "Free", duration: "FOR 1 MONTH", feature: "Up to 6 Premium accounts • Family Mix: shared playlist • Block explicit music • Ad-free music • Download to listern offline • Unlimited skips • On-demand playback • Cancel anytime", buttonTitle: "TRY 1 MONTH FREE", termsAndCondition: "Only ₹179.00/month after offer period. For up to 6 family members living at the same address. Terms and condition apply.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(PremiumHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView.register(PremiumCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return premiumPackageDetails.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PremiumCell
        
        let package = premiumPackageDetails[indexPath.row]
                
        switch indexPath.row{
        case 0:
            cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        case 1:
            cell.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        case 2:
            cell.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        case 3:
            cell.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        default:
            cell.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.2586913705, blue: 0.5491294861, alpha: 1)
        }
        
        cell.nameLabel.text = package.name
        cell.priceLabel.text = package.price
        cell.durationLabel.text = package.duration
        cell.featureLabel.text = package.feature
        cell.getPremiumButton.setTitle(package.buttonTitle, for: .normal)
        cell.termsAndConditionLabel.text = package.termsAndCondition
        
        cell.layer.cornerRadius = 14
        cell.layer.masksToBounds = true
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width-20, height: 270)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .init(top: 0, left: 10, bottom: 10, right: 10)
//    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! PremiumHeaderView
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width, height: 320)
    }
}

import SwiftUI

struct MainPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return PremiumViewController(collectionViewLayout: UICollectionViewFlowLayout())
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
        }
    }
}

