//
//  Sound.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 20/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import Foundation

struct Sound{
    
    let name: String?
    let imageName: String?
    let URl: String?
    
    init(name: String, imageName: String, url: String) {
        self.name = name
        self.imageName = imageName
        self.URl = url
    }
    
}
