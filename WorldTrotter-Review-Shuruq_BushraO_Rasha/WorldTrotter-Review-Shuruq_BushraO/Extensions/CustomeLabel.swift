//
//  CustomeLabel.swift
//  WorldTrotter-Review-Shuruq_BushraO
//
//  Created by Bushra alatwi on 25/04/1443 AH.
//

import UIKit


typealias CustomLabel = UILabel

extension CustomLabel {
  convenience init(withText text: String,
                   size font: CGFloat,
                   color: UIColor = UIColor(red: 0.88,
                                            green: 0.35,
                                            blue: 0.16,
                                            alpha: 1.00)) {
    
    self.init(frame: .zero)
    self.text = text
    self.font = UIFont.systemFont(ofSize: font, weight: .regular)
    self.textColor = color
  }
}
