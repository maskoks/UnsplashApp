//
//  ViewController.swift
//  testAppForMDH
//
//  Created by Жеребцов Данил on 29.08.2021.
//

import UIKit


class MainVC: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.layer.cornerRadius = 15
    }
    
    
    @IBAction func searchButtonAction(_ sender: Any) {
        let collectionVC = storyboard?.instantiateViewController(withIdentifier: "CollectionVC") as! CollectionVC
        collectionVC.searchedText = textField.text!
        collectionVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(collectionVC, animated: true)
    }
}
