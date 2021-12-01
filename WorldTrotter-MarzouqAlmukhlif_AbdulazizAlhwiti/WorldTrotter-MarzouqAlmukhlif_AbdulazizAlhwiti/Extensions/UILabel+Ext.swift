//
//  UIlable+Ext.swift
//  WorldTrotter-MarzouqAlmukhlif_AbdulazizAlhwiti
//
//  Created by Marzouq Almukhlif on 24/04/1443 AH.
//

import UIKit

extension UILabel {

  func createLabel(text: String,
                   textSize: CGFloat,
                   textColor: UIColor = UIColor.black) -> UILabel {
    let label = self
    label.text = text
    label.font = UIFont.systemFont(ofSize: textSize)
    label.textColor = textColor
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }
}
