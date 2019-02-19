//
//  HourYelpModel.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/17/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

public class HourYelpModel: NSObject {
    
    fileprivate var openArr: [OpenYelpModel]?
    fileprivate var hours_type: String?
    fileprivate var is_open_now: Bool?
    
    override public init() {
        super.init()
        
        self.openArr = [OpenYelpModel]()
        self.hours_type = String.Empty
        self.is_open_now = false
    }
    
    init(openArr: [OpenYelpModel], hours_type: String, is_open_now: Bool) {
        self.openArr = openArr
        self.hours_type = hours_type
        self.is_open_now = is_open_now
    }
    public convenience init(json: NSDictionary) {
        
        let openArrRow = json["open"] as? [NSDictionary] ?? [NSDictionary]()
        var openArr = [OpenYelpModel]()
        for openRow in openArrRow {
            let open = OpenYelpModel(json: openRow)
            openArr.append(open)
        }
        
        let hours_type = json["hours_type"] as? String ?? String.Empty
        let is_open_now = json["is_open_now"] as? Bool ?? false

        self.init(openArr: openArr,
                  hours_type: hours_type,
                  is_open_now: is_open_now)
    }
    public var OpenArr: [OpenYelpModel] {
        get {
            return self.openArr ?? [OpenYelpModel]()
        } set {
            self.openArr = newValue
        }
    }
    public var HoursType: String {
        get {
            return self.hours_type ?? String.Empty
        } set {
            self.hours_type = newValue
        }
    }
    public var IsOpenNow: Bool {
        get {
            return self.is_open_now ?? false
        } set {
            self.is_open_now = newValue
        }
    }
    override public var description: String {
        var _description = "\n"
        _description += "openArr: \(String(describing: self.openArr?.description ?? String.Empty))\n"
        _description += "hours_type: \(String(describing: self.hours_type ?? String.Empty))\n"
        _description += "is_open_now: \(String(describing: self.is_open_now?.description ?? String.Empty))\n"
        
        return _description
    }
}



























