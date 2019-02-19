//
//  Submit.swift
//  DGNetworkService
//
//  Created by Gmo Ginppian on 1/8/19.
//  Copyright © 2019 gonet. All rights reserved.
//

import Foundation

class DGSubmit: NSObject {
    
    private var session: URLSession?
    private var dataTask: URLSessionDataTask?
    
    override init() {
        super.init()
        session = URLSession(configuration: .default)
        // SSL
        //session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    }
    
    internal func submit(request: URLRequest,
                completion: @escaping (_ error: String, _ json: NSDictionary?) -> Void)
        -> Void {
        
        dataTask = session?.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard error == nil else {
                completion("🔴🔴🔴 ERROR :: \(error?.localizedDescription ?? String.Empty)", nil)
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                
                switch httpResponse.statusCode {
                case 200...299:
                    print("🔵🔵🔵 SUCCESS :: Status: \(httpResponse.statusCode)")
                    break
                case 400...499:
                    completion("🔴🔴🔴 ERROR :: Error de comunicaciones, favor de reintentar mas tarde\n...Status Code: \(httpResponse.statusCode)", nil)
                    return
                case 500...599:
                    completion("🔴🔴🔴 ERROR :: Servicio no disponible, favor de reintentar mas tarde\n...Status Code: \(httpResponse.statusCode)", nil)
                    return
                default:
                    completion("🔴🔴🔴 ERROR :: Cuidado, entró en default statusCode: \(httpResponse.statusCode)", nil)
                    return
                }
            }
            else { // Response nil
                completion("🔴🔴🔴 ERROR :: No llego nada del response: \(String(describing: response))", nil)
                return
            }
            if let data = data {
                do {
                    // Puede ser un arreglo
                    if let rawArr = try JSONSerialization.jsonObject(with: data, options: []) as? NSArray {
                        let dic: NSDictionary = ["genericList": rawArr]
                        completion(String.Empty, dic)
                    }
                    else if let rawDic = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                        completion(String.Empty, rawDic)
                    }
                    else {
                        completion("🔴🔴🔴 ERROR :: Error al castear el json", nil)
                    }
                    
                } catch let error {
                    completion("🔴🔴🔴 ERROR :: Cargar Json - \(error.localizedDescription)", nil)
                }
            } else {
                completion("🔴🔴🔴 ERROR :: Data es Nulo", nil)
            }
        })
        dataTask?.resume()
    }
}

// SSL Pinning
extension DGSubmit: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
            if let serverTrust = challenge.protectionSpace.serverTrust {
                var secresult = SecTrustResultType.invalid
                let status = SecTrustEvaluate(serverTrust, &secresult)
                
                if(errSecSuccess == status) {
                    if let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) {
                        let serverCertificateData = SecCertificateCopyData(serverCertificate)
                        let data = CFDataGetBytePtr(serverCertificateData);
                        let size = CFDataGetLength(serverCertificateData);
                        let cert1 = NSData(bytes: data, length: size)
                        let file_der = Bundle.main.path(forResource: "name-of-cert-file", ofType: "cer")
                        
                        if let file = file_der {
                            if let cert2 = NSData(contentsOfFile: file) {
                                if cert1.isEqual(to: cert2 as Data) {
                                    completionHandler(URLSession.AuthChallengeDisposition.useCredential, URLCredential(trust:serverTrust))
                                    return
                                }
                            }
                        }
                    }
                }
            }
        }
        
        // Pinning failed
        completionHandler(URLSession.AuthChallengeDisposition.cancelAuthenticationChallenge, nil)
    }
}


//font: https://stackoverflow.com/questions/34223291/ios-certificate-pinning-with-swift-and-nsurlsession
/*
 func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void) {
 
 // Adapted from OWASP https://www.owasp.org/index.php/Certificate_and_Public_Key_Pinning#iOS
 
 if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
 if let serverTrust = challenge.protectionSpace.serverTrust {
 var secresult = SecTrustResultType.invalid
 let status = SecTrustEvaluate(serverTrust, &secresult)
 
 if(errSecSuccess == status) {
 if let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) {
 let serverCertificateData = SecCertificateCopyData(serverCertificate)
 let data = CFDataGetBytePtr(serverCertificateData);
 let size = CFDataGetLength(serverCertificateData);
 let cert1 = NSData(bytes: data, length: size)
 let file_der = Bundle.main.path(forResource: "name-of-cert-file", ofType: "cer")
 
 if let file = file_der {
 if let cert2 = NSData(contentsOfFile: file) {
 if cert1.isEqual(to: cert2 as Data) {
 completionHandler(URLSession.AuthChallengeDisposition.useCredential, URLCredential(trust:serverTrust))
 return
 }
 }
 }
 }
 }
 }
 }
 
 // Pinning failed
 completionHandler(URLSession.AuthChallengeDisposition.cancelAuthenticationChallenge, nil)
 }

 */
