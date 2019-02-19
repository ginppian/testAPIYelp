//
//  BusinessDetails.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/17/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

public class BusinessDetailsYelpModel: NSObject {
    
    fileprivate var id: String?
    fileprivate var alias: String?
    fileprivate var name: String?
    fileprivate var image_url: String?
    fileprivate var is_claimed: Bool?
    fileprivate var is_closed: Bool?
    fileprivate var url: String?
    fileprivate var phone: String?
    fileprivate var display_phone: String?
    fileprivate var review_count: NSNumber?
    fileprivate var categories: [CategorieYelpModel]?
    fileprivate var rating: NSNumber?
    fileprivate var location: LocationYelpModel?
    fileprivate var coordinates: CoordinatesYelpModel?
    fileprivate var photos: [String]?
    fileprivate var price: String?
    fileprivate var hours: [HourYelpModel]?
    
    public override init() {
        super.init()
        
        self.id = String.Empty
        self.alias = String.Empty
        self.name = String.Empty
        self.image_url = String.Empty
        self.is_claimed = false
        self.is_closed = false
        self.url = String.Empty
        self.phone = String.Empty
        self.display_phone = String.Empty
        self.review_count = NSNumber()
        self.categories = [CategorieYelpModel]()
        self.rating = NSNumber()
        self.location = LocationYelpModel()
        self.coordinates = CoordinatesYelpModel()
        self.photos = [String]()
        self.price = String.Empty
        self.hours = [HourYelpModel]()
    }
    init(id: String,
         alias: String,
         name: String,
         image_url: String,
         is_claimed: Bool,
         is_closed: Bool,
         url: String,
         phone: String,
         display_phone: String,
         review_count: NSNumber,
         categories: [CategorieYelpModel],
         rating: NSNumber,
         location: LocationYelpModel,
         coordinates: CoordinatesYelpModel,
         photos: [String],
         price: String,
         hours: [HourYelpModel]) {
        
        self.id = id
        self.alias = alias
        self.name = name
        self.image_url = image_url
        self.is_claimed = is_claimed
        self.is_closed = is_closed
        self.url = url
        self.phone = phone
        self.display_phone = display_phone
        self.review_count = review_count
        self.categories = categories
        self.rating = rating
        self.location = location
        self.coordinates = coordinates
        self.photos = photos
        self.price = price
        self.hours = hours
    }
    public convenience init(json: NSDictionary) {
        
        let id = json["id"] as? String ?? String.Empty
        let alias = json["alias"] as? String ?? String.Empty
        let name = json["name"] as? String ?? String.Empty
        let image_url = json["image_url"] as? String ?? String.Empty
        let is_claimed = json["is_claimed"] as? Bool ?? false
        let is_closed = json["is_closed"] as? Bool ?? false
        let url = json["url"] as? String ?? String.Empty
        let phone = json["phone"] as? String ?? String.Empty
        let display_phone = json["display_phone"] as? String ?? String.Empty
        let review_count = json["review_count"] as? NSNumber ?? NSNumber()
        
        let categoriesRow = json["categories"] as? [NSDictionary] ?? [NSDictionary]()
        var categories = [CategorieYelpModel]()
        for categorieRow in categoriesRow {
            let categorie = CategorieYelpModel(json: categorieRow)
            categories.append(categorie)
        }

        let rating = json["rating"] as? NSNumber ?? NSNumber()
        
        let locationRow = json["location"] as? NSDictionary ?? NSDictionary()
        let location = LocationYelpModel(json: locationRow)
        
        let coordinatesRow = json["coordinates"] as? NSDictionary ?? NSDictionary()
        let coordinates = CoordinatesYelpModel(json: coordinatesRow)
        
        let photos = json["photos"] as? [String] ?? [String]()
        let price = json["price"] as? String ?? String.Empty
        
        let hoursRow = json["hours"] as? [NSDictionary] ?? [NSDictionary]()
        var hours = [HourYelpModel]()
        for hourRow in hoursRow {
            let hour = HourYelpModel(json: hourRow)
            hours.append(hour)
        }
        
        self.init(id: id,
                  alias: alias,
                  name: name,
                  image_url: image_url,
                  is_claimed: is_claimed,
                  is_closed: is_closed,
                  url: url,
                  phone: phone,
                  display_phone: display_phone,
                  review_count: review_count,
                  categories: categories,
                  rating: rating,
                  location: location,
                  coordinates: coordinates,
                  photos: photos,
                  price: price,
                  hours: hours)
    }
    public var ID: String {
        get {
            return self.id ?? String.Empty
        } set {
            self.id = newValue
        }
    }
    public var Alias: String {
        get {
            return self.alias ?? String.Empty
        } set {
            self.alias = newValue
        }
    }
    public var Name: String {
        get {
            return self.name ?? String.Empty
        } set {
            self.name = newValue
        }
    }
    public var imageUrl: String {
        get {
            return self.image_url ?? String.Empty
        } set {
            self.image_url = newValue
        }
    }
    public var IsClaimed: Bool {
        get {
            return self.is_claimed ?? false
        } set {
            self.is_claimed = newValue
        }
    }
    public var IsClosed: Bool {
        get {
            return self.is_closed ?? false
        } set {
            self.is_closed = newValue
        }
    }
    public var URL: String {
        get {
            return self.url ?? String.Empty
        } set {
            self.url = newValue
        }
    }
    public var Phone: String {
        get {
            return self.phone ?? String.Empty
        } set {
            self.phone = newValue
        }
    }
    public var DisplayPhone: String {
        get {
            return self.display_phone ?? String.Empty
        } set {
            self.display_phone = newValue
        }
    }
    public var ReviewCount: NSNumber {
        get {
            return self.review_count ?? NSNumber()
        } set {
            self.review_count = newValue
        }
    }
    public var Categories: [CategorieYelpModel] {
        get {
            return self.categories ?? [CategorieYelpModel]()
        } set {
            self.categories = newValue
        }
    }
    public var Rating: NSNumber {
        get {
            return self.rating ?? NSNumber()
        } set {
            self.rating = newValue
        }
    }
    public var Location: LocationYelpModel {
        get {
            return self.location ?? LocationYelpModel()
        } set {
            self.location = newValue
        }
    }
    public var Coordinates: CoordinatesYelpModel {
        get {
            return self.coordinates ?? CoordinatesYelpModel()
        } set {
            self.coordinates = newValue
        }
    }
    public var Photos: [String] {
        get {
            return self.photos ?? [String]()
        } set {
            self.photos = newValue
        }
    }
    public var Price: String {
        get {
            return self.price ?? String.Empty
        } set {
            self.price = newValue
        }
    }
    public var Hours: [HourYelpModel] {
        get {
            return self.hours ?? [HourYelpModel]()
        } set {
            self.hours = newValue
        }
    }
    override public var description: String {
        var _description = "\n"
        _description += "id: \(String(describing: self.id ?? String.Empty))\n"
        _description += "alias: \(String(describing: self.alias ?? String.Empty))\n"
        _description += "name: \(String(describing: self.name ?? String.Empty))\n"
        _description += "image_url: \(String(describing: self.image_url ?? String.Empty))\n"
        _description += "is_claimed: \(String(describing: self.is_claimed?.description ?? String.Empty))\n"
        _description += "is_closed: \(String(describing: self.is_closed?.description ?? String.Empty))\n"
        _description += "url: \(String(describing: self.url ?? String.Empty))\n"
        _description += "phone: \(String(describing: self.phone ?? String.Empty))\n"
        _description += "display_phone: \(String(describing: self.display_phone ?? String.Empty))\n"
        _description += "review_count: \(String(describing: self.review_count?.description ?? String.Empty))\n"
        _description += "categories: \(String(describing: self.categories?.description ?? String.Empty))\n"
        _description += "rating: \(String(describing: self.rating?.description ?? String.Empty))\n"
        _description += "location: \(String(describing: self.location?.description ?? String.Empty))\n"
        _description += "coordinates: \(String(describing: self.coordinates?.description ?? String.Empty))\n"
        _description += "photos: \(String(describing: self.photos?.description ?? String.Empty))\n"
        _description += "price: \(String(describing: self.price?.description ?? String.Empty))\n"
        _description += "hours: \(String(describing: self.hours?.description ?? String.Empty))\n"
        
        return _description
    }
}
