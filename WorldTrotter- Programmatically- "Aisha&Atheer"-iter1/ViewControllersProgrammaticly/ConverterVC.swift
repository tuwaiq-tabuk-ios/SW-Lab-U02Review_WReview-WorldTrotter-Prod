//
//  ViewController.swift
//  WorldTrotter- Programmatically- "Aisha&Atheer"-iter1
//
//  Created by Atheer abdullah on 24/04/1443 AH.
//

import UIKit

class ConvertViewController: UIViewController {
  
  override func loadView()  {
    view = UIView()
    view.backgroundColor = UIColor(red: 246.0/255, green: 246.0/255, blue: 244.0/255, alpha: 1)
    
    let cmOrange = UIColor(red: 242/255, green: 94/255, blue: 49/255, alpha: 1)
    
    
    let fahrenheitDegreesValue = UITextField()
    
    fahrenheitDegreesValue.translatesAutoresizingMaskIntoConstraints = false
    fahrenheitDegreesValue.placeholder = "Value"
    fahrenheitDegreesValue.font = UIFont.systemFont(ofSize: 70, weight: .regular)
    fahrenheitDegreesValue.textColor = cmOrange
    
    let fahrenheitDegrees = MyLabel(withText: "Degrees Fahrenheit", size: 36, color: cmOrange)
    
    let isReally = MyLabel(withText: "is Really", size: 36, color: .black)
    
    let celisusDegreesValue = MyLabel(withText: "100", size: 70, color: cmOrange)
    
    let celisusDegrees = MyLabel(withText: "Degrees celisus", size: 36, color: cmOrange)
    
    view.addSubview(fahrenheitDegrees)
    view.addSubview(fahrenheitDegreesValue)
    view.addSubview(isReally)
    view.addSubview(celisusDegrees)
    view.addSubview(celisusDegreesValue)
    
    
    
    let margins = view.layoutMarginsGuide
    //
    fahrenheitDegreesValue.topAnchor.constraint(equalTo: margins.topAnchor, constant: 8).isActive = true
    fahrenheitDegreesValue.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    //
    fahrenheitDegrees.topAnchor.constraint(equalTo: fahrenheitDegreesValue.bottomAnchor, constant: 10).isActive = true
    fahrenheitDegrees.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    //
    
    isReally.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    isReally.topAnchor.constraint(equalTo: fahrenheitDegrees.bottomAnchor, constant: 40)
      .isActive = true
    
    //
    
    celisusDegreesValue.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
    celisusDegreesValue.topAnchor.constraint(equalTo: isReally.bottomAnchor, constant: 40
    ) .isActive = true
    //
    celisusDegrees.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
    celisusDegrees.topAnchor.constraint(equalTo: celisusDegreesValue.bottomAnchor , constant: 10) .isActive = true
    
    
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Convert view Controller loaded its View")
    
    
  }
  
  
}

