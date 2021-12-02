//
//  UIView+Ext.swift
//  WorldTrotter-MarzouqAlmukhlif_AbdulazizAlhwiti
//
//  Created by Marzouq Almukhlif on 25/04/1443 AH.
//

import UIKit

extension UIView {

  func layoutConstraintConversion(constant:CGFloat, toItem:Any, firistItme:Bool = false) {
    
    var attribute:NSLayoutConstraint.Attribute!
    
    if firistItme {
      attribute = .top
    } else {
      attribute = .bottom
    }
    
    NSLayoutConstraint(item: self,
                       attribute: .top,
                       relatedBy: .equal,
                       toItem: toItem,
                       attribute: attribute,
                       multiplier: 1,
                       constant: constant).isActive = true
    
    
    NSLayoutConstraint(item: self,
                       attribute: .centerX,
                       relatedBy: .equal,
                       toItem: self.superview?.safeAreaLayoutGuide,
                       attribute:.centerX,
                       multiplier: 1,
                       constant: 0).isActive = true
    
  }
  
  
  func layoutConstraintMap(constant:CGFloat, toItem:Any, firistItme:Bool = false) {
    
    var attribute:NSLayoutConstraint.Attribute!
    
    if firistItme {
      attribute = .top
    } else {
      attribute = .bottom
    }
    
    NSLayoutConstraint(item: self,
                       attribute: .top,
                       relatedBy: .equal,
                       toItem: toItem,
                       attribute: attribute,
                       multiplier: 1,
                       constant: constant).isActive = true
    
    
      NSLayoutConstraint(item: self,
                         attribute: .leading,
                         relatedBy: .equal,
                         toItem: self.superview,
                         attribute:.leadingMargin,
                         multiplier: 1,
                         constant: constant).isActive = true
    
    
    
    NSLayoutConstraint(item: self,
                       attribute: .trailing,
                       relatedBy: .equal,
                       toItem: self.superview,
                       attribute:.trailingMargin,
                       multiplier: 1,
                       constant: constant).isActive = true
    
    
    
    
    
  }
  
  
  func layoutConstraint(constant:CGFloat, toItem:Any, firistItme:Bool = false) {
    
    var attribute:NSLayoutConstraint.Attribute!
    
    if firistItme {
      attribute = .top
    } else {
      attribute = .bottom
    }
    
    NSLayoutConstraint(item: self,
                       attribute: .top,
                       relatedBy: .equal,
                       toItem: toItem,
                       attribute: attribute,
                       multiplier: 1,
                       constant: constant).isActive = true
    
    
    NSLayoutConstraint(item: self,
                       attribute: .centerX,
                       relatedBy: .equal,
                       toItem: self.superview?.safeAreaLayoutGuide,
                       attribute:.centerX,
                       multiplier: 1,
                       constant: 0).isActive = true
    
  }
  
  
}

