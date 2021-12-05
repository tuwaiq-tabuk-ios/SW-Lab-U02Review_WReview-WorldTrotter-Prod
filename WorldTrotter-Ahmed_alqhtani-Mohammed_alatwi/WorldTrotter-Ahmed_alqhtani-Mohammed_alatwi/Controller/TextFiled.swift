//
//  TextFiled.swift
//  WorldTrotter-Ahmed_alqhtani-Mohammed_alatwi
//
//  Created by Ahmed awadh alqhtani on 25/04/1443 AH.
//

import UIKit

class TextFiled : UIViewController,UITextFieldDelegate { //?
  
  var fahrenheitValue: Measurement<UnitTemperature>? {
    didSet {
      updateCelsiusLabel()
    }
  }
  var celsiusValue : Measurement<UnitTemperature>? {
    if let fahrenheitValue = fahrenheitValue {
      return fahrenheitValue.converted(to: .celsius)
    } else {
      return nil
    }
  }
  
  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf }()
  
  
  @IBOutlet weak var valueCelsiusLabel: UILabel!
  
  @IBOutlet weak var valueFahrenheitTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    valueFahrenheitTextField.delegate = self
  }
  
  
  @IBAction func fahrenheitFieldEditingChanged(_ sender: UITextField) {
    if let text = valueFahrenheitTextField.text, let value =
        Double(text) {
      fahrenheitValue = Measurement(value: value, unit:
                                      .fahrenheit)
    } else {
      fahrenheitValue = nil
    }
  }
  
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    
    valueFahrenheitTextField.resignFirstResponder() // نسال زهراء
  }
  
  
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      valueCelsiusLabel.text =
        numberFormatter.string(from: NSNumber(value: celsiusValue.value))
      
    } else {
      valueCelsiusLabel.text = "???"
    }
  }
//  func textField(
//    _ textField: UITextField,
//    shouldChangeCharactersIn range: NSRange,
//    replacementString string: String
//  ) -> Bool {
//    let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
//    let replacementTextHasDecimalSeparator = string.range(of: ".")
//    
//    if existingTextHasDecimalSeparator != nil,
//       replacementTextHasDecimalSeparator != nil {
//      return false
//    } else {
//      return true
//    }
//  }
  
  
  
//  extension UIViewController :UITextFieldDelegate{
   public func textField(_ textField: UITextField,
           shouldChangeCharactersIn range: NSRange,
           replacementString string: String) -> Bool {
    print(#function)
    let currentLocale = Locale.current
    let decimalSeparator = currentLocale.decimalSeparator ?? "."
    let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
    let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
    if string.rangeOfCharacter(from: CharacterSet.letters) != nil {
     return false
    }
    if existingTextHasDecimalSeparator != nil,
      replacementTextHasDecimalSeparator != nil {
     return false
    } else {
     return true
    }
   }
  
  
  
  
  
}


