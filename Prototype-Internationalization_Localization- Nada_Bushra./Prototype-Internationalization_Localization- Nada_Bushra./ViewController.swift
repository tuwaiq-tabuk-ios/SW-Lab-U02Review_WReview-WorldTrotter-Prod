//
//  ViewController.swift
//  Prototype-Internationalization_Localization- Nada_Bushra.
//
//  Created by apple on 26/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var helloworledLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    translateScreen()
  }
  func translateScreen() {
//    لازم الكلمة اللي بغريها تكون بكل الملفات 
    helloworledLabel.text = "Hello World!".localize()
  }

}

