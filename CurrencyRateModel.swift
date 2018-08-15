//
//  CurrencyRateModel.swift
//  LP3_currencyConverte_byang32
//
//  Created by Bee Yang on 12/4/17.
//  Copyright © 2017 Assignment3 Bee Yang. All rights reserved.
//

import UIKit

class CurrencyRateModel: NSObject {
    
    // Constants
    let USDollar = "US Dollar"
    let Euro = "Euro"
    let BritishPound = "British Pound"
    let Yen = "Japanese Yen"
    
    // Create a method named exchangeRate(fromCurrency: toCurrency:)
    // where its parameters fromCurrency and toCurrency are String values
    // that are passed in (based on selected currencies in the PickerViews)
    // return a Double
    func exchangeRates(fromCurrency:String, toCurrency:String) -> Double {
        let conversionRates = ["US Dollar": ["Euro":0.84, "British Pound":0.74, "Japanese Yen":112.51],
                               "Euro": ["US Dollar":1.19, "British Pound":0.88, "Japanese Yen":133.62],
                               "British Pound": ["US Dollar":1.35, "Euro":1.13, "Japanese Yen":151.58],
                               "Japanese Yen": ["US Dollar":0.0089, "Euro":0.0075, "British Pound":0.0066]]
        return conversionRates[fromCurrency]![toCurrency]!
    }
    
    
}








