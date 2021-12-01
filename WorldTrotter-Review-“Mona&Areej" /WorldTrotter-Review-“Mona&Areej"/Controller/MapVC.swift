//
//  MapProgrammaticlly.swift
//  WorldTrotter-Review-“Mona&Areej"
//
//  Created by A A on 01/12/2021.
//

import UIKit
import MapKit

class MapVC : UIViewController, CLLocationManagerDelegate {
  
  @IBOutlet weak var mapView: MKMapView!
  
  let locationManager = CLLocationManager()
  
  let manger = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("MapViewController loaded its view.")
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    manger.desiredAccuracy = kCLLocationAccuracyBest
    manger.delegate = self
    manger.requestWhenInUseAuthorization()
    manger.startUpdatingLocation()
  }
  
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.first {
      manger.stopUpdatingLocation()
      render(location)
    }
  }
  
  
  func render(_ location: CLLocation){
    
    let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    let region = MKCoordinateRegion(center: coordinate, span: span)
    
    mapView.setRegion(region, animated: true)
    
  }
}



