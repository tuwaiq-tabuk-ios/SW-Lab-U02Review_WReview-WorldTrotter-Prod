//
//  UIViewController+Ext.swift
//  WorldTrotter-MarzouqAlmukhlif_AbdulazizAlhwiti
//
//  Created by Marzouq Almukhlif on 25/04/1443 AH.
//

import UIKit

extension UIViewController {
  func configureHideKeyboardWhenRootViewTapped() {
    let tap = UITapGestureRecognizer(
      target: self,
      action: #selector(self.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  // Called when the tap is recognized.
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}
