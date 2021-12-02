//
//  classUIlable.swift
//  WorldTrotter- Programmatically- "Aisha&Atheer"-iter1
//
//  Created by Atheer abdullah on 24/04/1443 AH.
//

import UIKit

class MyLabel: UILabel {
  
  
  override init(frame: CGRect) {
    super.init(frame: frame )
  }
  
  
  init(withText text : String, size font : CGFloat , color : UIColor = UIColor.black) {
    super .init(frame: .zero)
    
    self.text = text
    self.font = UIFont.systemFont(ofSize: font, weight: .regular)
    self.textColor = color
    self.translatesAutoresizingMaskIntoConstraints = false

    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

