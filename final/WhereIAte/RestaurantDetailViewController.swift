//
//  RestaurantDetailViewController.swift
//  WhereIAte
//
//  Created by Theo Vora on 7/13/22.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    // landing pad
    var restaurant: Restaurant?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cuisineTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        unpackRestaurant()
    }
    
    func unpackRestaurant() {
        guard let restaurant = restaurant else {
            return
        }
        
        nameTextField.text = restaurant.name
        cuisineTextField.text = restaurant.cuisine
        cityTextField.text = restaurant.city
        notesTextField.text = restaurant.notes
    }
    
    
    // MARK: - Action
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
              let cuisine = cuisineTextField.text,
              let city = cityTextField.text,
              let notes = notesTextField.text else { return }
        
                
        if let restaurantToUpdate = self.restaurant {
            // UPDATE
            RestaurantController.shared.updateEntry(
                restaurant: restaurantToUpdate,
                name: name,
                cuisine: cuisine,
                city: city,
                notes: notes)
        } else {
            let restaurant = Restaurant(name: name, cuisine: cuisine, city: city, notes: notes)
            
            // CREATE
            RestaurantController.shared.createEntry(restaurant: restaurant)
        }
    }
}
