//
//  ViewController.swift
//  WorldTrotter-Review"Ressam-Reema-Hajar"
//
//  Created by Ressam Al-Thebailah on 24/04/1443 AH.
//

import UIKit

class ConversionViewController: UIViewController {
  
  var valueFarenheitLabel : UILabel!
  var titleFarenheitLabel : UILabel!
  var isReallyLabel : UILabel!
  var valueCelsiusLabel : UILabel!
  var titleCelsiusLabel : UILabel!
  
  
  override func loadView() {
    view = UIView()
    view.backgroundColor = UIColor.ccWhiteBackground
    
    
    valueFarenheitLabel = CMLabel(text: "212",
                                  textSize: 70,
                                  textColor: UIColor.ccOrange)
    view.addSubview(valueFarenheitLabel)
    
    titleFarenheitLabel = CMLabel(text: "degrees Farenheit",
                                  textSize: 36,
                                  textColor: UIColor.ccOrange)
    view.addSubview(titleFarenheitLabel)
    
    isReallyLabel = CMLabel(text: "is Really",
                            textSize: 36)
    view.addSubview(isReallyLabel)
    
    valueCelsiusLabel = CMLabel(text: "100",
                                textSize: 70,
                                textColor: UIColor.ccOrange)
    view.addSubview(valueCelsiusLabel)
    
    titleCelsiusLabel = CMLabel(text: "degrees Celsius",
                                textSize: 36,
                                textColor: UIColor.ccOrange)
    view.addSubview(titleCelsiusLabel)
    
    
    NSLayoutConstraint.activate([
      valueFarenheitLabel.topAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                               constant: 8),
      valueFarenheitLabel.centerXAnchor
        .constraint(equalTo:view.centerXAnchor),
    
      titleFarenheitLabel.topAnchor
        .constraint(equalTo:valueFarenheitLabel.bottomAnchor,
                                               constant: 10),
      titleFarenheitLabel.centerXAnchor
        .constraint(equalTo:view.centerXAnchor),
       
      isReallyLabel.topAnchor
        .constraint(equalTo:titleFarenheitLabel.bottomAnchor,
                                         constant: 40),
      isReallyLabel.centerXAnchor
        .constraint(equalTo: view.centerXAnchor),
   
      valueCelsiusLabel.topAnchor
        .constraint(equalTo:isReallyLabel.bottomAnchor,
                                             constant: 40),
      valueCelsiusLabel.centerXAnchor
        .constraint(equalTo:view.centerXAnchor),
      
      
      titleCelsiusLabel.topAnchor
        .constraint(equalTo:valueCelsiusLabel.bottomAnchor,
                                             constant: 10),
      titleCelsiusLabel.centerXAnchor
        .constraint(equalTo:view.centerXAnchor)
      
      
    ])
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("ConversionViewController loaded its View. ")
  }
  
  
}

