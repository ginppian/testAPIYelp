//
//  SearchYelpModel.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/15/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

public class BussinessSearchYelpModel: NSObject {
    
    fileprivate var businesses: [BussinessYelpModel]?
    fileprivate var total: NSNumber?
    fileprivate var region: RegionYelpModel?
    
    public override init() {
        super.init()
        
        self.businesses = [BussinessYelpModel]()
        self.total = NSNumber()
        self.region = RegionYelpModel()
    }
    init(businesses: [BussinessYelpModel], total: NSNumber, region: RegionYelpModel) {
        
        self.businesses = businesses
        self.total = total
        self.region = region
    }
    convenience init(json: NSDictionary) {
        
        let businessesRow = json["businesses"] as? [NSDictionary] ?? [NSDictionary]()
        var businesses = [BussinessYelpModel]()
        for businessRow in businessesRow {
            let business = BussinessYelpModel(json: businessRow)
            businesses.append(business)
        }
        
        let total = json["total"] as? NSNumber ?? NSNumber()
        print(total.intValue)
        
        let regionRow = json["region"] as? NSDictionary ?? NSDictionary()
        let region = RegionYelpModel(json: regionRow)
        
        self.init(businesses: businesses, total: total, region: region)
    }
    public var Businesses: [BussinessYelpModel] {
        get {
            return self.businesses ?? [BussinessYelpModel]()
        } set {
            self.businesses = newValue
        }
    }
    public var Total: NSNumber {
        get {
            return self.total ?? NSNumber()
        } set {
            self.total = newValue
        }
    }
    public var Region: RegionYelpModel {
        get {
            return self.region ?? RegionYelpModel()
        } set {
            self.region = newValue
        }
    }
    override public var description: String {
        var _description = "\n"
        _description += "businesses: \(String(describing: self.businesses?.description ?? String.Empty))\n"
        _description += "total: \(String(describing: self.total?.description ?? String.Empty))\n"
        _description += "region: \(String(describing: self.region?.description ?? String.Empty))\n"
        
        return _description
    }
}
