//
//  ViewController.swift
//  CFT_HW3
//
//  Created by Anatoliy Mamchenko on 03.05.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let customView: MainView = {
        let view = MainView()
        view.backgroundColor = .systemPurple
        return view
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.setTitle("enter", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.translatesAutoresizingMaskIntoConstraints = false
        configureUI()
        customView.makeConstraints()
    }
    
    private func configureUI () {
        [button, customView].forEach {view.addSubview($0)}
        let leftViewConstraint = NSLayoutConstraint(item: customView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 32)
        let rightViewConstraint = NSLayoutConstraint(item: customView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -32)
        let topViewConstraint = NSLayoutConstraint(item: customView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 100)
        let bottomConstraint  = NSLayoutConstraint(item: customView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -20)
        
        NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 32).isActive = true
        NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -32).isActive = true
        NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: self.customView, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 30).isActive = true
        
        NSLayoutConstraint.activate([leftViewConstraint, rightViewConstraint, topViewConstraint, bottomConstraint])
    }
    
}
    
    
   




