//
//  Singletone.swift
//  CarList_CFT_HW1
//
//  Created by Anatoliy Mamchenko on 19.04.2021.
//

class Singleton {
    static let shared = Singleton()
    var arrayOfCars: [CarModel] = [
        CarModel(manufacture: "Lexus", model: "LX570", carNumber: "223", yearOfIssure: 2006, body: .Minivan),
        CarModel(manufacture: "Toyota", model: "Tundra", carNumber: "222", yearOfIssure: 2006, body: .PickUp),
        CarModel(manufacture: "Mazda", model: "RX8", carNumber: "999", yearOfIssure: 2006, body: .Roadster),
        CarModel(manufacture: "BMW", model: "Z5", carNumber: "612", yearOfIssure: 2006, body: .Coupe),
        CarModel(manufacture: "MAN", model: "MAN", carNumber: "4324", yearOfIssure: 2006, body: .Track),
        CarModel(manufacture: "HZ", model: "HZ", carNumber: "21", yearOfIssure: 2006, body: .Minivan),
        CarModel(manufacture: "правки по коду", model: "бутылковоз 3000", carNumber: "223", yearOfIssure: 2006, body: .Minivan),
        CarModel(manufacture: "VAN", model: "VAN", carNumber: "198", yearOfIssure: nil, body: .Minivan)
    ]
    private init() { }
}
