//
//  RestaurantDetailViewController.swift
//  WhereIAte
//
//  Created by Theo Vora on 7/12/22.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    var date = Date()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cuisineTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dateTextField.text = date.formatted()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
              let cuisine = cuisineTextField.text,
              let city = cityTextField.text,
              let notes = notesTextView.text else { return }
        
        let restaurant = Restaurant(
            name: name,
            date: date,
            cuisine: cuisine,
            city: city,
            notes: notes)
        
        RestaurantController.shared.createEntry(restaurant: restaurant)
    }
}
