//
//  ViewController.swift
//  Internationalization-Rasha-Boshra-Shoroq
//
//  Created by rasha  on 26/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var helloWorldLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    translateScreen()
   }
   func translateScreen() {
helloWorldLabel.text = "Hello World!".localize()
   }
}

