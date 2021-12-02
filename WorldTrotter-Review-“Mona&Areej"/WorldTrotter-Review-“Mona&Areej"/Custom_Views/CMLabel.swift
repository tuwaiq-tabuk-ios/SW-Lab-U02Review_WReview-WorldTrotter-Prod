//
//  CMLabel.swift
//  WorldTrotter-Review-“Mona&Areej"
//
//  Created by mona M on 30/11/2021.
//

import UIKit

class CMLabel : UILabel {
  
  override init(frame: CGRect){
    super.init(frame: frame)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  init (text: String,
        textSize: CGFloat,
        textColor: UIColor = UIColor.black){
    super.init(frame: .zero)
    self.text = text
    self.font = UIFont.systemFont(ofSize: textSize)
    self.textColor = textColor
    
    customize()
    
  }
  
  
  private func customize(){
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}


