//
//  CurrencyViewController.swift
//  LP3_currencyConverte_byang32
//
//  Created by Bee Yang on 12/4/17.
//  Copyright © 2017 Assignment3 Bee Yang. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var fromPickerData: UIPickerView!
    @IBOutlet weak var toPickerData: UIPickerView!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var results: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var seeResultsLabel: UILabel!
    
    var pickerData1: [String] = [String]()
    var pickerData2: [String] = [String]()
    
    override func viewDidLoad() {
        convertButton.frame.size.width = 100
        convertButton.layer.borderWidth = 1
        convertButton.layer.borderColor = UIColor.blue.cgColor
        convertButton.layer.cornerRadius = 10
        
        seeResultsLabel.frame.size.width = 225
        seeResultsLabel.frame.size.height = 50
        
        // Set up fromPickerData and toPickerData
        // by inpuyting data into the array
        self.fromPickerData.delegate = self
        self.toPickerData.delegate = self
        
        pickerData1 = ["US Dollar", "Euro", "British Pound", "Japanese Yen"]
        pickerData2 = ["Euro", "US Dollar", "British Pound", "Japanese Yen"]
    }
    
    // variables to store selected picker view
    var storedPickerFrom = 0
    var storedPickerTo = 0
    
    var exchangeRate: Double = 0.0
    var result: Double = 0.0
    var userInput: Double = 0.0
    
    var validator: Validator = Validator()
    var currencyRateModel: CurrencyRateModel = CurrencyRateModel()
    
    // The number of columns of daata
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == fromPickerData {
            return pickerData1.count
        } else {
            return pickerData2.count
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == fromPickerData {
            return pickerData1[row]
        } else {
            return pickerData2[row]
        }
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == fromPickerData {
            storedPickerFrom = row
        } else {
            storedPickerTo = row
        }
    }
    
   // IBAction method named convertCurrency that will perform tasks
    @IBAction func convertCurreny(_ sender: Any) {
        
        // Check if the selected from currency is different than the selected toCurrency
        // by call the isDifferent method of your Validator Class.
        if validator.isDifferent(fromCurrency: pickerData1[storedPickerFrom],
                                 toCurrency: pickerData2[storedPickerTo]) {
            
            // If the from and to currencies are different, check if the entered to amount
            // (fromAmout: text field) is a valid Double numeric value by calling the isValid()
            // method of the validator class
            if validator.isValid(fromCurrencyAmount: amount.text!) {
                
                // If the amount is valid, get the exchange rate from the from currency to the
                // toCurrency by calling the exchangeRate() method of your CurrencyRateModel Class.
                exchangeRate = currencyRateModel.exchangeRates(fromCurrency: pickerData1[storedPickerFrom], toCurrency: pickerData2[storedPickerTo])
                
                userInput = Double(amount.text!)!
                exchangeRate *= 100
                result = (exchangeRate * userInput) / 100
                
                // If result is US Dollar add $.
                if pickerData2[storedPickerTo] == "US Dollar" {
                    
                    results.text = String(format: "$%.02f",result)
                    seeResultsLabel.text = "\(amount.text!) \(pickerData1[storedPickerFrom]) equals \(results.text!) \(pickerData2[storedPickerTo])"
                    amount.text = ""
                } else {
                    results.text = String(result)
                    seeResultsLabel.text = "\(amount.text!) \(pickerData1[storedPickerFrom]) equals \(results.text!) \(pickerData2[storedPickerTo])"
                    amount.text = ""
                }
            } else {
                
                seeResultsLabel.text = "Invalid amount!"
                amount.text = ""
            }
            
        } else {
            seeResultsLabel.text = "Your convert from and convert to currencies must be different!"
            amount.text = ""
        }
        
    }
    
    
    
    
}
