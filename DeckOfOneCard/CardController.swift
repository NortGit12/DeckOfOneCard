//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Jeff Norton on 7/11/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation

class CardController {
    
    // MARK: - Stored Properties
    
    static let baseURL = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/")
    
    static private let cardsKey = "cards"
    
    // MARK: - Method(s)
    
    static func drawCards(numberOfCards: Int, completion: ((cards: [Card]) -> Void)) {
        
        // Unwrap our base URL
        
        guard let url = baseURL else { fatalError("URL optional is nil") }
        
        let urlParameters = ["count": "\(numberOfCards)"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            
            if let data = data
            , responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding)  {
                
                guard let jsonDictionary = ( try? NSJSONSerialization.JSONObjectWithData(data, options: []) ) as? [String : AnyObject], cardsArray = jsonDictionary[cardsKey] as? [[String : AnyObject]]else {
                
                    print("Unable to serialize JSON.  \n\(responseDataString)")
                    completion(cards: [])
                    return
                
                }
                
                let cards = cardsArray.flatMap{ Card(dictionary: $0) }
                completion(cards: cards)
                
            } else {
                
                print("No data returned from network request")
                completion(cards: [])
                
            }
            
        }
        
    }
    
}