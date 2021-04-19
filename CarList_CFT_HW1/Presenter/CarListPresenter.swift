//
//  CarListPresenter.swift
//  CarList_CFT_HW1
//
//  Created by Anatoliy Mamchenko on 19.04.2021.
//

import Foundation
import UIKit


 class CarListPresenter: CarListProtocol {
   
    weak var controller: ListViewControllerProtocol?
    
    init (controller: ListViewControllerProtocol) {
        self.controller = controller
    }
    var arrayOfObject: [CarModel] = []
    let filterManager = FilterManager()
    let notificationManager = NotificationManager()
    
    
    func buttonPressed (type: Body) {
        filterManager.filterList(type: type, arrayOfObject: arrayOfObject) { (filteredArray) in
            Singleton.shared.arrayOfCars = filteredArray
        }
        notificationManager.sendTableViewNotification()
    }
}

protocol CarListProtocol {
    func buttonPressed (type: Body)
}
