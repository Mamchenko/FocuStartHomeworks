//
//  ViewController.swift
//  CarList_CFT_HW1
//
//  Created by Anatoliy Mamchenko on 19.04.2021.
//

import UIKit
import SnapKit

let COLLECTIONVIEW_CELL_IDENTIFIRE = "collectionButtonCell"
let TABLEVIEW_CELL_IDENTIFIRE = "carListTableCell"

@objcMembers class ListViewController: UIViewController, ListViewControllerProtocol {
    
    private var carTableView: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CarListTableViewCell.self, forCellReuseIdentifier: TABLEVIEW_CELL_IDENTIFIRE)
        return table
    }()
    
    lazy private var filterButtonsCollectionView: UICollectionView = {
        let layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.scrollDirection = .horizontal
        layoutCollection.minimumLineSpacing = 50
        layoutCollection.itemSize = CGSize(width: 96, height: 40)
        var collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 48), collectionViewLayout: layoutCollection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(ButtonsCollectionViewCell.self, forCellWithReuseIdentifier: COLLECTIONVIEW_CELL_IDENTIFIRE)
        collection.isScrollEnabled = true
        collection.backgroundColor = .white
        return collection
    }()
    
    private var presenter: CarListPresenter!
    private let router = Router()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CarListPresenter(controller: self)
        addCollectionsStabs()
        makeConstraints()
        configureNavigationBar()
        createTableViewObserver()
    }
    
    func loadList(notification: NSNotification){
        carTableView.reloadData() 
    }
    
    private func createTableViewObserver () {
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    private func addCollectionsStabs () {
        carTableView.delegate = self
        carTableView.dataSource = self
        filterButtonsCollectionView.delegate = self
        filterButtonsCollectionView.dataSource = self
    }
    
    private func configureNavigationBar () {
        navigationItem.title = "Car List App"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddingController))
    }
    
    //MARK: - Route to AddCarViewController
    func presentAddingController () {
        router.pushToStoryboardView(from: self.navigationController, to: .addCarViewController)
    }
    
    //MARK: - Setup constraints
    private func makeConstraints  () {
        
        [filterButtonsCollectionView, carTableView].forEach {view.addSubview($0)}
        
        carTableView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.height.equalTo(self.view).multipliedBy(0.8)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
        filterButtonsCollectionView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.bottom.equalTo(self.carTableView.snp.top)
            make.height.equalTo(self.view).multipliedBy(0.1)
        }
    }
}

//MARK: - UITableviewDelegate and DataSource
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.shared.arrayOfCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexpathArray = Singleton.shared.arrayOfCars[indexPath.row]
        let cell = carTableView.dequeueReusableCell(withIdentifier: TABLEVIEW_CELL_IDENTIFIRE, for: indexPath) as! CarListTableViewCell
        cell.addingConstraints()
        cell.manufactureLabel.text = indexpathArray.manufacture
        cell.bodyTypeLabel.text = indexpathArray.body.rawValue
        cell.modelLabel.text = indexpathArray.model
        cell.carNumberLabel.text = indexpathArray.carNumber
        guard let number = indexpathArray.yearOfIssure else {return cell}
        cell.addConstraintsIfLableIsActive()
        cell.yearOfProduceLabel.text = String(number)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
//MARK: - UICollectionViewDelegate and DataSource
extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Body.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = filterButtonsCollectionView.dequeueReusableCell(withReuseIdentifier: COLLECTIONVIEW_CELL_IDENTIFIRE, for: indexPath) as! ButtonsCollectionViewCell
        cell.addOnView()
        cell.typeLabel.text = Body.allCases[indexPath.row].rawValue
        cell.backgroundColor = .systemGray3
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let arrayWithIndexpath = Singleton.shared.arrayOfCars[indexPath.row]
        presenter.buttonPressed(type: arrayWithIndexpath.body)
    }
}

protocol ListViewControllerProtocol: class {
    
}

    
 





