//
//  AddCarPresenter.swift
//  CarList_CFT_HW1
//
//  Created by Anatoliy Mamchenko on 19.04.2021.
//

import Foundation
import Combine


class AddCarPresenter: AddCarPresenterProtocol {
    
    weak var controller: AddCarProtocol?
    let notificationManager = NotificationManager()
    
    init (controller: AddCarProtocol) {
        self.controller = controller
    }
    
    func buttonPressed (manufacture: String, model: String, carNumber: String, yearOfIssure: String?, body: Body) {
        if manufacture.isEmpty && model.isEmpty {
            controller?.alertPresent()
        } else {
            let object = CarModel(manufacture: manufacture, model: model, carNumber: carNumber, yearOfIssure: Int(yearOfIssure!), body: body)
            Singleton.shared.arrayOfCars.append(object)
            controller?.popViewController()
            notificationManager.sendTableViewNotification()
        }// тут я бы сделал через RX но чет за*бало(
    }
}

protocol AddCarPresenterProtocol {
    func buttonPressed (manufacture: String, model: String, carNumber: String, yearOfIssure: String?, body: Body)
}
