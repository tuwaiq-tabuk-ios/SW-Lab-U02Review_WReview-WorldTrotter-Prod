//
//  ViewController.swift
//  WorldTrotter-Review"Ressam-Reema-Hajar"
//
//  Created by Ressam Al-Thebailah on 24/04/1443 AH.
//

import UIKit

class ConversionViewControllerStoryboard: UIViewController , UITextFieldDelegate {
  
  @IBOutlet weak var valueCelsiusLabel: UILabel!
  @IBOutlet weak var valueFahrenheitTextField: UITextField!
  
  
  let numberFormatter : NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
  } ()
  
  var fahrenheitValue : Measurement<UnitTemperature>?{
    didSet {
      updateCelsiusLabel()
    }
  }
  
  var celsiusValue : Measurement<UnitTemperature>? {
    if let fahrenheitValue = fahrenheitValue {
      return fahrenheitValue.converted(to: .celsius)
    }else{
      return nil
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its View. ")
    
    valueFahrenheitTextField.delegate = self
  }
  
  
  @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    
//    if let text = valueFahrenheitTextField.text, let value =
//        Double(text) {
//      fahrenheitValue = Measurement(value: value , unit: .fahrenheit)
    
    
    if let text = textField.text , let number = numberFormatter.number(from: text)
    {
      fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
    
    }else {
      fahrenheitValue = nil
    }
  }
  
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    valueFahrenheitTextField.resignFirstResponder()
  }
  
  
  func updateCelsiusLabel(){
    if let celsiusValue = celsiusValue {
      
      valueCelsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
    }else{
      valueCelsiusLabel.text = "???"
    }
  }
  
  func textField(_ textField: UITextField ,
                 shouldChangeCharactersIn range: NSRange ,
                 replacementString string : String )
  ->Bool  {
    
    
    let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        let existingTextHasDecimalSeparator
                = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)

    
    guard let text = textField.text else {return false}
    
    return hasConcatenationOnlyDecimalNumberAndDecimalSeparator(
      string1: text,
      string2: string)
    
  }
  
  
  func hasConcatenationOnlyDecimalNumberAndDecimalSeparator(string1: String,
                                                            string2: String)
  -> Bool{
    print("\n\n \(#function)")
    print(" - string1: \(string1)")
    print(" - string2: \(string2)")
    
    if hasConcatenationMoreThanOneDecimalSeparator(string1, string2) {
      return false
    }
    
    let allowedCharacters = CharacterSet.decimalDigits.union(["."])
    let forbiddenCharacters = allowedCharacters.inverted
    
    let foundforbiddenCharacters = string2.rangeOfCharacter(from: forbiddenCharacters)
    
    print("foundforbiddenCharacters: \(String(describing: foundforbiddenCharacters))")
    
    if foundforbiddenCharacters != nil {
      return false
    }else {
      return true
    }
  }
  
  
  func hasConcatenationMoreThanOneDecimalSeparator (_ string1: String,
                                                    _ string2: String) -> Bool {
    let string1HasDecimalSeparator = string1.range(of: ".")
    let string2HasDecimalSeparator = string2.range(of: ".")
    
    print("\n \(#function)")
    print("string1HasDecimalSeparator: \(String(describing: string1HasDecimalSeparator))")
    print("string2HasDecimalSeparator: \(String(describing: string2HasDecimalSeparator))")
    
    if string1HasDecimalSeparator != nil,
       string2HasDecimalSeparator != nil {
      return true
    } else {
      return false
    }
  }
  
}
