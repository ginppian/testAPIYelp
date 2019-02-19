//
//  CategorieYelpModel.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/17/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

public class CategorieYelpModel: NSObject {
    
    fileprivate var alias: String?
    fileprivate var title: String?
    
    override public init() {
        super.init()
        
        self.alias = String.Empty
        self.title = String.Empty
    }
    init(alias: String, title: String) {
        self.alias = alias
        self.title = title
    }
    public convenience init(json: NSDictionary) {
        let alias = json["alias"] as? String ?? String.Empty
        let title = json["title"] as? String ?? String.Empty
        
        self.init(alias: alias, title: title)
    }
    public var Alias: String {
        get {
            return self.alias ?? String.Empty
        }
        set {
            self.alias = newValue
        }
    }
    public var Title: String {
        get {
            return self.title ?? String.Empty
        }
        set {
            self.title = newValue
        }
    }
    override public var description: String {
        var _description = "\n"
        _description += "alias: \(String(describing: self.alias ?? String.Empty))\n"
        _description += "title: \(String(describing: self.title ?? String.Empty))\n"
        
        return _description
    }
}
