//
//  MapVC.swift
//  WorldTrotter- Programmatically- "Aisha&Atheer"-iter1
//
//  Created by Atheer abdullah on 24/04/1443 AH.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
  
  
  var mapView : MKMapView!
  
  
  override func loadView() {
    mapView = MKMapView()
    
    let pointsOfInterestLabel = UILabel()
    pointsOfInterestLabel.translatesAutoresizingMaskIntoConstraints = false
    pointsOfInterestLabel.text = "Point of Interest"
    
    
    
    
    view = mapView
    //MARK: - Segmantation was created here
    let standardString = NSLocalizedString("Standard", comment: "Standard map view")
    let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
    let satelliteString
      = NSLocalizedString("Satellite", comment: "Satellite map view")
    let segmentedControl
      = UISegmentedControl(items: [standardString, hybridString, satelliteString])
    
    segmentedControl.backgroundColor = .systemBackground
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    view.addSubview(pointsOfInterestLabel)
    
    //MARK: - Creating Label
    pointsOfInterestLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
    pointsOfInterestLabel.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor , constant: 20).isActive = true
    
    //MARK: - Creating Switch toggle
    let switchPoint = UISwitch()
    switchPoint.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(switchPoint)
    
    switchPoint.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
    
    switchPoint.leadingAnchor.constraint(equalTo: pointsOfInterestLabel.trailingAnchor, constant: 10).isActive = true
    
    
    
    
    
    let margins = view.layoutMarginsGuide
    
    segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
    
    segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    
    segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    
    segmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)
    
    switchPoint.addTarget(self, action: #selector(togglePointOfIntrerest), for: .valueChanged)
  }
  
  
  //MARK: - Change Type of Map
  
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
  
  //MARK: - TogglePoint
  
  @objc func togglePointOfIntrerest(_ sender : UISwitch) {
    if sender.isOn {
      mapView.pointOfInterestFilter = .includingAll
      
    }else{
      mapView.pointOfInterestFilter = .excludingAll
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Map View Controller loaded its View")
  }
}
