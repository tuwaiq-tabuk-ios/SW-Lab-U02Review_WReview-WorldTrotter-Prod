//
//  MapViewController.swift
//  WorldTrotter-MarzouqAlmukhlif_AbdulazizAlhwiti
//
//  Created by Marzouq Almukhlif on 24/04/1443 AH.
//

import UIKit
import MapKit

class MapViewControllerProgrammatically: UIViewController,CLLocationManagerDelegate {
  var mapView: MKMapView!
  let locationManager = CLLocationManager()

  
  override func loadView() {
    mapView = MKMapView()
    
    view = mapView

    let segmentedControl = UISegmentedControl(items: ["Standard".localize(), "Hybrid".localize(), "Satellite".localize()])
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    segmentedControl.layoutConstraintMap(constant: 0, toItem: view.safeAreaLayoutGuide,firistItme: true)
  
  
    
    segmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)
    
    // Create points of interest label
    let pointsOfInterestLabel = UILabel()
    pointsOfInterestLabel.text = "Points of Interest".localize()
    pointsOfInterestLabel .translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pointsOfInterestLabel)
    
    
    
    
    // Create points of interest UISwitch
    let pointsOfInterestSwitch = UISwitch()
    pointsOfInterestSwitch.isOn = true
    
    pointsOfInterestSwitch.addTarget(self,action: #selector(togglePointsOfInterest), for: .valueChanged)
    
    pointsOfInterestSwitch
    .translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(pointsOfInterestSwitch)
    pointsOfInterestLabel.layoutConstraintMap(constant: 8, toItem: segmentedControl)
    
    pointsOfInterestSwitch.layoutConstraintMap(constant: 8, toItem: pointsOfInterestLabel)

  
    
    pointsOfInterestSwitch.addTarget(self, action: #selector(togglePointsOfInterest), for: .valueChanged)
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("MapViewController loaded its view.")
    // Do any additional setup after loading the view.
    
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
