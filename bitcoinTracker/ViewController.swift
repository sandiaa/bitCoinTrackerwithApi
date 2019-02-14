//
//  ViewController.swift
//  bitcoinTracker
//
//  Created by Admin on 07/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var choice : String = ""
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var pickerview: UIPickerView!
    let countries = ["India","France","Japan","USA","United Kingdom"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        choice = countries[row]
        print(choice)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func rateCalculator(_ sender: UIButton) {
        if choice  !=  "" {
            performSegue(withIdentifier: "viewOne", sender: self)
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! secondViewController
        secondController.countryChosen = choice
        
    }
}

