//
//  ConversionViewController.swift
//  WorldTrotter-Review-“BUSHRA_Nada”
//
//  Created by bushra nazal alatwi on 24/04/1443 AH.
//

import Foundation
import UIKit
class ConversionViewController: UIViewController {
  override func loadView() {
    
    // Create an empty view
    view = UIView()
    view.backgroundColor = UIColor(red: (245.0/255),
                                   green: (244.0/255),
                                   blue: (241.0/255),
                                   alpha: 1)
    
    // Create and add subviews
    let valueFarenheitLabel = CMLabel(text: "212",
                                          textSize: 70,
                                          textColor: UIColor.ccOrange)
    
    let titleFarenheitLabel = CMLabel(text: "degrees Fahrenheit",
                                          textSize: 36,
                                          textColor: UIColor.ccOrange)
    
    let isReallyLabel = CMLabel(text: "are really",
                                    textSize: 36)
    
    let valueCelsiusLabel = CMLabel(text: "100",
                                        textSize: 70,
                                        textColor: UIColor.ccOrange)
    
    let titleCelsiusLabel = CMLabel(text: "degrees Celsius",
                                        textSize: 36,
                                        textColor: UIColor.ccOrange)
    
    view.addSubview(valueFarenheitLabel)
    view.addSubview(titleFarenheitLabel)
    view.addSubview(isReallyLabel)
    view.addSubview(valueCelsiusLabel)
    view.addSubview(titleCelsiusLabel)
    
    // Add constraints
    let valueFarenheitTopConstraint = valueFarenheitLabel.topAnchor
      .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                  constant: 8)
    
    let valueFarenheitCenterXConstraint = valueFarenheitLabel.centerXAnchor
      .constraint(equalTo: view.centerXAnchor)
    
    let titlefahrenheitTopConstraint = titleFarenheitLabel.topAnchor
      .constraint(equalTo: valueFarenheitLabel.bottomAnchor,
                  constant: 10)
    let titleFahrenheitCenterXConstraint = titleFarenheitLabel.centerXAnchor
      .constraint(equalTo: view.centerXAnchor)
    
    let isReallyTopConstraint = isReallyLabel.topAnchor
      .constraint(equalTo: titleFarenheitLabel.bottomAnchor,
                  constant: 40)
    let isReallyCenterXConstraint = isReallyLabel
      .centerXAnchor.constraint(equalTo: view.centerXAnchor)
    
    let valueCelsiusTopConstraint = valueCelsiusLabel.topAnchor
      .constraint(equalTo: isReallyLabel.bottomAnchor,
                  constant: 40)
    let valueCelsiusCenterXConstraint = valueCelsiusLabel.centerXAnchor
      .constraint(equalTo: view.centerXAnchor)
    
    let titleCelsiusTopConstraint = titleCelsiusLabel.topAnchor
      .constraint(equalTo: valueCelsiusLabel.bottomAnchor,
                  constant: 10)
    let titleCelsiusCenterXConstraint = titleCelsiusLabel.centerXAnchor
      .constraint(equalTo: view.centerXAnchor)
    
    
    // Activate constraints
    valueFarenheitTopConstraint.isActive = true
    valueFarenheitCenterXConstraint.isActive = true
    titlefahrenheitTopConstraint.isActive = true
    titleFahrenheitCenterXConstraint.isActive = true
    isReallyTopConstraint.isActive = true
    isReallyCenterXConstraint.isActive = true
    valueCelsiusTopConstraint.isActive = true
    valueCelsiusCenterXConstraint.isActive = true
    titleCelsiusTopConstraint.isActive = true
    titleCelsiusCenterXConstraint.isActive = true
  }
  
  
  
  
}


