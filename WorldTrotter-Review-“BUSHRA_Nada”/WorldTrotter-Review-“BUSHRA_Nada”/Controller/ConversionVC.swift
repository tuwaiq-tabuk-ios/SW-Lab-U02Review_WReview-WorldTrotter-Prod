//
//  ConversionVC.swift
//  WorldTrotter-Review-“BUSHRA_Nada”
//
//  Created by bushra nazal alatwi on 25/04/1443 AH.
//

import UIKit

class ConversionVC: UIViewController , UITextFieldDelegate {
  
  @IBOutlet weak var valueCelsiusLabel: UILabel!
  @IBOutlet weak var valueFahrenheitTextField: UITextField!
  
  
  var fahrenheitValue : Measurement <UnitTemperature>?{
    didSet {
      updateCelsiusLabel()
    }
  }
  
  var celsiusValue : Measurement <UnitTemperature>? {
    if let  fahrenheitValue =  fahrenheitValue {
      return fahrenheitValue.converted(to: .celsius)
    }else {
      return nil
    }
  }
  
  let numberFormattter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
  } ()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    valueFahrenheitTextField.delegate = self
    // Do any additional setup after loading the view.
  }
  
  
  @IBAction func fahrenheitFieldEditingChanged(_ sender: UITextField) {
    //    valueCelsiusLabel.text = valueFahrenheitTextField.text
    if let text = valueFahrenheitTextField.text , let value = Double(text) {
      fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
    } else {
      fahrenheitValue = nil
    }
    
  }
  
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    valueFahrenheitTextField.resignFirstResponder()
  }
  
  
  func updateCelsiusLabel(){
    if let celsiusValue = celsiusValue {
      //      valueCelsiusLabel.text = "\(celsiusValue.value)"
      valueCelsiusLabel.text = numberFormattter.string(from: NSNumber(value: celsiusValue.value))
    }else {
      valueCelsiusLabel.text = "???"
    }
  }
  
  
  func textField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool {
    
    guard let text = textField.text else { return false }
    
    return hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: text,string2: string)
  }
  
  
  func hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: String,string2: String)
  -> Bool {
    print("\n\n \(#function)")
    print(" - string1:  \(string1)")
    print(" - string2:  \(string2)")
    
    // Check only zero or one decimal separator
    if hasConcatenationMoreThanOneDecimalSeparator(string1, string2) {
      return false
    }
    
    // Check only decimalDigits (0-9) and decimal separator
    let allowedCharacters = CharacterSet.decimalDigits.union(["."])
    let forbiddenCharacters = allowedCharacters.inverted
    let foundForbiddenCharacters
      = string2.rangeOfCharacter(from: forbiddenCharacters)
    print("foundForbiddenCharacters: \(String(describing:foundForbiddenCharacters))")
    if foundForbiddenCharacters != nil {
      return false
    } else {
      return true
    }
  }
  
  
  func hasConcatenationMoreThanOneDecimalSeparator(_ string1: String,
                                                   _ string2: String)
  -> Bool {
    let string1HasDecimalSeparator = string1.range(of: ".")
    let string2HasDecimalSeparator = string2.range(of: ".")
    
    print("\n \(#function)")
    
    print("string1HasDecimalSeparator:  \(String(describing:string1HasDecimalSeparator))")
    print("string2HasDecimalSeparator:  \(String(describing:string2HasDecimalSeparator))")
    
    if string1HasDecimalSeparator != nil,
       string2HasDecimalSeparator != nil {
      return true
    } else {
      return false
    }
  }
}
