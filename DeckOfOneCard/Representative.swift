//
//  Representative.swift
//  DeckOfOneCard
//
//  Created by Jeff Norton on 7/11/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation

class Representative {
    
    // MARK: - Stored Properties
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    private let nameKey = "name"
    private let partyKey = "party"
    private let stateKey = "state"
    private let districtKey = "district"
    private let phoneKey = "phone"
    private let officeKey = "office"
    private let linkKey = "link"
    
    // MARK: - Initiaizer(s)
    
    init?(dictionary: [String : AnyObject]) {
        
        guard let name = dictionary[nameKey] as? String
            , party = dictionary[partyKey] as? String
            , state = dictionary[stateKey] as? String
            , district = dictionary[districtKey] as? String
            , phone = dictionary[phoneKey] as? String
            , office = dictionary[officeKey] as? String
            , link = dictionary[linkKey] as? String
        else { return nil }
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
        
    }
    
}