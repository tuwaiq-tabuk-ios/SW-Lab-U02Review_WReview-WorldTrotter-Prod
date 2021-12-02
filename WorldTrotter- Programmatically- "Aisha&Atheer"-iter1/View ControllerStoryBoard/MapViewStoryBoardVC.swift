//
//  MapVC.swift
//  WorldTrotter- Programmatically- "Aisha&Atheer"-iter1
//
//  Created by Atheer abdullah on 24/04/1443 AH.
//

import UIKit
import MapKit



class MapViewStoryBoardVC: UIViewController {
  
  
  @IBOutlet weak var mapView: MKMapView!
  
  @IBOutlet weak var switchPoint: UISwitch!
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Map View Controller loaded its View")
    
    segmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)
    
    switchPoint.addTarget(self, action: #selector(togglePointOfIntrerest), for: .valueChanged)
  }
  
  
  @objc func mapTypeChanged(_ segControl : UISegmentedControl) {
    switch segControl.selectedSegmentIndex {
    case 0:
      mapView.mapType = .standard
    case 1 :
      mapView.mapType = .hybrid
    case 2 :
      mapView.mapType = .satellite
    default:
      break
    }
  }
  
  
  @objc func togglePointOfIntrerest(_ sender : UISwitch) {
    if sender.isOn {
      mapView.pointOfInterestFilter = .includingAll
      
    }else{
      mapView.pointOfInterestFilter = .excludingAll
    }
  }
}



