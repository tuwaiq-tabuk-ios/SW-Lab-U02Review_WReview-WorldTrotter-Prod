//
//  MapViewEX.swift
//  WorldTrotter-Ahmed_alqhtani-Mohammed_alatwi
//
//  Created by محمد العطوي on 26/04/1443 AH.
//

import UIKit
import MapKit

extension MapViewController : MKMapViewDelegate {
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    let SaudiArabia = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let theRegion = MKCoordinateRegion(center: userLocation.coordinate, span: SaudiArabia)
    mapView.setRegion(theRegion, animated: true)
  }
}
