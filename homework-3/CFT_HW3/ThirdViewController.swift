//
//  ThirdViewController.swift
//  CFT_HW3
//
//  Created by Anatoliy Mamchenko on 03.05.2021.
//

import UIKit

let CELL_IDENTIFIRE = "my cell"

class ThirdViewController: UIViewController {
    
    lazy private var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(frame: self.view.bounds)
        loader.style = .large
        loader.color = .white
        return loader
    }()
    
    lazy private var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionViewPosition = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        var collectionView = UICollectionView(frame: collectionViewPosition, collectionViewLayout: collectionViewLayout)
        collectionView.register(KiksCollectionViewCell.self, forCellWithReuseIdentifier: CELL_IDENTIFIRE)
        collectionView.backgroundColor = UIColor(named: "mainBckgroundColor")
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addCollectionView()
        configureViewComponents()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
    }
    
    private func configureViewComponents () {
        navigationItem.title = "Моя коллекция кроссовок"
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

//MARK: - Collection view DataSource and Delegate
extension ThirdViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Singleton.shared.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_IDENTIFIRE, for: indexPath) as! KiksCollectionViewCell
        cell.backgroundColor = UIColor(named: "cellColor")
        cell.layer.cornerRadius = 16
        cell.backgroundColor = .systemOrange
        cell.configConstraints()
        cell.nameLabel.text = Singleton.shared.model[indexPath.row].name
        cell.imageView.image = Singleton.shared.model[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        var rotatingTransform: CATransform3D
        if indexPath.row % 2 == 0 {
            rotatingTransform = duration(.fromLeft)
        }
        else {
            rotatingTransform = duration(.fromRight)
        }
        cell.layer.transform = rotatingTransform
        UIView.animate(withDuration: 0.5) {
            cell.layer.transform =  CATransform3DIdentity
        }
        
    }
    
    private func duration (_ from: AnimationDuration) -> CATransform3D {
        switch from {
        case .fromLeft:
            return CATransform3DTranslate(CATransform3DIdentity, -500, 0, 0)
        case .fromRight:
            return CATransform3DTranslate(CATransform3DIdentity, 500, 0, 0)
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ThirdViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 36) / 2
        let height = (view.frame.height - 36) / 3
        return CGSize(width: width, height: height)
    }
}






enum AnimationDuration {
    case fromLeft
    case fromRight
}
