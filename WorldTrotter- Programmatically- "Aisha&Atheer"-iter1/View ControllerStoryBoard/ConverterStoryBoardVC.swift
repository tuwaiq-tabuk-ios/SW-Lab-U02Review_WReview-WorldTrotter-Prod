//
//  ConverterStoryBoardVC.swift
//  WorldTrotter- Programmatically- "Aisha&Atheer"-iter1
//
//  Created by Atheer abdullah on 24/04/1443 AH.
//

import UIKit

class ConverterStoryBoardVC: UIViewController {
  
  var fahrenheitValue : Measurement<UnitTemperature>?{
    didSet{
      updateCelsiusLable()
    }
  }
  var celsiusValue : Measurement<UnitTemperature>?{
    
    if let fahrenheitValue = fahrenheitValue{return fahrenheitValue.converted(to: .celsius)
      
    }else{
      return nil
    }
    
  }
  
  var numberFormatter : NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.maximumFractionDigits = 1
    nf.minimumFractionDigits = 0
    return nf
    
  }()
  
  
  @IBOutlet weak var valueFahrenHieghtTextField: UITextField!
  @IBOutlet weak var valueCelsiusLable: UILabel!
  
  
  func updateCelsiusLable (){
    if let celsiusValue = celsiusValue{
      valueCelsiusLable.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
      
    }else {
      valueCelsiusLable.text = "???"
    }
  }
  
  
  @IBAction func fahrenHieghtEditingChanged(_ sender: UITextField) {
    
    
    if let text = sender.text, let value = Double(text){
      fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
    }else{
      fahrenheitValue = nil
    }
  }
  
  
  
  @IBAction func dissmissKeyboard(_ sender: UITapGestureRecognizer) {
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    valueFahrenHieghtTextField.delegate = self
    confingureHideKeyboard()
    
  }
}
