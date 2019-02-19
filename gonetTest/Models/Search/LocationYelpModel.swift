//
//  LocationYelpModel.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/17/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

public class LocationYelpModel: NSObject {
    
    fileprivate var address1: String?
    fileprivate var address2: String?
    fileprivate var address3: String?
    fileprivate var city: String?
    fileprivate var zip_code: String?
    fileprivate var country: String?
    fileprivate var state: String?
    fileprivate var display_address: [String]?

    override public init() {
        super.init()
        
        self.address1 = String.Empty
        self.address2 = String.Empty
        self.address3 = String.Empty
        self.city = String.Empty
        self.zip_code = String.Empty
        self.country = String.Empty
        self.state = String.Empty
        self.display_address = [String]()
    }
    init(address1: String,
         address2: String,
         address3: String,
         city: String,
         zip_code: String,
         country: String,
         state: String,
         display_address: [String]) {
        
        self.address1 = address1
        self.address2 = address2
        self.address3 = address3
        self.city = city
        self.zip_code = zip_code
        self.country = country
        self.state = state
        self.display_address = display_address
    }
    public convenience init(json: NSDictionary) {
        
        let address1 = json["address1"] as? String ?? String.Empty
        let address2 = json["address2"] as? String ?? String.Empty
        let address3 = json["address3"] as? String ?? String.Empty
        let city = json["city"] as? String ?? String.Empty
        let zip_code = json["zip_code"] as? String ?? String.Empty
        let country = json["country"] as? String ?? String.Empty
        let state = json["state"] as? String ?? String.Empty
        let display_address = json["display_address"] as? [String] ?? [String]()
        
        self.init(address1: address1,
                  address2: address2,
                  address3: address3,
                  city: city,
                  zip_code: zip_code,
                  country: country,
                  state: state,
                  display_address: display_address)
    }
    public var Address1: String {
        get {
            return self.address1 ?? String.Empty
        } set {
            self.address1 = newValue
        }
    }
    public var Address2: String {
        get {
            return self.address2 ?? String.Empty
        } set {
            self.address2 = newValue
        }
    }
    public var Address3: String {
        get {
            return self.address3 ?? String.Empty
        } set {
            self.address3 = newValue
        }
    }
    public var City: String {
        get {
            return self.city ?? String.Empty
        } set {
            self.city = newValue
        }
    }
    public var ZipCode: String {
        get {
            return self.zip_code ?? String.Empty
        } set {
            self.zip_code = newValue
        }
    }
    public var Country: String {
        get {
            return self.country ?? String.Empty
        } set {
            self.country = newValue
        }
    }
    public var State: String {
        get {
            return self.state ?? String.Empty
        } set {
            self.state = newValue
        }
    }
    public var DisplayAddress: [String] {
        get {
            return self.display_address ?? [String]()
        } set {
            self.display_address = newValue
        }
    }
    override public var description: String {
        var _description = "\n"
        _description += "address1: \(String(describing: self.address1 ?? String.Empty))\n"
        _description += "address2: \(String(describing: self.address2 ?? String.Empty))\n"
        _description += "address3: \(String(describing: self.address3 ?? String.Empty))\n"
        _description += "city: \(String(describing: self.city ?? String.Empty))\n"
        _description += "zip_code: \(String(describing: self.zip_code ?? String.Empty))\n"
        _description += "country: \(String(describing: self.country ?? String.Empty))\n"
        _description += "state: \(String(describing: self.state ?? String.Empty))\n"
        _description += "display_address: \(String(describing: self.display_address?.description ?? String.Empty))\n"
        
        return _description
    }
}
