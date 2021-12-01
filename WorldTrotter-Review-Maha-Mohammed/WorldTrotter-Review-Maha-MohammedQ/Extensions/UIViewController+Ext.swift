//
//  UIViewController+Ext.swift
//  WorldTrotter-Review-Maha-MohammedQ
//
//  Created by Maha S on 30/11/2021.
//


import UIKit

extension UIViewController {
  
  func configureHideKeyboardWhenRootViewTapped(){
    
    let tap = UITapGestureRecognizer (target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }

  @objc func dismissKeyboard () {
    view.endEditing(true)
  }


}

