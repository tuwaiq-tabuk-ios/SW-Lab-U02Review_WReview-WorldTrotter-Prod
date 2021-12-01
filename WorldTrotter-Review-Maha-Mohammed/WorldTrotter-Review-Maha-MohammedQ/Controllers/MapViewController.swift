//
//  MapViewController.swift
//  WorldTrotter-Review-Maha-MohammedQ
//
//  Created by Maha S on 29/11/2021.
//


import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
  
  var mapView: MKMapView!
  
  var locationManager = CLLocationManager()
  
  
  func setupLocationManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
  }
  
  //This function is for determine the location of the user
  func determineCurrentLocation() {
    guard [.authorizedWhenInUse, .authorizedAlways].contains(locationManager.authorizationStatus)
    else {
      print("App does not have authorization to determine user location. Authorization status: \(locationManager.authorizationStatus)")
      return
    }
    mapView.showsUserLocation = true
  }
  
  //This function is for asking the user for his location
  func requestLocationPermission () {
    if locationManager.authorizationStatus == .notDetermined {
      locationManager.requestWhenInUseAuthorization()
    } else {
      determineCurrentLocation()
    }
  }
  
  
  override func loadView() {
    mapView = MKMapView()
    
    view = mapView
    let segmentedControl = UISegmentedControl(items: ["Standard".localize(),
                                                      "Hyprid".localize(),
                                                      "Satellite".localize()])
    
    
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.addTarget(self,
                               action: #selector(mapTypeChanged(_ :)),
                               for: .valueChanged)
    
    //Segmented Control Constraints
    let margins = view.layoutMarginsGuide
    
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(segmentedControl)
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
   
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
  
    let pointsOfInterestLabel = UILabel()
   
    pointsOfInterestLabel.text = "Points of Interest".localize()
    pointsOfInterestLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pointsOfInterestLabel)
    
    
    let pointsOfInterestSwitch = UISwitch()
    pointsOfInterestSwitch.isOn = true
    pointsOfInterestSwitch.addTarget(self,
                                     action: #selector(togglePointsOfInterest),
                                     for: .valueChanged)
    
    pointsOfInterestSwitch.translatesAutoresizingMaskIntoConstraints = false
    
    
    //Constraints of PointsInterest
    let pointOfInterestLabelTopConstraint = pointsOfInterestLabel.topAnchor.constraint(greaterThanOrEqualTo: segmentedControl.topAnchor, constant: 8)
    let pointOfInterestLabelLeadingConstraint = pointsOfInterestLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let pointOfInterestSwitchLeadingConstraint = pointsOfInterestSwitch.leadingAnchor.constraint(equalTo: pointsOfInterestLabel.trailingAnchor, constant: 8)
    let pointOfInterestSwitchTopConstraint = pointsOfInterestSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
    let pointOfInterestVerticalAlignConstraint = pointsOfInterestLabel.centerYAnchor.constraint(equalTo: pointsOfInterestSwitch.centerYAnchor)
    view.addSubview(pointsOfInterestSwitch)
    
    
    //Activate constraints
    //Activation for Segmented
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    //Activation for PointOfInterest
    pointOfInterestLabelTopConstraint.isActive = true
    pointOfInterestLabelLeadingConstraint.isActive = true
    pointOfInterestSwitchLeadingConstraint.isActive = true
    pointOfInterestSwitchTopConstraint.isActive = true
    pointOfInterestVerticalAlignConstraint.isActive = true
    
  }
  
  
  @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
    switch segControl.selectedSegmentIndex {
    case 0 :
      mapView.mapType = .standard
    case 1 :
      mapView.mapType = .hybrid
    case 2 :
      mapView.mapType = .satellite
    default :
      break
    }
  }
  
  
  @objc func togglePointsOfInterest(_ sender: UISwitch) {
    if sender.isOn {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
    }else {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    determineCurrentLocation()
    requestLocationPermission ()
    setupLocationManager()
    print ("Map View Controller loaded its view")
  }
}


extension MapViewController: CLLocationManagerDelegate {
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    determineCurrentLocation()
  }
}


