//
//  UIViewController+Ext.swift
//  WorldTrotter-Review-“BUSHRA_Nada”
//
//  Created by bushra nazal alatwi on 26/04/1443 AH.
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
