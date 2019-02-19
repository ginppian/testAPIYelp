//
//  OpenYelpModel.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/17/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

public class OpenYelpModel: NSObject {
    
    fileprivate var is_overnight: Bool?
    fileprivate var start: String?
    fileprivate var end: String?
    fileprivate var day: NSNumber?

    public override init() {
        super.init()
        
        self.is_overnight = false
        self.start = String.Empty
        self.end = String.Empty
        self.day = NSNumber()
    }
    init(is_overnight: Bool, start: String, end: String, day: NSNumber) {
        
        self.is_overnight = is_overnight
        self.start = start
        self.end = end
        self.day = day
    }
    public convenience init(json: NSDictionary) {
        
        let is_overnight = json["is_overnight"] as? Bool ?? false
        let start = json["start"] as? String ?? String.Empty
        let end = json["end"] as? String ?? String.Empty
        let day = json["day"] as? NSNumber ?? NSNumber()
        
        self.init(is_overnight: is_overnight, start: start, end: end, day: day)
    }
    public var IsOvernight: Bool {
        get {
            return self.is_overnight ?? false
        } set {
            self.is_overnight = newValue
        }
    }
    public var Start: String {
        get {
            return self.start ?? String.Empty
        } set {
            self.start = newValue
        }
    }
    public var End: String {
        get {
            return self.end ?? String.Empty
        } set {
            self.end = newValue
        }
    }
    public var Day: NSNumber {
        get {
            return self.day ?? NSNumber()
        } set {
            self.day = newValue
        }
    }
    override public var description: String {
        var _description = "\n"
        _description += "is_overnight: \(String(describing: self.is_overnight?.description ?? String.Empty))\n"
        _description += "start: \(String(describing: self.start ?? String.Empty))\n"
        _description += "end: \(String(describing: self.end ?? String.Empty))\n"
        _description += "day: \(String(describing: self.day?.description ?? String.Empty))\n"
        
        return _description
    }
}
