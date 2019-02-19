//
//  DetailModelView.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/19/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation
import UIKit

public class DetailModelView: NSObject {
    public class func detailImg(bussiness: BusinessDetailsYelpModel) -> URL? {
        return URL(string: bussiness.imageUrl)
    }
    public class Name {
        public class func getName(bussiness: BusinessDetailsYelpModel) -> String {
            return bussiness.Name
        }
        public class func height() -> CGFloat {
            return CGFloat(55)
        }
        public class func Title() -> String {
            return "Name:"
        }
    }
    public class Open {
        public class func getOpen(bussiness: BusinessDetailsYelpModel) -> String {
            return "\(bussiness.IsClosed)"
        }
        public class func height() -> CGFloat {
            return CGFloat(44)
        }
        public class func Title() -> String {
            return "Is Open:"
        }
    }
    public class Url {
        public class func getURL(bussiness: BusinessDetailsYelpModel) -> String {
            return bussiness.URL
        }
        public class func height() -> CGFloat {
            return CGFloat(44)
        }
        public class func Title() -> String {
            return "URL:"
        }
    }
    public class Phone {
        public class func getPhone(bussiness: BusinessDetailsYelpModel) -> String {
            return "\(bussiness.DisplayPhone)"
        }
        public class func height() -> CGFloat {
            return CGFloat(44)
        }
        public class func Title() -> String {
            return "Phone:"
        }
    }
    public class Address {
        public class func getAddress(bussiness: BusinessDetailsYelpModel) -> String {
            let arrAdd = bussiness.Location.DisplayAddress
            var newAdd = String.Empty
            for add in arrAdd {
                newAdd += "\(add) "
            }
            return newAdd
        }
        public class func height() -> CGFloat {
            return CGFloat(89)
        }
        public class func Title() -> String {
            return "Address:"
        }
    }
}
