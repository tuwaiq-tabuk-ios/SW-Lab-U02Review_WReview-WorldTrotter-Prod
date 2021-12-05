//
//  ViewController.swift
//  WorldTrotter-Ahmed_alqhtani-Mohammed_alatwi
//
//  Created by Ahmed awadh alqhtani on 24/04/1443 AH.
//

import UIKit

class ConversionViewController: UIViewController {
  
  override func loadView() {
    view = UIView()
    view.backgroundColor = UIColor.white
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupScreen()
  
  }
  func setupScreen() {
    var allLabels: [UILabel] = []
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
    allLabels.append(valueFarenheitLabel)
    allLabels.append(titleFarenheitLabel)
    allLabels.append(isReallyLabel)
    allLabels.append(valueCelsiusLabel)
    allLabels.append(titleCelsiusLabel)

    for label in allLabels {
      view.addSubview(label)
    }

    let fahrenheitNumberTopConstraint = valueFarenheitLabel.topAnchor
      .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
    fahrenheitNumberTopConstraint.isActive = true

    let fahrenheitNumberCenterConstraint = valueFarenheitLabel.centerXAnchor
      .constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
    fahrenheitNumberCenterConstraint.isActive = true


    for i in 1...allLabels.count-1 {
      let prevLabel = allLabels[i-1]
      let curLabel = allLabels[i]
      let centerXConstraint = curLabel.centerXAnchor
        .constraint(equalTo: valueFarenheitLabel.centerXAnchor)
      centerXConstraint.isActive = true

      let bottomTopConstraint = curLabel.topAnchor
        .constraint(equalTo: prevLabel.bottomAnchor, constant: 8)
      bottomTopConstraint.isActive = true
    }
  }
}

