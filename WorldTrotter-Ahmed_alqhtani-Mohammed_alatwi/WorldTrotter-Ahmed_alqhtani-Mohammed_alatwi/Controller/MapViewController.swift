//
//  MapViewController.swift
//  WorldTrotter-Ahmed_alqhtani-Mohammed_alatwi
//
//  Created by Ahmed awadh alqhtani on 24/04/1443 AH.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  var locatioManger = CLLocationManager()
  var mapView: MKMapView!
  
  
  
  override func loadView() {
    locatioManger = CLLocationManager()
    mapView = MKMapView()
    locatioManger.requestAlwaysAuthorization()
    view = mapView
    
    
    let standardString = NSLocalizedString("Standard", comment: "Standard map view")
    let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
    let satelliteString
      = NSLocalizedString("Satellite", comment: "Satellite map view")
    let segmentedControl
      = UISegmentedControl(items: [standardString, hybridString, satelliteString])
    
    
    
    
    
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(
      self,
      action: #selector(mapTypeChanged(_:)),
      for: .valueChanged
    )
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
    
    let margins = view.layoutMarginsGuide
    
    segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    
    segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    
    // Label
    let pointsOfInterestLabel = UILabel()
    pointsOfInterestLabel.text = "Points of Interest"
    
    view.addSubview(pointsOfInterestLabel)
    pointsOfInterestLabel
      .translatesAutoresizingMaskIntoConstraints = false
    // Switch
    
    
    let pointsOfInterestSwitch = UISwitch ()
    pointsOfInterestSwitch.isOn = true
    pointsOfInterestSwitch
      .translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pointsOfInterestSwitch)
    
    pointsOfInterestSwitch.addTarget(
      self,
      action: #selector(togglePointsOfInterest),
      for: .valueChanged
    )
    
    pointsOfInterestLabel.topAnchor.constraint(greaterThanOrEqualTo: segmentedControl.topAnchor,
                                               constant: 25).isActive = true
    
    pointsOfInterestLabel
      .leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    
    pointsOfInterestSwitch
      .leadingAnchor.constraint(equalTo: pointsOfInterestLabel.trailingAnchor,
                                constant: 15).isActive = true
    
    pointsOfInterestSwitch
      .topAnchor.constraint(greaterThanOrEqualTo: segmentedControl.topAnchor,
                            constant: 35 ).isActive = true
    
    pointsOfInterestLabel
      .centerYAnchor.constraint(equalTo: pointsOfInterestSwitch.centerYAnchor).isActive = true
  }
  
  
  @objc func togglePointsOfInterest(_ sender: UISwitch) {
    if sender.isOn {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
    } else {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
    }
  }
  
  @objc func showLocalization(sender: UIButton!){
    locatioManger.requestWhenInUseAuthorization()
    mapView.showsUserLocation = true
    
  }
  
  
  @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
    switch segControl.selectedSegmentIndex {
    case 0:
      mapView.mapType = .standard
    case 1:
      mapView.mapType = .hybrid
    case 2:
      mapView.mapType = .satellite
    default:
      break
      
    }
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.showsUserLocation = true
    mapView.delegate = self
    
    
    
  }
}

