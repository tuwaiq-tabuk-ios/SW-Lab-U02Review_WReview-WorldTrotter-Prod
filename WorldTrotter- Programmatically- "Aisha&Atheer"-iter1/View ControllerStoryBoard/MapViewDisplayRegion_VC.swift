//
//  MapViewDisplayRegion_VC.swift
//  WorldTrotter- Programmatically- "Aisha&Atheer"-iter1
//
//  Created by Atheer abdullah on 25/04/1443 AH.
//

import UIKit
import MapKit
import CoreLocation


class MapViewDisplayRegion_VC: UIViewController {
  
  
  var mapView : MKMapView!
  let locationManager = CLLocationManager()
  
  
  
  override func loadView() {
    mapView = MKMapView()
    
    let pointsOfInterestLabel = UILabel()
    pointsOfInterestLabel.translatesAutoresizingMaskIntoConstraints = false
    pointsOfInterestLabel.text = "Point of Interest"
    
    
    
    
    view = mapView
    
    let segmentedControl = UISegmentedControl ( items: ["Standerd" , "Hybird" , "Satellite"])
    
    segmentedControl.backgroundColor = .systemBackground
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    view.addSubview(pointsOfInterestLabel)
    
    pointsOfInterestLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
    pointsOfInterestLabel.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor , constant: 20).isActive = true
    
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Map View Controller loaded its View")
    mapView.delegate = self
    findMyLocation()
    
  }
}
  





extension MapViewDisplayRegion_VC: MKMapViewDelegate {

  func findMyLocation() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
  }
}
extension MapViewDisplayRegion_VC: CLLocationManagerDelegate {
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    let span = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
    mapView.setRegion(span, animated: true)
    print(#function)
  }
}

