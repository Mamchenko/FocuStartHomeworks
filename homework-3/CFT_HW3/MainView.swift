//
//  MainView.swift
//  CFT_HW3
//
//  Created by Anatoliy Mamchenko on 03.05.2021.
//

import UIKit

class MainView: UIView {
    
    let photoImageView: UIImageView = {
    let view = UIImageView()
        view.layer.cornerRadius = 20
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.image = UIImage(named: "viewBack")
    return view
    }()
    
    let label: UILabel = {
    let view = UILabel()
        view.backgroundColor = .white
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.lineBreakMode = .byWordWrapping
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 10)
        view.textAlignment = .center
        view.text = "Сейчас я являюсь бар-менеджером в одной из сосисочных местного разлива В разработку пришев прошлом году. У меня уже есть образование в области айти, но когда я учился мы писали фильтрации массивов, переводили из разных систем счислений Если говорить кратко, то делали все, лишь бы не продукт После этого спустя несколько лет я все-таки решил что хотел бы разрабатывать приложения и так как у меня же был мак, выбор пал на Swift"
    return view
    }()

    func makeConstraints () {
        [label, photoImageView].forEach{addSubview($0)}
        NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -16).isActive = true
        NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: photoImageView, attribute: .bottom, multiplier: 1, constant: 32).isActive = true
        NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 150).isActive = true
        
        NSLayoutConstraint(item: photoImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: photoImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -16).isActive = true
        NSLayoutConstraint(item: photoImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 32).isActive = true
        NSLayoutConstraint(item: photoImageView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 200).isActive = true
    }

    
}

