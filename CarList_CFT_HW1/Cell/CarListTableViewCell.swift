//
//  CarListTableViewCell.swift
//  CarList_CFT_HW1
//
//  Created by Anatoliy Mamchenko on 19.04.2021.
//

import UIKit

class CarListTableViewCell: UITableViewCell {
    
    let manufactureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let modelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let yearOfProduceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let carNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let bodyTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    func addingConstraints () {
        
        [manufactureLabel, modelLabel, carNumberLabel, bodyTypeLabel].forEach{addSubview($0)}
        
        manufactureLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading).offset(16)
            make.width.equalTo(self).multipliedBy(0.3)
            make.top.equalTo(self.snp.top).offset(16)
            make.height.equalTo(self).multipliedBy(0.2)
        }
        
        modelLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading).offset(16)
            make.width.equalTo(self).multipliedBy(0.3)
            make.top.equalTo(self.manufactureLabel.snp.bottom).offset(16)
            make.height.equalTo(self).multipliedBy(0.2)
        }
        
        carNumberLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self).multipliedBy(0.3)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.height.equalTo(self).multipliedBy(0.2)
            make.top.equalTo(self.snp.top).offset(16)
        }
        
        bodyTypeLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading).offset(32)
            make.trailing.equalTo(self.snp.trailing).offset(-32)
            make.height.equalTo(self).multipliedBy(0.25)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
        }
    }
    
    func addConstraintsIfLableIsActive () {
        
        addSubview(yearOfProduceLabel)
        
        yearOfProduceLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.width.equalTo(self).multipliedBy(0.3)
            make.top.equalTo(self.carNumberLabel.snp.bottom).offset(16)
            make.height.equalTo(self).multipliedBy(0.2)
        }
    }
    
}
