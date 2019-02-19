//
//  SearchCenterYelpModel.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/15/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

public class CenterYelpModel: NSObject {
    
    fileprivate var latitude: NSNumber?
    fileprivate var longitude: NSNumber?
    
    override public init() {
        super.init()
        
        self.latitude = NSNumber()
        self.longitude = NSNumber()
    }
    init(latitude: NSNumber, longitude: NSNumber) {
        self.latitude = latitude
        self.longitude = longitude
    }
    public convenience init(json: NSDictionary) {
        let latitude = json["latitude"] as? NSNumber ?? NSNumber()
        let longitude = json["longitude"] as? NSNumber ?? NSNumber()
        
        self.init(latitude: latitude, longitude: longitude)
    }
    public var Latitude: NSNumber {
        get {
            return self.latitude ?? NSNumber()
        }
        set {
            self.latitude = newValue
        }
    }
    public var Longitude: NSNumber {
        get {
            return self.longitude ?? NSNumber()
        }
        set {
            self.longitude = newValue
        }
    }
    override public var description: String {
        var _description = "\n"
        _description += "latitude: \(String(describing: self.latitude?.description ?? String.Empty))\n"
        _description += "longitude: \(String(describing: self.longitude?.description ?? String.Empty))\n"
        
        return _description
    }
}
