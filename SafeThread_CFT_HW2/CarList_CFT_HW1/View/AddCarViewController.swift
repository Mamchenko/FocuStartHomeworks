//
//  AddCarViewController.swift
//  CarList_CFT_HW1
//
//  Created by Anatoliy Mamchenko on 19.04.2021.
//

import UIKit

class AddCarViewController: UIViewController, IAddCarViewControllerProtocol {  
    
    @IBOutlet weak var manufactureTextField: UITextField!
    @IBOutlet weak var modelTextFIeld: UITextField!
    @IBOutlet weak var yearOfProduceTextFIeld: UITextField!
    @IBOutlet weak var carNumberTextField: UITextField!
    @IBOutlet weak var bodyPicker: UIPickerView!
    @IBOutlet weak var saveButton: UIButton!
    
    lazy var alerController: UIAlertController = {
        let controller = UIAlertController(title: "Внимание", message: "Вы не заполнили все поля", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        controller.addAction(action)
        return controller
    }()
    
    private var selectedValue : Body = .Minivan
    var presenter: AddCarPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AddCarPresenter(controller: self)
        addProtocolStabs()
    }
    
    private func addProtocolStabs () {
        self.bodyPicker.delegate = self
        self.bodyPicker.dataSource = self
    }
    
    func alertPresent () {
        self.present(alerController, animated: false, completion: nil)
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @IBAction func saveButtonAction(_ sender: Any) {
        presenter.buttonPressed(manufacture: manufactureTextField.text ?? "", model: modelTextFIeld.text ?? "", carNumber: carNumberTextField.text ?? "-", yearOfIssure: yearOfProduceTextFIeld.text, body: selectedValue)
    }
    
}

extension AddCarViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Body.allCases.count
    }
}

extension AddCarViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Body.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedValue = Body.allCases[row]
    }
}

protocol IAddCarViewControllerProtocol: class {
    func alertPresent ()
    func popViewController ()
}
