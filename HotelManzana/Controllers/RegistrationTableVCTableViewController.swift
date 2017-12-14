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
    @IBOutlet weak var numberAdultsLbl: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    
    @IBOutlet weak var numberOfChildrenLbl: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    
    
    
    
    let checkInDatePickerIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerIndexPath = IndexPath(row: 3, section: 1)
    var isCheckInDatePickerShown: Bool = false {
        didSet{
            CheckIndatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown: Bool = false{
        didSet{
            CheckOutDatePicker.isHidden = !isCheckOutDatePickerShown
            
        }
    }
    
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
        
        let checkInDate = CheckIndatePicker.date
        let checkOutdate = CheckOutDatePicker.date
        
        print("first Name:\(firstName)")
        print("Last name:\(lastName)")
        print("email:\(email)")
        
        print("check in date:\(checkInDate)")
        print("check out date:\(checkOutdate)")
        
   
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        
        updateDateViews()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /*switch (indexPath.section, indexPath.row){
            
        case (checkInDatePickerIndexPath.section, checkInDatePickerIndexPath.row):
                return 0
        case (checkOutDatePickerIndexPath.section, checkOutDatePickerIndexPath.row):
                return 0
        default:
                return 44.0
            
        }*/
        
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerIndexPath.section, checkInDatePickerIndexPath.row):
            if isCheckInDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        case (checkOutDatePickerIndexPath.section, checkOutDatePickerIndexPath.row):
            if isCheckOutDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerIndexPath.section, checkInDatePickerIndexPath.row - 1):
            if isCheckInDatePickerShown{
                isCheckInDatePickerShown = false
            }else if isCheckOutDatePickerShown{
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            }else{
                isCheckInDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
        case (checkOutDatePickerIndexPath.section,
              checkOutDatePickerIndexPath.row - 1):
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            } else if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            } else {
                isCheckOutDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        default:
            break
        }
    }
    
    func updateGuestView(){
        
        numberAdultsLbl.text = "\(Int(numberOfAdultsStepper.value))"
        
        numberOfChildrenLbl.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper)
    {
       updateGuestView()
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
