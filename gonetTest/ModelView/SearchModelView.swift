//
//  File.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/18/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

public class SearchModelView: NSObject {
    public class func searchDistance(bussiness: BussinessYelpModel) -> String {
        let distanceRow = bussiness.Distance.doubleValue
        let distanceKm = Double((distanceRow / 1000)).rounded(toPlaces: 3)
        return "\(distanceKm) Km"
    }
    public class func searchRating(bussiness: BussinessYelpModel) -> String {
        let rating = bussiness.Rating.decimalValue
        return "Rating: \(rating)"
    }
    public class func searchAddress(bussiness: BussinessYelpModel) -> String {
        return "Address: \(bussiness.Location.City)"
    }
    public class func searchImg(bussiness: BussinessYelpModel) -> URL {
        return URL(string: bussiness.ImageUrl)!
    }
    public class func searchName(bussiness: BussinessYelpModel) -> String {
        return "\(bussiness.Name)"
    }
}
