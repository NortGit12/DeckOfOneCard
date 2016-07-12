//
//  RepresentativeController.swift
//  DeckOfOneCard
//
//  Created by Jeff Norton on 7/11/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    // MARK: - Stored Properties
    
    static let baseURL = NSURL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static private let resultsKey = "results"
    static private let jsonSuffix = "&output=json"
    
    // MARK: - Method(s)
    
    static func getRepresentativesByState(state: String, completion: ((representatives: [Representative]) -> Void)) {
        
        // Unwrap our base URL
        
        guard let url = baseURL else { fatalError("URL optional is nil") }
        
        let urlParameters = ["state": "\(state)"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters, jsonSuffix: jsonSuffix) { (data, error) in
            
            if let data = data
                , responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding)  {
                
                guard let jsonDictionary = ( try? NSJSONSerialization.JSONObjectWithData(data, options: []) ) as? [String : AnyObject], resultsArrayOfDictionaries = jsonDictionary[resultsKey] as? [[String : AnyObject]] else {
                
                
                    print("Unable to serialize JSON.  \nresponseDataString = \(responseDataString)")
                    completion(representatives: [])
                    return
                    
                }
                
                let representatives = resultsArrayOfDictionaries.flatMap{ Representative(dictionary: $0) }
                completion(representatives: representatives)
                
            } else {
                
                print("No data returned from network request")
                completion(representatives: [])
                
            }
            
        }
        
    }
    
}