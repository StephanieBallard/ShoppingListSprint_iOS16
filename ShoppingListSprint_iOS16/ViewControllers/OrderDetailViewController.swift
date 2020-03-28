//
//  OrderDetailViewController.swift
//  ShoppingListSprint_iOS16
//
//  Created by Stephanie Ballard on 3/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingList: ShoppingListController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let shoppingList = shoppingList else { return }
        let shoppingItems = shoppingList.shoppingItems.filter({ $0.hasBeenAdded }).count
        itemsInCartLabel.text = "You currently have \(shoppingItems) in your shopping list."
    }
    
    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
        showAlert()
    }
    
    func showAlert() {
        guard let name = nameTextField.text else { return }
        guard let address = addressTextField.text else { return }
        let alert = UIAlertController(title: "Order Submitted", message: "\(name) your order will be delivered to \(address) within 15 minutes", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        
        present(alert, animated: true)
    }
}
