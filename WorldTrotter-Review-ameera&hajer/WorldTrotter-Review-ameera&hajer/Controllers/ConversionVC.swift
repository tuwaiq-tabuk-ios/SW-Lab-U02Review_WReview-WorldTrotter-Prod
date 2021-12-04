//
//  ConversionVC.swift
//  WorldTrotter-Review-ameera&hajer
//


import UIKit

class ConversionVC: UIViewController {

//  MARK: - @IBOutlet
    
  @IBOutlet var celsiusLabel: UILabel!
  @IBOutlet var textField: UITextField!
  
    
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionVC loaded its view.")
    updateCelsiusLabel()
    configureHideKeyboardWhenRootViewTapped()
  }
  
  var fahrenheitValue: Measurement<UnitTemperature>?{
    didSet {
      updateCelsiusLabel()
    }
  }
  
  var celsiusValue: Measurement<UnitTemperature>? {
    if let fahrenheitValue = fahrenheitValue {
      return fahrenheitValue.converted(to: .celsius)
    } else {
      return nil }
  }
  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
  }()
  
//  MARK: - @IBAction
    
  @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    if let text = textField.text, let value = Double(text) {
      fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
    } else {
      fahrenheitValue = nil
    }
  }
  
  
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
    } else {
      celsiusLabel.text = "?"
    }
  }
}
