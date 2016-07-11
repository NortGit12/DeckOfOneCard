//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Jeff Norton on 7/11/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation

class Card {
    
    // MARK: - Stored Properties
    
    let suit: String
    let value: String
    let imageURL: String
    
    private let suitKey = "suit"
    private let valueKey = "value"
    private let imageURLKey = "image"
    
    // MARK: - Intializer(s)
    
    init?(dictionary: [String : AnyObject]) {
        
        guard let suit = dictionary[suitKey] as? String, value = dictionary[valueKey] as? String, image = dictionary[imageURLKey] as? String else { return nil }
        
        self.suit = suit
        self.value = value
        self.imageURL = image
        
    }
    
}