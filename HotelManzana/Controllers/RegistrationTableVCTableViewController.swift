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
    
    @IBOutlet weak var checkInDateLbl: UILabel!
    @IBOutlet weak var CheckIndatePicker: UIDatePicker!
    @IBOutlet weak var CheckOutLbl: UILabel!
    @IBOutlet weak var CheckOutDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let midnightToday = Calendar.current.startOfDay(for: Date())
        CheckIndatePicker.minimumDate = midnightToday
        CheckIndatePicker.date = midnightToday
        
        CheckOutDatePicker.minimumDate = CheckIndatePicker.date.addingTimeInterval(86400)
    }
    
    func updateDateViews () {
        let dateFormatteur = DateFormatter()
        
        dateFormatteur.dateStyle = .medium
        
        checkInDateLbl.text = dateFormatteur.string(from: CheckIndatePicker.date)
        CheckOutLbl.text = dateFormatteur.string(from: CheckOutDatePicker.date)
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
