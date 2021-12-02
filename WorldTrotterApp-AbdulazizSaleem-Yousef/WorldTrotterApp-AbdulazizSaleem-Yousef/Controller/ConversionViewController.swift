//
//  ConversionViewController.swift
//  WorldTrotterApp-AbdulazizSaleem-Yousef
//
//  Created by Yousef Albalawi on 24/04/1443 AH.
//

import UIKit

class ConversionViewController: UIViewController {
  
  
  
  
  override func loadView() {
    
    view = UIView()
    view.backgroundColor = UIColor.ccWhiteBackground
    
    
    let valueFarenheitLabel = CMLadel(text: "212".localize(),
                                      textSize: 70,
                                      textColor: UIColor.ccOrange)
    view.addSubview(valueFarenheitLabel)
    
    
    let titleFarenheitLabel = CMLadel(text: "degrees Fahrenheit".localize(),
                                      textSize: 36,
                                      textColor: UIColor.ccOrange)
    view.addSubview(titleFarenheitLabel)
    
    
    let isReallyLabel = CMLadel(text:  "is really".localize(),
                                textSize: 36)
    view.addSubview(isReallyLabel)
    
    
    let valueCelsiusLabel = CMLadel(text: "100".localize(),
                                    textSize: 70,
                                    textColor: UIColor.ccOrange)
    view.addSubview(valueCelsiusLabel)
    
    
    let titleCelsiusLabel = CMLadel(text: "degrees Celsius".localize(),
                                    textSize: 36,
                                    textColor: UIColor.ccOrange)
    view.addSubview(titleCelsiusLabel)
    
    
    
    NSLayoutConstraint.activate([
      valueFarenheitLabel.topAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 8),
      valueFarenheitLabel.centerXAnchor
        .constraint(equalTo: view.centerXAnchor),
      titleFarenheitLabel.topAnchor
        .constraint(equalTo: valueFarenheitLabel.bottomAnchor,
                    constant: 10),
      titleFarenheitLabel.centerXAnchor
        .constraint(equalTo: view.centerXAnchor),
      isReallyLabel.topAnchor
        .constraint(equalTo: titleFarenheitLabel.bottomAnchor,
                    constant: 40),
      isReallyLabel.centerXAnchor
        .constraint(equalTo: view.centerXAnchor),
      valueCelsiusLabel.topAnchor
        .constraint(equalTo: isReallyLabel.bottomAnchor,
                    constant: 40),
      valueCelsiusLabel.centerXAnchor
        .constraint(equalTo: view.centerXAnchor),
      titleCelsiusLabel.topAnchor
        .constraint(equalTo: valueCelsiusLabel.bottomAnchor,
                    constant: 10),
      titleCelsiusLabel.centerXAnchor
        .constraint(equalTo: view.centerXAnchor),
    ])
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its View")
  }
}
