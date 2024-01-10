//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var percent = 0.0
    
    var split = 2
    
    var result = 0.0

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        split = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        result = (billTextField.text! as NSString).doubleValue
        
        let percentUnit = result * percent
        
        result = result + percentUnit
        
        result = result / Double(split)
        
        result = round(result * 100) / 100.0
        
        print(result)
        
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let type = sender.currentTitle?.replacingOccurrences(of: "%", with: "")
        print(type)
        if(type!.elementsEqual("0")) {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if(type!.elementsEqual("10")) {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
        
        percent = 0.01 * (type! as NSString).doubleValue
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = String(result)
            destinationVC.percent = String(Int(percent * 100))
            destinationVC.split = String(split)
        }
    }
}

