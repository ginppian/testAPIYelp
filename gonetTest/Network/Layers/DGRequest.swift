//
//  Request.swift
//  DGNetworkService
//
//  Created by Gmo Ginppian on 1/8/19.
//  Copyright © 2019 gonet. All rights reserved.
//

import Foundation

class DGRequest: DGSubmit {
    
    private func buildRequest(url: String,
                              method: String,
                              extraHeaders: [String: String]? = nil,
                              bodyData: Any? = nil)
        -> URLRequest? {
            
            if let nsurl = URL(string: url) {
                var request = URLRequest(url: nsurl)
                
                if method == DGHttpMethods.POST {
                    do {
                        request.httpBody = try JSONSerialization.data(withJSONObject: bodyData ?? [], options: [])
                    }
                    catch let error {
                        print("🔶🔶🔶 Warning :: No se puede castear el body a json...\n body se envía como nil -> commonHttpRest: \(error)")
                        request.httpBody = nil
                    }
                }
                
                request.httpMethod          = method
                request.timeoutInterval     = DGUtilities.TimeOutInterval
                request.allHTTPHeaderFields = DGUtilities.BasicHeaderFields
                
                if let headers = extraHeaders, headers.count > 0 {
                    for (key, value) in headers {
                        request.addValue(value, forHTTPHeaderField: key)
                    }
                }
                
                return request
            }
            
            return nil
    }
    
    internal func httpGet(url: String,
                          extraHeaders: [String: String]? = nil,
                          completion: @escaping (_ error: String, _ json: NSDictionary?) -> Void)
        -> Void {

            if let eh = extraHeaders {
                for (key, value) in eh {
                    print("key: \(key)")
                    print("value: \(value)")
                }
            }


            if DGReachability.isConnectedToNetwork() {
                let requestGet = buildRequest(url: url, method: DGHttpMethods.GET, extraHeaders: extraHeaders)
                
                if let request = requestGet {
                    submit(request: request) { (submitError, submitJson) in
                        completion(submitError, submitJson)
                    }
                } else {
                    completion("🔴🔴🔴 ERROR :: Error al crear el Request, posiblemente la urlString sea inválida!!", nil)
                }
            } else {
                completion("🔴🔴🔴 ERROR No se encontró una conexión a internet::", nil)
            }
            
    }
    
    internal func httpPost(url: String,
                           extraHeaders: [String: String]? = nil,
                           bodyData: Any? = nil,
                           completion: @escaping (_ error: String, _ json: NSDictionary?) -> Void)
        -> Void {
            
            if DGReachability.isConnectedToNetwork() {
                let requestPost = buildRequest(url: url, method: DGHttpMethods.POST, extraHeaders: extraHeaders, bodyData: bodyData)
                
                if let request = requestPost {
                    submit(request: request) { (submitError, submitJson) in
                        completion(submitError, submitJson)
                    }
                } else {
                    completion("🔴🔴🔴 ERROR :: Error al crear el Request, posiblemente la urlString sea inválida!!", nil)
                }
            } else {
                completion("🔴🔴🔴 ERROR No se encontró una conexión a internet", nil)
            }
    
    }
    
    internal func httpDelete(urlStr: String,
                             extraHeaders: [String: String]? = nil,
                             completion: @escaping (_ error: String, _ json: NSDictionary?) -> Void) {
        
        if DGReachability.isConnectedToNetwork() {
            let requestPost = buildRequest(url: urlStr, method: DGHttpMethods.DELETE, extraHeaders: extraHeaders)
            
            if let request = requestPost {
                submit(request: request) { (submitError, submitJson) in
                    completion(submitError, submitJson)
                }
            } else {
                completion("🔴🔴🔴 ERROR :: Error al crear el Request, posiblemente la urlString sea inválida!!", nil)
            }
        } else {
            completion("🔴🔴🔴 ERROR No se encontró una conexión a internet", nil)
        }
    }
    
}
