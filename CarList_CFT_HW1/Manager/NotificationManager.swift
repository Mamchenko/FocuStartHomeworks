//
//  NotofocationManager.swift
//  CarList_CFT_HW1
//
//  Created by Anatoliy Mamchenko on 20.04.2021.
//

import Foundation

class NotificationManager {
    
    func sendTableViewNotification () {
     NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }
}
