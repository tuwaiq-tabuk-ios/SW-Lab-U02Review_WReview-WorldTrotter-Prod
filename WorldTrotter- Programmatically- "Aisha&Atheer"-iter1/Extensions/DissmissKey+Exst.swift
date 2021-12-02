//
//  DissmissKey+Exst.swift
//  WorldTrotter- Programmatically- "Aisha&Atheer"-iter1
//
//  Created by Atheer abdullah on 25/04/1443 AH.
//

import UIKit


extension UIViewController {
  
  func confingureHideKeyboard()  {
    let tap = UITapGestureRecognizer (target: self,
                                      action: #selector(UIViewController.dismissKeypoard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeypoard()  {
    view.endEditing(true)
  }
}
