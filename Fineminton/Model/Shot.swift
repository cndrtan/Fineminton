//
//  Shot.swift
//  Fineminton
//
//  Created by Theresia Saputri on 26/08/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct Shot: Hashable, Codable, Identifiable{
    var id: Int
    var shotName: String
    var shotImage: String
    var shotSummary: String
    var shotDescription: String
    var isOpen: Bool
}
