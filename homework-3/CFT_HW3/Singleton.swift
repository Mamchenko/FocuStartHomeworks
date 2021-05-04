//
//  Singleton.swift
//  CFT_HW3
//
//  Created by Anatoliy Mamchenko on 03.05.2021.
//

import Foundation
import UIKit


class Singleton {
    
    static let shared = Singleton()
    var model: [KicksModel] = [KicksModel(name: "nike blazer", image: UIImage(named: "1") ?? UIImage()), KicksModel(name: "nike blazer", image: UIImage(named: "2") ?? UIImage()), KicksModel(name: "nike blazer", image: UIImage(named: "3") ?? UIImage()), KicksModel(name: "nike blazer", image: UIImage(named: "4") ?? UIImage()), KicksModel(name: "nike blazer", image: UIImage(named: "5") ?? UIImage()), KicksModel(name: "nike blazer", image: UIImage(named: "6") ?? UIImage()), KicksModel(name: "nike blazer", image: UIImage(named: "7") ?? UIImage()), KicksModel(name: "nike blazer", image: UIImage(named: "8") ?? UIImage()), KicksModel(name: "nike blazer", image: UIImage(named: "9") ?? UIImage())]
    private init () {}
    
    
    
   
}
