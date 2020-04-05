//
//  Premium.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 22/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import Foundation

struct Premium {
    
    let name: String?
    let price: String?
    let duration: String?
    let feature: String?
    let buttonTitle: String?
    let termsAndCondition: String?
    
    init(name: String, price: String, duration: String, feature: String, buttonTitle: String, termsAndCondition: String) {
        self.name = name
        self.price = price
        self.duration = duration
        self.feature = feature
        self.buttonTitle = buttonTitle
        self.termsAndCondition = termsAndCondition
    }
    
}
