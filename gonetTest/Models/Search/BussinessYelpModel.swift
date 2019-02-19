//
//  BussinessYelpModel.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/17/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

public class BussinessYelpModel: NSObject {

    fileprivate var id: String?
    fileprivate var alias: String?
    fileprivate var name: String?
    fileprivate var image_url: String?
    fileprivate var is_closed: Bool?
    fileprivate var url: String?
    fileprivate var review_count: NSNumber?
    fileprivate var categories: [CategorieYelpModel]?
    fileprivate var rating: NSNumber?
    fileprivate var coordinates: CoordinatesYelpModel?
    fileprivate var price: String?
    fileprivate var location: LocationYelpModel?
    fileprivate var phone: String?
    fileprivate var display_phone: String?
    fileprivate var distance: NSNumber?
    
    public override init() {
        super.init()
        
        self.id = String.Empty
        self.alias = String.Empty
        self.name = String.Empty
        self.image_url = String.Empty
        self.is_closed = false
        self.url = String.Empty
        self.review_count = NSNumber()
        self.categories = [CategorieYelpModel]()
        self.rating = NSNumber()
        self.coordinates = CoordinatesYelpModel()
        self.price = String.Empty
        self.location = LocationYelpModel()
        self.phone = String.Empty
        self.display_phone = String.Empty
        self.distance = NSNumber()
    }
    init(id: String,
         alias: String,
         name: String,
         image_url: String,
         is_closed: Bool,
         url: String,
         review_count: NSNumber,
         categories: [CategorieYelpModel],
         rating: NSNumber,
         coordinates: CoordinatesYelpModel,
         price: String,
         location: LocationYelpModel,
         phone: String,
         display_phone: String,
         distance: NSNumber) {
        
        self.id = id
        self.alias = alias
        self.name = name
        self.image_url = image_url
        self.is_closed = is_closed
        self.url = url
        self.review_count = review_count
        self.categories = categories
        self.rating = rating
        self.coordinates = coordinates
        self.price = price
        self.location = location
        self.phone = phone
        self.display_phone = display_phone
        self.distance = distance
    }
    public convenience init(json: NSDictionary) {
        let id = json["id"] as? String ?? String.Empty
        let alias = json["alias"] as? String ?? String.Empty
        let name = json["name"] as? String ?? String.Empty
        let image_url = json["image_url"] as? String ?? String.Empty
        let is_closed = json["is_closed"] as? Bool ?? false
        let url = json["url"] as? String ?? String.Empty
        let review_count = json["review_count"] as? NSNumber ?? NSNumber()
        
        let categoriesRow = json["categories"] as? [NSDictionary] ?? [NSDictionary]()
        var categories = [CategorieYelpModel]()
        for categorieRow in categoriesRow {
            let categorie = CategorieYelpModel(json: categorieRow)
            categories.append(categorie)
        }
        
        let rating = json["rating"] as? NSNumber ?? NSNumber()
        
        let coordinatesRow = json["coordinates"] as? NSDictionary ?? NSDictionary()
        let coordinates = CoordinatesYelpModel(json: coordinatesRow)
        
        let price = json["price"] as? String ?? String.Empty
        
        let locationRow = json["location"] as? NSDictionary ?? NSDictionary()
        let location = LocationYelpModel(json: locationRow)
        
        let phone = json["phone"] as? String ?? String.Empty
        let display_phone = json["display_phone"] as? String ?? String.Empty
        let distance = json["distance"] as? NSNumber ?? NSNumber()
        
        self.init(id: id,
                  alias: alias,
                  name: name,
                  image_url: image_url,
                  is_closed: is_closed,
                  url: url,
                  review_count: review_count,
                  categories: categories,
                  rating: rating,
                  coordinates: coordinates,
                  price: price,
                  location: location,
                  phone: phone,
                  display_phone: display_phone,
                  distance: distance)
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
    public var ImageUrl: String {
        get {
            return self.image_url ?? String.Empty
        } set {
            self.image_url = newValue
        }
    }
    public var IsClosed: Bool {
        get {
            return self.is_closed ?? false
        } set {
            self.is_closed = newValue
        }
    }
    public var Url: String {
        get {
            return self.url ?? String.Empty
        } set {
            self.url = newValue
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
    public var Coordinates: CoordinatesYelpModel {
        get {
            return self.coordinates ?? CoordinatesYelpModel()
        } set {
            self.coordinates = newValue
        }
    }
    public var Price: String {
        get {
            return self.price ?? String.Empty
        } set {
            self.price = newValue
        }
    }
    public var Location: LocationYelpModel {
        get {
            return self.location ?? LocationYelpModel()
        } set {
            self.location = newValue
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
    public var Distance: NSNumber {
        get {
            return self.distance ?? NSNumber()
        } set {
            self.distance = newValue
        }
    }
    override public var description: String {
        var _description = "\n"
        _description += "id: \(String(describing: self.id ?? String.Empty))\n"
        _description += "alias: \(String(describing: self.alias ?? String.Empty))\n"
        _description += "name: \(String(describing: self.name ?? String.Empty))\n"
        _description += "image_url: \(String(describing: self.image_url ?? String.Empty))\n"
        _description += "is_closed: \(String(describing: self.is_closed?.description ?? String.Empty))\n"
        _description += "url: \(String(describing: self.url ?? String.Empty))\n"
        _description += "review_count: \(String(describing: self.review_count?.description ?? String.Empty))\n"
        _description += "categories: \(String(describing: self.categories?.description ?? String.Empty))\n"
        _description += "rating: \(String(describing: self.rating?.description ?? String.Empty))\n"
        _description += "coordinates: \(String(describing: self.coordinates?.description ?? String.Empty))\n"
        _description += "price: \(String(describing: self.price?.description ?? String.Empty))\n"
        _description += "location: \(String(describing: self.location?.description ?? String.Empty))\n"
        _description += "phone: \(String(describing: self.phone ?? String.Empty))\n"
        _description += "display_phone: \(String(describing: self.display_phone ?? String.Empty))\n"
        _description += "distance: \(String(describing: self.distance?.description ?? String.Empty))\n"
        
        return _description
    }
}






































