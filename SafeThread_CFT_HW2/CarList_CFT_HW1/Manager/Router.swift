//
//  Router.swift
//  CarList_CFT_HW1
//
//  Created by Anatoliy Mamchenko on 19.04.2021.
//

import Foundation
import UIKit

class Router {
    
    func pushToStoryboardView (from: UINavigationController?,   to : ViewControllerIdentifier)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: to.rawValue)
        from?.pushViewController(controller, animated: false)
    }
}

enum ViewControllerIdentifier: String {
    case addCarViewController = "addCar"
}
