//
//  MapViewController.swift
//  WorldTrotter-Review"Ressam-Reema-Hajar"
//
//  Created by Ressam Al-Thebailah on 24/04/1443 AH.
//

import UIKit
import MapKit

class MapViewComtroller: UIViewController, MKMapViewDelegate {
  
  var mapView : MKMapView!
  var pointOfIntrestLabel: UILabel!
  var switchMap: UISwitch!
  
  let locationManager = CLLocationManager()
  
  override func loadView() {
    mapView = MKMapView()
    
    view = mapView
    
//    let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    let standardString = NSLocalizedString("Standard", comment:"Standard Map View" )
    let hybridString = NSLocalizedString("Hybrid", comment:"Hybrid Map View" )
    let satelliteString = NSLocalizedString("Satellite", comment:"Satellite Map View" )
    let segmentedControl = UISegmentedControl(items: [standardString,hybridString,satelliteString])
    
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(self
                               ,action: #selector(mapTypeChanged(_:))
                               , for:.valueChanged)
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
    topConstraint.isActive = true
    
    let margins = view.layoutMarginsGuide
    
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo:margins.leadingAnchor)
    leadingConstraint.isActive = true
    
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    trailingConstraint.isActive = true
    
    
    //MARK:- label constrant:
    pointOfIntrestLabel = UILabel()
    pointOfIntrestLabel.text = "Point of Interest"
    pointOfIntrestLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pointOfIntrestLabel)
    
    let poiTopConstraint = pointOfIntrestLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10)
    poiTopConstraint.isActive = true
    
    let poiLeadingConstraint =  pointOfIntrestLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    poiLeadingConstraint.isActive = true
    
  
    //MARK:- switch constrant:
    switchMap = UISwitch()
    switchMap.addTarget(self, action: #selector(togglePointsOfInterest(_ :)), for: .valueChanged)
    switchMap.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(switchMap)
    
    let switchCenterConstraint = switchMap.centerYAnchor.constraint(equalTo: pointOfIntrestLabel.centerYAnchor)
    switchCenterConstraint.isActive = true
    
    let switchLeadingConstraint = switchMap.leadingAnchor.constraint(equalTo: pointOfIntrestLabel.trailingAnchor, constant: 10)
    switchLeadingConstraint.isActive = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("MapViewComtroller loaded its View.")
    
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    
    //يتعع النقطه
    mapView.delegate = self
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
    
  }
  
  
  @objc func mapTypeChanged(_ segControl : UISegmentedControl){
    switch segControl.selectedSegmentIndex {
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
  
  
  @objc func togglePointsOfInterest(_ swicher : UISwitch){
    if swicher.isOn {
      mapView.pointOfInterestFilter = .includingAll
    }else{
      mapView.pointOfInterestFilter = .excludingAll
    }
  }
  
  func setupLocationManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
  }
 
  
  func determinedCurrentLocation () {
    guard [.authorizedWhenInUse, .authorizedAlways] .contains(locationManager.authorizationStatus) else{
      print("App does not have authorization to determine user location. Authorization status: \(locationManager.authorizationStatus)")
      return
    }
    
    mapView.showsUserLocation = true
  }
  
  
  
  
  func requestLocationPermission() {
    if locationManager.authorizationStatus == .notDetermined {
      locationManager.requestWhenInUseAuthorization()
    } else {
      determinedCurrentLocation()
    }
  }
  //zoom
  func mapView(_ mapView: MKMapView,
         didUpdate userLocation: MKUserLocation) {
    
    let span = MKCoordinateSpan(latitudeDelta:0.08, longitudeDelta: 0.08)
    let theRegion = MKCoordinateRegion(center:userLocation.coordinate, span: span)
    mapView.setRegion(theRegion, animated: true)
  }
}


extension MapViewComtroller: CLLocationManagerDelegate {
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    determinedCurrentLocation()
  }
}
