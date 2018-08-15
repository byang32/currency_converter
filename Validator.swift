//
//  Validator.swift
//  LP3_currencyConverte_byang32
//
//  Created by Bee Yang on 12/4/17.
//  Copyright © 2017 Assignment3 Bee Yang. All rights reserved.
//

import UIKit

class Validator: NSObject {
    
    /* isDifferent(fromCurrency: thanToCurrency toCurrency:) fromCurrency and toCurrency
    are String parameters. This method should return a boolean value, true if
    passed-in selected currencies are different or false if they are the same. */
    func isDifferent(fromCurrency: String, toCurrency: String) -> Bool{
        
        if fromCurrency != toCurrency {
            
            return true
        }
        return false
    }
    
    /* fromCurrencyAmount is a String parameter that is the passed-in to amount
    text field’s string. This method should return a boolean, true if passed-in
    amount is a valid Double value and false if it isn’t (either empty or a
    value that cannot be converted to a Double). */
    func isValid(fromCurrencyAmount: String) -> Bool  {

        if ((Double(fromCurrencyAmount)) != nil) {
            return true
        }
        
        return false
    }
}
