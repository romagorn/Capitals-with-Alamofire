//
//  Country.swift
//  AlamofireCapitals
//
//  Created by SalemMacPro on 06.03.2021.
//

import Foundation

struct Country: Decodable {
    var name:String?
    var capital:String?
    var countryCode:String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case capital = "capital"
        case countryCode = "alpha3Code"
    }
    
    
}
