//
//  UIViewController+Ext.swift
//  WorldTrotter-Ahmed_alqhtani-Mohammed_alatwi
//
//  Created by Ahmed awadh alqhtani on 25/04/1443 AH.
//

import UIKit

extension UIViewController {
func configureHideKeyboardWhenRootViewTapped() {
    let tap = UITapGestureRecognizer(
      target: self,
      action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
   
   
  // Called when the tap is recognized.
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
   
}
