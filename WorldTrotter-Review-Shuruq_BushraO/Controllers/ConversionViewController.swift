//  WorldTrotter-Review-Shuruq_BushraO
//
//  Created by Shorouq AlAnzi on 24/04/1443 AH.
//


import UIKit

class ConversionViewController: UIViewController {
  
  
  override func loadView() {
    view = UIView()
    
    view.backgroundColor = UIColor(red: 0.96,
                                   green: 0.96,
                                   blue: 0.95,
                                   alpha: 1.00)
    
    
    let valueFarenheitLabel = CMLabel(text: "212", textSize: 70,
                                      textColor: UIColor.orangeBackground)
    
    
    let titleFarenheitLabel = CMLabel(text: "degrees Fahrenheit", textSize: 36,
                                      textColor: UIColor.orangeBackground)
    
    
    let isReally = CMLabel(text: "is really", textSize: 36)
    
    
    let valueCelsiusLabel = CMLabel(text: "100", textSize: 70,
                                    textColor: UIColor.orangeBackground)
    
    
    let titleCelsiusLabel = CMLabel(text: "degrees Celsius", textSize: 36,
                                    textColor: UIColor.orangeBackground)
    
    
    view.addSubview(valueFarenheitLabel)
    view.addSubview(titleFarenheitLabel)
    view.addSubview(isReally)
    view.addSubview(valueCelsiusLabel)
    view.addSubview(titleCelsiusLabel)
    
    
    let TNTopConstraint = valueFarenheitLabel.topAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
    let TNXConstraint = valueFarenheitLabel.centerXAnchor
        .constraint(equalTo: view.centerXAnchor)
    
    
    let DFTopContraint = titleFarenheitLabel.topAnchor
        .constraint(equalTo: valueFarenheitLabel.bottomAnchor, constant: 8)
    let DFXConstraint = titleFarenheitLabel.centerXAnchor
        .constraint(equalTo: valueFarenheitLabel.centerXAnchor)
    
    
    let IRTopConstraint = isReally.topAnchor
        .constraint(equalTo: titleFarenheitLabel.bottomAnchor, constant: 8)
    let IRXConstraint = isReally.centerXAnchor
        .constraint(equalTo: valueFarenheitLabel.centerXAnchor)
    
    let BNTopConstraint = valueCelsiusLabel.topAnchor
        .constraint(equalTo: isReally.bottomAnchor, constant: 8)
    let BNXConstraint = valueCelsiusLabel.centerXAnchor
        .constraint(equalTo: valueFarenheitLabel.centerXAnchor)
    
    
    let DCTopConstraint = titleCelsiusLabel.topAnchor
        .constraint(equalTo: valueCelsiusLabel.bottomAnchor, constant: 8)
    let DCXConstraint = titleCelsiusLabel.centerXAnchor
        .constraint(equalTo: valueCelsiusLabel.centerXAnchor)
    
    TNTopConstraint.isActive = true
    TNXConstraint.isActive = true

    DFTopContraint.isActive = true
    DFXConstraint.isActive = true
    
    IRTopConstraint.isActive = true
    IRXConstraint.isActive = true
    
    BNTopConstraint.isActive = true
    BNXConstraint.isActive = true
    
    DCTopConstraint.isActive = true
    DCXConstraint.isActive = true
    

  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its view.")
  }
  
  }
  


