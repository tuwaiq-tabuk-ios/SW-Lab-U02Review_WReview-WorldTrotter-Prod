//
//  ViewController.swift
//  WorldTrotter-MarzouqAlmukhlif
//
//  Created by Marzouq Almukhlif on 24/04/1443 AH.
//

import UIKit

class ConversionViewControllerStoryboard: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var valueFahrenheitTextField: UITextField!
  
  @IBOutlet weak var valueCelsiusLabel: UILabel!
  
  
  var fahrenheitValue: Measurement<UnitTemperature>? {
    didSet {
      updateCelsiusLabel()
    }
  }
  
  var celsiusValue: Measurement<UnitTemperature>? {
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
    return nf
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    print("ConversionViewController loaded its view.")
    //    valueFahrenheitTextField.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear loaded its view.")
    
  }
  
  @IBAction func fahrenheitFieldEditingChanged(_ sender: UITextField) {
    if let text = valueFahrenheitTextField.text, let value = Double(text) {
      fahrenheitValue = Measurement(value: value, unit:.fahrenheit)
    } else {
      fahrenheitValue = nil
    }
    
    
  }
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    valueFahrenheitTextField.resignFirstResponder()
  }
  
  
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      valueCelsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
    } else {
      valueCelsiusLabel.text = "???"
    }
  }
  
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let text = textField.text else { return false }
    
    return String().hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: text, string2: string)
  }
  
  
  
}

