//
//  ButtonsCollectionViewCell.swift
//  CarList_CFT_HW1
//
//  Created by Anatoliy Mamchenko on 19.04.2021.
//

import UIKit
import SnapKit

class ButtonsCollectionViewCell: UICollectionViewCell {
    lazy var typeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    func addOnView () {
        addSubview(typeLabel)
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
    }
}
