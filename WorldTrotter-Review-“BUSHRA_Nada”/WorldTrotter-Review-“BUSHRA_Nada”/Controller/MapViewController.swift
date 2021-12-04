//
//  ViewController.swift
//  WorldTrotter-Review-“BUSHRA_Nada”
//
//  Created by bushra nazal alatwi on 24/04/1443 AH.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  var mapView: MKMapView!
  
  let locationManager = CLLocationManager()
  
  override func loadView() {
    // Create a map view
    mapView = MKMapView()
    
    // Set it as *the* view of this view controller
    view = mapView
    
    setupLocationManager()
    
    requestLocationPermission()
    
    let standardString = NSLocalizedString("Standard", comment: "Standard map view")
    let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
    let satelliteString
      = NSLocalizedString("Satellite", comment: "Satellite map view")
    let segmentedControl
      = UISegmentedControl(items: [standardString, hybridString, satelliteString])
    
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    segmentedControl.addTarget(
      self,
      action: #selector(mapTypeChanged(_:)),
      for: .valueChanged
    )
    
    // Create points of interest label
    let pointsOfInterestLabel = UILabel()
    pointsOfInterestLabel.text = "Points of Interest"
    
    pointsOfInterestLabel
      .translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(pointsOfInterestLabel)
    
    // Create points of interest UISwitch
    let pointsOfInterestSwitch = UISwitch()
    pointsOfInterestSwitch.isOn = true
    
    pointsOfInterestSwitch.addTarget(
      self,
      action: #selector(togglePointsOfInterest),
      for: .valueChanged
    )
    
    pointsOfInterestSwitch
      .translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(pointsOfInterestSwitch)
    
    
    let topConstraint = segmentedControl.topAnchor
      .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
    
    let margins = view.layoutMarginsGuide
    
    let leadingConstraint = segmentedControl.leadingAnchor
      .constraint(equalTo: margins.leadingAnchor)
    
    let trailingConstraint = segmentedControl.trailingAnchor
      .constraint(equalTo: margins.trailingAnchor)
    
    let pointsOfInterestLabelTopConstraint = pointsOfInterestLabel     .topAnchor.constraint(greaterThanOrEqualTo: segmentedControl.bottomAnchor,
                                                                                             constant: 8)
    let pointsOfInterestLabelLeadingConstraint = pointsOfInterestLabel
      .leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let pointsOfInterestSwitchLeadingConstraint = pointsOfInterestSwitch
      .leadingAnchor.constraint(equalTo: pointsOfInterestLabel.trailingAnchor,
                                constant: 8)
    let pointsOfinterestSwitchTopConstraint = pointsOfInterestSwitch
      .topAnchor.constraint(greaterThanOrEqualTo: segmentedControl.bottomAnchor,
                            constant: 8)
    let pointsOfInterestVerticalAlignConstraint = pointsOfInterestLabel
      .centerYAnchor.constraint(equalTo: pointsOfInterestSwitch.centerYAnchor)
    
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    pointsOfInterestLabelTopConstraint.isActive = true
    pointsOfInterestLabelLeadingConstraint.isActive = true
    pointsOfInterestSwitchLeadingConstraint.isActive = true
    pointsOfinterestSwitchTopConstraint.isActive = true
    pointsOfInterestVerticalAlignConstraint.isActive = true
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
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
  
  
  @objc func togglePointsOfInterest(_ sender: UISwitch) {
    
    if sender.isOn {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
    } else {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
    }
    
  }
  
  
  func setupLocationManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
  }
  
  
  func determineCurrentLocation() {
    // Check to see if we obtained authorization. If not, we cannot proceed.
    guard [.authorizedWhenInUse,
           .authorizedAlways].contains(locationManager.authorizationStatus)
    else {
      print("App does not have authorization to determine user location. Authorization status:\(locationManager.authorizationStatus)")
      return
    }
    
    // Soon after this is set to true, we will start receiving calls to the MKMapViewDelegate methods we implemented below.
    mapView.showsUserLocation = true
  }
  
  
  func requestLocationPermission() {
    // Only request authorization if it has not already been determined.
    // Otherwise, there is no reason to attempt again, because iOS will not allow us to ask a second time.
    if locationManager.authorizationStatus == .notDetermined {
      // After calling this method, it will call our delegate method locationManagerDidChangeAuthorization().
      locationManager.requestWhenInUseAuthorization()
      
    } else {
      determineCurrentLocation()
    }
  }
  
}






// MARK: - Extension CLLocationManagerDelegate

extension MapViewController: CLLocationManagerDelegate {
  
  func locationManagerDidChangeAuthorization(_ manager:
                                              CLLocationManager) {
    determineCurrentLocation()
  }
  
}


