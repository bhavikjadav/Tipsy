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
    
    var tip = 0.10
    var stepperCount = 2
    var finalAmount = 0.00
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        // Disselect all IBOutlets
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // Select clicked one.
        sender.isSelected = true
        
        // Get the current title
        let buttonTitle = sender.currentTitle!
        
        // convert into string and drop the last one
        let buttonTitleLessPercentage = String(buttonTitle.dropLast())
        
        // change the type to Double so that we can do calculation
        let buttonTitleAsNumber = Double(buttonTitleLessPercentage)!
        
        // tip logic
        tip = buttonTitleAsNumber / 100
        
        // disabling textField editing
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        var stepperVal = Int(sender.value)
        splitNumberLabel.text = String(stepperVal)
        stepperCount = stepperVal
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var billTotal = Double(billTextField.text!) ?? 0
        var billAmountAndTip = billTotal * Double(1 + tip)
        finalAmount = Double(billAmountAndTip / Double(stepperCount))
        let finalAmountWithTwoDecimals = String(format: "%.2f", finalAmount)
        finalAmount = Double(finalAmountWithTwoDecimals) ?? 0.00
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.totalValue = String(finalAmount)
        destinationVC.tipCount = Double(tip)
        destinationVC.stepperCount = Double(stepperCount)
    }
    
    
}

