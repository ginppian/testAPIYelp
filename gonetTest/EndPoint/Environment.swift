//
//  Environment.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/15/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

class Environment {
    
    static var endpoint: String!  {
        get {
            
            if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
                if let dic = NSDictionary(contentsOfFile: path) {
                    //print(dic)
                    return dic["ENDPOINT_URL"] as? String ?? String.Empty
                }
            }
            return String.Empty
        }
    }
}
