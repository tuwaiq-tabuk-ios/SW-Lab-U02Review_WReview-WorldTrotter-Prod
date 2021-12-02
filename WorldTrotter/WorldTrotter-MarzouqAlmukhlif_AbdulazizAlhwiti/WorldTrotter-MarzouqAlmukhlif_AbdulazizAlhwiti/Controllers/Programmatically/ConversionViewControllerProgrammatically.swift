//
//  ConversionViewControllerProgrammatically.swift
//  WorldTrotter-MarzouqAlmukhlif_AbdulazizAlhwiti
//
//  Created by Marzouq Almukhlif on 24/04/1443 AH.
//

import UIKit

class ConversionViewControllerProgrammatically: UIViewController,UITextFieldDelegate {
  
  
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
  
  var valueCelsiusLabel:UILabel!
  var valueFarenheitTextField:UITextField!
  
  override func loadView() {
    
    view = UIView()
    view.backgroundColor = .ccWhiteBackground
    
    valueFarenheitTextField = UITextField()
    valueFarenheitTextField.textAlignment = .center
    valueFarenheitTextField.delegate = self
    valueFarenheitTextField.borderStyle = .none
    valueFarenheitTextField.placeholder = "value".localize()
    valueFarenheitTextField.font = UIFont.systemFont(ofSize: 70)
    valueFarenheitTextField.textColor = .ccOrange
    valueFarenheitTextField.translatesAutoresizingMaskIntoConstraints = false
    
    valueFarenheitTextField.addTarget(self, action: #selector(fahrenheitFieldEditingChanged), for: .editingChanged)

    
    view.addSubview(valueFarenheitTextField)
    valueFarenheitTextField.layoutConstraint(constant: 8.0, toItem: view.safeAreaLayoutGuide,firistItme: true)
    
  
    
    let titleFarenheitLabel = UILabel().createLabel(text: "degrees Fahrenheit".localize(), textSize: 36, textColor: .ccOrange)
    view.addSubview(titleFarenheitLabel)
    
    titleFarenheitLabel.layoutConstraintConversion(constant: 8, toItem: valueFarenheitTextField!)


    let isReallyLabel = UILabel().createLabel(text: "is really".localize(), textSize: 36)
    view.addSubview(isReallyLabel)
    isReallyLabel.layoutConstraintConversion(constant: 40, toItem: titleFarenheitLabel)

    
    valueCelsiusLabel = UILabel().createLabel(text: "100", textSize: 70, textColor: .ccOrange)
    view.addSubview(valueCelsiusLabel)
    valueCelsiusLabel.layoutConstraintConversion(constant: 40, toItem: isReallyLabel)


    let titleCelsiusLabel = UILabel().createLabel(text: "degrees Celsius".localize(), textSize: 36, textColor: .ccOrange)
    view.addSubview(titleCelsiusLabel)
    titleCelsiusLabel.layoutConstraintConversion(constant: 8, toItem: valueCelsiusLabel!)
    
    
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureHideKeyboardWhenRootViewTapped()
  }
  
  
  
  
  @objc func fahrenheitFieldEditingChanged(_ sender: UITextField) {
    if let text = valueFarenheitTextField.text, let value = Double(text) {
      fahrenheitValue = Measurement(value: value, unit:.fahrenheit)
    } else {
      fahrenheitValue = nil
    }
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
