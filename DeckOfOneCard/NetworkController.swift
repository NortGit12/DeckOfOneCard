//
//  NetworkController.swift
//  DeckOfOneCard
//
//  Created by Jeff Norton on 7/11/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation

class NetworkController {
    
    // MARK: - Stored Properties
    
    /*
     * HTTP         CRUD
     * --------     --------
     *  POST         Create
     *  GET          Read
     *  PUT          Update/Replace
     *  PATCH        Update/Modify
     *  DELETE       Delete
     */
 
    enum HTTPMethod: String {
        
        case Get = "GET"
        case Put = "PUT"
        case Post = "POST"
        case Patch = "PATCH"
        case Delete = "DELETE"
        
    }
    
    // MARK: - Method(s)
    
    static func performRequestForURL(url: NSURL, httpMethod: HTTPMethod, urlParameters: [String : String]? = nil, jsonSuffix: String?, body: NSData? = nil, completion: ((data: NSData?, error: NSError?) -> Void)?) {
        
        // Process base URL and parameters
        
        var requestURL = urlFromParameters(url, urlParameters: urlParameters)
        
        // Append the json string to the end
        
        if let jsonSuffix = jsonSuffix {
            
            let jsonStringAdded = "\(requestURL)\(jsonSuffix)"
            
            guard let jsonRequestURL = NSURL(string: jsonStringAdded) else { return }
            
            requestURL = jsonRequestURL
            
        }
        
        // Finish configuring the request
        
        let request = NSMutableURLRequest(URL: requestURL)
        
        request.HTTPMethod = httpMethod.rawValue
        request.HTTPBody = body
        
        // Make the NSURLSession
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) in
            
            if let completion = completion {
                
                completion(data: data, error: error)
                
            }
            
        }
        
        dataTask.resume()
        
    }
    
    static func urlFromParameters(url: NSURL, urlParameters: [String : String]?) -> NSURL {
        
        let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: true)
        
        components?.queryItems = urlParameters?.flatMap({NSURLQueryItem(name: $0.0, value: $0.1)})
        
        if let url = components?.URL {
            return url
        } else {
            fatalError("URL optional is nil")
        }
        
    }
    
}