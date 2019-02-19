//
//  RegionYelpModel.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/17/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

public class RegionYelpModel: NSObject {
    
    fileprivate var center: CenterYelpModel?
    
    override public init() {
        super.init()
        
        self.center = CenterYelpModel()
    }
    init(center: CenterYelpModel) {
        self.center = center
    }
    public convenience init(json: NSDictionary) {
        let centerRow = json["center"] as? NSDictionary ?? NSDictionary()
        let center = CenterYelpModel(json: centerRow)
        
        self.init(center: center)
    }
    public var Center: CenterYelpModel {
        get {
            return self.center ?? CenterYelpModel()
        }
        set {
            self.center = newValue
        }
    }
    override public var description: String {
        var _description = "\n"
        _description += "center: \(String(describing: self.center?.description ?? String.Empty))\n"
        
        return _description
    }
}
