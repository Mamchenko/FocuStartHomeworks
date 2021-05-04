//
//  FirstViewController.swift
//  CFT_HW3
//
//  Created by Anatoliy Mamchenko on 03.05.2021.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var myPhotoImageView: UIImageView!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    let alert = UIAlertController(title: "Внимание!", message: "Введите свое имя", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAlert()
        myPhotoImageView.configureUIimageView()
        configureUI()
    }
    
    func configureAlert() {
        let action = UIAlertAction(title: "ok", style: .default) { [weak self ](_) in
            self?.greetingLabel.text = "Привет, \(self?.alert.textFields?.first?.text ?? "nil")"
        }
        alert.addTextField(configurationHandler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func configureUI () {
        [myNameLabel, cityLabel, ageLabel, greetingLabel].forEach{
            $0?.layer.borderWidth = 2
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.textColor = .black
            $0?.translatesAutoresizingMaskIntoConstraints = false
            $0?.lineBreakMode = .byWordWrapping
            $0?.layer.masksToBounds = true
            $0?.layer.cornerRadius = 10
            $0?.numberOfLines = 0
            $0?.font = UIFont.systemFont(ofSize: myNameLabel.font.pointSize)
            $0?.textAlignment = .center
        }
    }
    
}

extension UIImageView {
    func configureUIimageView () {
        self.layer.cornerRadius = 10
        self.backgroundColor = .black
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        self.sizeToFit()
        self.image = UIImage(named: "me")
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
    }
}
