//
//  CarModel.swift
//  CarList_CFT_HW1
//
//  Created by Anatoliy Mamchenko on 19.04.2021.
//

import Foundation


struct CarModel {
    var manufacture: String
    var model: String
    var carNumber: String
    var yearOfIssure: Int?
    var body: Body
}

enum Body: String, CaseIterable {
    case PickUp = "pickUp"
    case Roadster = "Roadster"
    case Minivan = "Minivan"
    case Coupe = "coupe"
    case Track = "Track"
}
