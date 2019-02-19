//
//  EndPoint.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/15/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

public class EndPoint: NSObject {
    /*
     */
    public class func BusinessSearch(_ search: String,_ latitud: NSNumber,_ longitud: NSNumber, completion: @escaping (_ completion: (BussinessSearchYelpModel?, String)) -> Void) {
        
        let r = DGRequest()
        //let urlStr = Environment.endpoint + "businesses/search?" + "term=" + "\(search)" + "&" + "latitude=\(19.0133)" + "&" + "longitude=\(-98.3933)"
        let urlStr = Environment.endpoint + "businesses/search?" + "term=" + "\(search)" + "&" + "latitude=\(latitud.doubleValue)" + "&" + "longitude=\(longitud.doubleValue)"

        print("urlStr: \(urlStr)")
        
        r.httpGet(url: urlStr, extraHeaders: ["Authorization": "Bearer 6CQBKKR1CW1NXV0gvLAQ_tKtxEP4I0jM78-D3M9E_HDbfu3Ka6uqhPIIb1e8Zbta5DSMi7xE7JbFt2dk8ows4iGHI02yDCHJxxj0yU4RgLpDLwfmmMg0b94X1S1nXHYx"]) { (responseError, responseJsonRow) in
            
            if let jsonRow = responseJsonRow {
                
                let searchYelpModel = BussinessSearchYelpModel(json: jsonRow)
                completion((searchYelpModel, String.Empty))
                
            } else {
                completion((nil, responseError))
            }
        }
    }
    /*
     */
    public class func BussinessDetails(_ id: String, completion: @escaping (_ completion: (BusinessDetailsYelpModel?, String)) -> Void) {
        let r = DGRequest()

        let urlStr = Environment.endpoint + "businesses/" + "\(id)"
        print("urlStr: \(urlStr)")
        
        r.httpGet(url: urlStr, extraHeaders: ["Authorization": "Bearer 6CQBKKR1CW1NXV0gvLAQ_tKtxEP4I0jM78-D3M9E_HDbfu3Ka6uqhPIIb1e8Zbta5DSMi7xE7JbFt2dk8ows4iGHI02yDCHJxxj0yU4RgLpDLwfmmMg0b94X1S1nXHYx"]) { (responseError, responseJsonRow) in
            
            if let jsonRow = responseJsonRow {
                
                let businessDetails = BusinessDetailsYelpModel(json: jsonRow)
                completion((businessDetails, String.Empty))
                
            } else {
                completion((nil, responseError))
            }
        }
    }
}
