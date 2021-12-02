//
//  CMLabel.swift
//  WorldTrotterApp-AbdulazizSaleem-Yousef
//
//  Created by Yousef Albalawi on 25/04/1443 AH.
//

import UIKit
class CMLadel: UILabel {
  override init (frame:CGRect) {
    super .init(frame: frame)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("Init(Coder:)has not been implemented")
  }
  
  
  init(text:String,
       textSize:CGFloat,
       textColor:UIColor = UIColor.black){
    super.init(frame: .zero)
    self .text = text
    self .font = UIFont.systemFont(ofSize: textSize)
    self .textColor = textColor
    
    customize()
  }
  
  
  private func customize(){
    translatesAutoresizingMaskIntoConstraints = false
  }

}
