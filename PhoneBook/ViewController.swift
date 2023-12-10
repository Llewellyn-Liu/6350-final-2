//
//  ViewController.swift
//  PhoneBook
//
//  Created by Runlin Liu on 12/8/23.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    var nameTxt: UITextField?
    var numberTxt: UITextField?
    
    var names: [String] = [String]()
    var numbers: [String] = [String]()

    @IBAction func openRegistry(_ sender: Any) {
        print("new alert")
                let alertController = UIAlertController(title: "Add Contact", message: "", preferredStyle: .alert)
        
                let saveButton = UIAlertAction(title: "Save", style: .default){
                    action in
                    print("Pressed Save btn")
                    guard let name = self.nameTxt?.text else {return }
                    guard let number = self.numberTxt?.text else {return }
                    
                    self.names.append(name)
                    self.numbers.append(number)
                    
                    self.tblView.reloadData()
            
                }
                let cancelButton = UIAlertAction(title: "Cancel", style: .cancel){
                    action in
                    print("Pressed Cancel btn")
                }
                alertController.addAction(saveButton)
                alertController.addAction(cancelButton)
        alertController.addTextField{
            txtField in
            txtField.placeholder = "Name"
            self.nameTxt = txtField
        }        
        alertController.addTextField{
            txtField in
            txtField.placeholder = "Phone" 
            self.numberTxt = txtField
        }
        
                self.present(alertController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Name: \(names[indexPath.row]), number: \(numbers[indexPath.row])"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

