//
//  FilterManager.swift
//  CarList_CFT_HW1
//
//  Created by Anatoliy Mamchenko on 19.04.2021.
//

import Foundation
import UIKit

class FilterManager {
   
    func filterList (type: Body, arrayOfObject: [CarModel], complition: @escaping ([CarModel]) -> ()) {
        let array = Singleton.shared.arrayOfCars.filter{$0.body == type}
        complition(array)
    }
}
