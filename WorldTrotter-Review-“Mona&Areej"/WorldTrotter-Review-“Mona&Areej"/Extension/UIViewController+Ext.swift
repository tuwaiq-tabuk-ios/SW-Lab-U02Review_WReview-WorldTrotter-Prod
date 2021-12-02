//
//  UIViewController+Ext.swift
//  WorldTrotter-Review-“Mona&Areej"
//
//  Created by mona M on 01/12/2021.
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
