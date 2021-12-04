//
//  ViewController.swift
//  WorldTrotter-Review-ameera&hajer
//


import UIKit

class ConstraintConvertionVC: UIViewController {
    
    
    override func loadView() {
        
        
//        MARK: - Label
                
        view = UIView()
        view.backgroundColor = UIColor.cmWhiteBackground
        
        let valueFarenheitLabel = CMLabel(text: "212",
                                          textSize: 70,
                                          textColor: UIColor.cmOrange)
        
        let titleFarenheitLabel = CMLabel(text: "degrees Fahrenheit",
                                          textSize: 36,
                                          textColor: UIColor.cmOrange)
        
        let isReallyLabel = CMLabel(text: "is really",
                                    textSize: 36)
        
        let valueCelsiusLabel = CMLabel(text: "100",
                                        textSize: 70,
                                        textColor: UIColor.cmOrange)
        
        let titleCelsiusLabel = CMLabel(text: "degrees Celsius",
                                        textSize: 36,
                                        textColor: UIColor.cmOrange)
        
        view.addSubview(valueFarenheitLabel)
        view.addSubview(titleFarenheitLabel)
        view.addSubview(isReallyLabel)
        view.addSubview(valueCelsiusLabel)
        view.addSubview(titleCelsiusLabel)
        
        
//       MARK: - constraint
        
        NSLayoutConstraint.activate ([
            
            valueFarenheitLabel.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,constant:8),
            valueFarenheitLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            
            
            titleFarenheitLabel.topAnchor.constraint(equalTo:valueFarenheitLabel.bottomAnchor, constant:10),
            titleFarenheitLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            
            
            isReallyLabel.topAnchor.constraint(equalTo:titleFarenheitLabel.bottomAnchor, constant:40),
            isReallyLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            
            
            valueCelsiusLabel.topAnchor.constraint(equalTo:isReallyLabel.bottomAnchor, constant:40),
            valueCelsiusLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            
            
            titleCelsiusLabel.topAnchor.constraint(equalTo:valueCelsiusLabel.bottomAnchor, constant:10),
            titleCelsiusLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConstraintConversionVC loaded its view.")
    }
}

