//
//  ConversionViewControllerProgrammer.swift
//  WorldTrotter-Review-“Mona&Areej"
//
//  Created by mona M on 30/11/2021.
//

import UIKit

class ConversionViewControllerProgrammatically : UIViewController {
  
  override func loadView() {
    
    
    //Create an empty view
    view = UIView()
    view.backgroundColor = UIColor.ccWhiteBackground
    
    
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
    
    //Add Subviews
    view.addSubview(valueFarenheitLabel)
    view.addSubview(titleFarenheitLabel)
    view.addSubview(isReallyLabel)
    view.addSubview(valueCelsiusLabel)
    view.addSubview(titleCelsiusLabel)
    
    
    //Add Constraints and Activate constraints
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
      isReallyLabel
        .centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      valueCelsiusLabel.topAnchor
        .constraint(equalTo: isReallyLabel.bottomAnchor,
                    constant: 40),
      valueCelsiusLabel.centerXAnchor
        .constraint(equalTo: view.centerXAnchor),
      
      titleCelsiusLabel.topAnchor
        .constraint(equalTo: valueCelsiusLabel.bottomAnchor,
                    constant: 10),
      titleCelsiusLabel.centerXAnchor
        .constraint(equalTo: view.centerXAnchor) ])
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Conversion View Controller loaded its view. ")
    
  }
  
}
