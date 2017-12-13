//
//  RegistrationTableVCTableViewController.swift
//  HotelManzana
//
//  Created by David Mamou on 13/12/17.
//  Copyright © 2017 ronny abraham. All rights reserved.
//

import UIKit

class RegistrationTableVCTableViewController: UITableViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func doneBarButtonItem(_ sender: Any)
    {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        print("first Name:\(firstName)")
        print("Last name:\(lastName)")
        print("email:\(email)")
    }
    
    
}
