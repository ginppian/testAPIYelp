//
//  Extensions.swift
//  gonetTest
//
//  Created by Gmo Ginppian on 2/15/19.
//  Copyright © 2019 ginppian. All rights reserved.
//

import Foundation

extension String {
    public static let Empty = String()
}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
