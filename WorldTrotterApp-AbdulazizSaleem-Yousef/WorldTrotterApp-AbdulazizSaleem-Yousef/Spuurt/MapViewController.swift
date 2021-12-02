//
//  MapViewController.swift
//  WorldTrotterApp-AbdulazizSaleem-Yousef
//
//  Created by Yousef Albalawi on 24/04/1443 AH.
//

import UIKit
import MapKit


class MapViewController: UIViewController ,MKMapViewDelegate {
  var mapView: MKMapView!
  let locationManager = CLLocationManager()
  
  
  
  override func loadView() {
    mapView = MKMapView()
    view = mapView
    setupLocationManager()
    requestLocationPermission()
    
    
    //MARK: -SegmentedControl
    let segmentedControl = UISegmentedControl(items: ["Stander".localize(),
                                                      "Hybrd".localize(),
                                                      "Satellite".localize()])
    
    
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo:
                                                                view.safeAreaLayoutGuide.topAnchor,constant: 8)
    
    let margins = view.layoutMarginsGuide
    
    
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    
    
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    
    
    segmentedControl.addTarget(self,
                               action: #selector(mapTypeChanged(_:)),
                               for: .valueChanged)
    
    //MARK: - pointsOfInterestLabel
    let pointsOfInterestLabel = UILabel()
    pointsOfInterestLabel.text = "Points of Interest"
    pointsOfInterestLabel
      .translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(pointsOfInterestLabel)
    
    
    //MARK: - pointsOfInterestSwitch
    let pointsOfInterestSwitch = UISwitch()
    pointsOfInterestSwitch.isOn = true
    pointsOfInterestSwitch.addTarget(
      self,
      action: #selector(togglePointsOfInterest(_:)),
      for:  .valueChanged)
    pointsOfInterestSwitch.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pointsOfInterestSwitch)
    
    
    
    
    
    
    //MARK: - Constraints
    
    let pointsOfInterestLabelTopConstraint = pointsOfInterestLabel .topAnchor.constraint(greaterThanOrEqualTo: segmentedControl.bottomAnchor,constant: 8)
    let pointsOfInterestLabelLeadingConstraint = pointsOfInterestLabel
      .leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let pointsOfInterestVerticalAlignConstraint = pointsOfInterestLabel
      .centerYAnchor.constraint(equalTo: pointsOfInterestSwitch.centerYAnchor)
    let pointsOfInterestSwitchLeadingConstraint = pointsOfInterestSwitch
      .leadingAnchor.constraint(equalTo: pointsOfInterestLabel.trailingAnchor, constant: 8)
    let pointsOfinterestSwitchTopConstraint = pointsOfInterestSwitch
      .topAnchor.constraint(greaterThanOrEqualTo: segmentedControl.topAnchor, constant: 8)
    
    
    
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
    
    
    print ("MapViewController loaded its view .")
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    mapView.delegate = self
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
    
    
  }
  
  
  @objc func mapTypeChanged(_ segControl: UISegmentedControl){
    switch segControl.selectedSegmentIndex{
    case 0 :
      mapView.mapType = .standard
    case 1 :
      mapView.mapType = .hybrid
    case 2 :
      mapView.mapType = .satellite
    default:
      break
    }
    
  }
  
  
  @objc func togglePointsOfInterest(_ sender: UISwitch) {
    if sender.isOn {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll }
    else {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll }
  }
  
  
  func setupLocationManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
  }
  
  
  func determineCurrentLocation() {
    guard [.authorizedWhenInUse,
           .authorizedAlways].contains(locationManager.authorizationStatus)
    else {
      print("App does not have authorization to determine userlocation. Authorization status:\(locationManager.authorizationStatus)")
      return }
    mapView.showsUserLocation = true
  }
  
  
  func requestLocationPermission() {
    if locationManager.authorizationStatus == .notDetermined {
      locationManager.requestWhenInUseAuthorization()
    } else {
      determineCurrentLocation()
    } }
  
  
  func mapView(_ mapView: MKMapView,
  didUpdate userLocation: MKUserLocation) {
    let span = MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08 )
    let theRegion = MKCoordinateRegion (center: userLocation.coordinate, span: span)
    mapView.setRegion(theRegion, animated: true)
  }
}



// MARK: - Extension CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
  func locationManagerDidChangeAuthorization(_ manager:
                                              CLLocationManager) {
    determineCurrentLocation()
  }
}

