//
//  ViewController.swift
//  WorldTrotter-Review-Maha-MohammedQ
//
//  Created by Maha S on 29/11/2021.
//

import UIKit

class ConversionViewController: UIViewController {
  
  
  @IBAction func fahrenheitFieldEditingChanged(_ sender: UITextField) {
    
  }
  
  
  @IBOutlet var valueCelsuis: UILabel!
  
  override func loadView() {
    
    let ccWhiteBackground = UIColor(red: 245.0/255,
                                    green: 244.0/255,
                                    blue: 241.0/255,
                                    alpha: 1)
    
    let ccOrange = UIColor(red: 230.0/255.0,
                           green: 110.0/255.0,
                           blue: 53.0/255.0,
                           alpha: 1)
    
    view = UIView()
    view.backgroundColor = ccWhiteBackground
    
    let valueFahrenheitLabel = CMLabel(text: "212",
                                       textSize: 70,
                                       textColor: ccOrange)
    
    let titleFahrenheitLabel = CMLabel(text: "degrees Fahrenheit".localize(),
                                       textSize: 36,
                                       textColor: ccOrange)
    
    let isReallyLabel = CMLabel(text: "is really".localize(),
                                textSize: 36)
    
    let valueCelsiusLabel = CMLabel(text: "100",
                                    textSize: 70,
                                    textColor: ccOrange)
    
    let titleCelsiusLabel = CMLabel(text: "degrees Celsius".localize(),
                                    textSize: 36,
                                    textColor: ccOrange)
    
    
    view.addSubview(valueFahrenheitLabel)
    view.addSubview(titleFahrenheitLabel)
    view.addSubview(isReallyLabel)
    view.addSubview(valueCelsiusLabel)
    view.addSubview(titleCelsiusLabel)
    
    
    // Add constraints
    NSLayoutConstraint.activate([
      
      valueFahrenheitLabel.topAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 8),
      valueFahrenheitLabel.centerXAnchor
        .constraint(equalTo: view.centerXAnchor),
      
      titleFahrenheitLabel.topAnchor
        .constraint(equalTo: valueFahrenheitLabel.bottomAnchor,
                    constant: 10),
      titleFahrenheitLabel.centerXAnchor
        .constraint(equalTo: view.centerXAnchor),
      
      isReallyLabel.topAnchor
        .constraint(equalTo: titleFahrenheitLabel.bottomAnchor,
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
  
}
