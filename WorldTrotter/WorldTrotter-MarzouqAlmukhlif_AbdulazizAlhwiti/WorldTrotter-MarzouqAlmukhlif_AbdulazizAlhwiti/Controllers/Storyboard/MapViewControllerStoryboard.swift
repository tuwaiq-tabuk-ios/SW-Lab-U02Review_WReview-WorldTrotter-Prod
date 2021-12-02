//
//  MapViewControllerStoryboard.swift
//  WorldTrotter-MarzouqAlmukhlif_AbdulazizAlhwiti
//
//  Created by Marzouq Almukhlif on 24/04/1443 AH.
//

import UIKit
import MapKit

class MapViewControllerStoryboard: UIViewController,CLLocationManagerDelegate {

  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
  @IBOutlet weak var pointsOfInterestSwitch: UISwitch!
  
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    segmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)
    pointsOfInterestSwitch.addTarget(self, action: #selector(togglePointsOfInterest), for: .valueChanged)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupLocationManager()
    requestLocationPermission()
    
    if (CLLocationManager.locationServicesEnabled()) {
      locationManager.requestAlwaysAuthorization()
      locationManager.requestWhenInUseAuthorization()
    }
    
    DispatchQueue.main.async {
      self.locationManager.startUpdatingLocation()
    }
  }
  
  @objc func togglePointsOfInterest(_ sender: UISwitch) {
    if sender.isOn {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
    } else {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
    }
  }
  
  
  @objc
  func mapTypeChanged(_ segControl: UISegmentedControl) {
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
  
  
  
  // MARK: - LOCATION
  func setupLocationManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
  }
  
  func determineCurrentLocation() {
    
    guard [.authorizedWhenInUse,
           .authorizedAlways].contains(locationManager.authorizationStatus)
    else {
      print("App does not have authorization to determine user location. Authorization status: \(locationManager.authorizationStatus)")
      return
    }
    mapView.showsUserLocation = true
  }
  
  
  func requestLocationPermission() {
    if locationManager.authorizationStatus == .notDetermined {
      locationManager.requestWhenInUseAuthorization()
    } else {
      determineCurrentLocation()
      zoomToUserLocation()

    }
  }
  
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if(status == .authorizedWhenInUse || status == .authorizedAlways)
    {
      mapView.showsUserLocation = true
      zoomToUserLocation()
    }
  }
  
  
  func zoomToUserLocation() {
    if let userLocation = locationManager.location?.coordinate {
      let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
      mapView.setRegion(viewRegion, animated: true)
      mapView.showsUserLocation = true
    }
  }
  
  
}

