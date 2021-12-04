//
//  MapViewController.swift
//  WorldTrotter-Review-ameera&hajer


import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    var mapView:MKMapView!
    var userLocation = CLLocationManager()
    
    override func loadView() {
        
        mapView = MKMapView()
        view = mapView
        
        
        //     MARK: - segmentedControl
        
        let segmentedControl
        = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let margins = view.layoutMarginsGuide
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo:margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        let pointsOfInterestLabel = UILabel()
        pointsOfInterestLabel.text = "Points Of Interest"
        pointsOfInterestLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointsOfInterestLabel)
        
        let pointsOfInterestSwitch = UISwitch()
        pointsOfInterestSwitch.addTarget(self, action: #selector(togglepointOfInterest(_:)), for: .valueChanged )
        pointsOfInterestSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointsOfInterestSwitch)
        
        
        let pointsOfInterestLabelTopConstraint = pointsOfInterestLabel.topAnchor.constraint(greaterThanOrEqualTo: segmentedControl.bottomAnchor,constant: 8)
        
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
        
        
        //MARK: - Activate constraints
        topConstraint.isActive = true
        pointsOfInterestLabelTopConstraint.isActive = true
        pointsOfInterestLabelLeadingConstraint.isActive = true
        pointsOfInterestSwitchLeadingConstraint.isActive = true
        pointsOfinterestSwitchTopConstraint.isActive = true
        pointsOfInterestVerticalAlignConstraint.isActive = true
        
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex{
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
    
    
    @objc func togglepointOfInterest(_ sender: UISwitch){
        if sender.isOn {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
        }else {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
        }
    }
    //    MARK: - View Controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
        
        userLocation.delegate = self
        mapView.delegate = self
        mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
        locationManagerDidChangeAuthorization(userLocation)
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if userLocation.authorizationStatus == .notDetermined{
            userLocation.requestWhenInUseAuthorization()
        } else {
            userLocation.requestAlwaysAuthorization()
        }
    }
    
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let span = MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        let theRegion = MKCoordinateRegion(center: userLocation.coordinate, span: span)
        mapView.setRegion(theRegion, animated: true)
    }
}
