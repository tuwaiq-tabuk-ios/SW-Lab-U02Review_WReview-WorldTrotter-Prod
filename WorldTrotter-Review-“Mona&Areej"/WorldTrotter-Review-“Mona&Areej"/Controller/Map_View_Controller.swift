
import UIKit
import MapKit


class MapViewController : UIViewController , MKMapViewDelegate {
  
  
  var mapView: MKMapView!
  let locationManager = CLLocationManager()
  
  override func loadView() {
    
    mapView = MKMapView()
    view = mapView
    
    let segmentedControl = UISegmentedControl(items: ["Standerd", "Hybrid", "Satellite"])
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(
      self,
      action: #selector(mapTypeChanged(_:)), for: .valueChanged)
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo:
                                                                view.safeAreaLayoutGuide.topAnchor,constant: 8)
    
    let margins = view.layoutMarginsGuide
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo:
                                                                        margins.leadingAnchor)
    
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo:
                                                                          margins.trailingAnchor)
    
    
    let pointOfInterestLabel = UILabel()
    pointOfInterestLabel.text = "Point of interst"
    pointOfInterestLabel.translatesAutoresizingMaskIntoConstraints = false
    
    
    view.addSubview(pointOfInterestLabel)
    
    let pointOfInterstSwitch = UISwitch()
    pointOfInterstSwitch.isOn = true
    pointOfInterstSwitch.translatesAutoresizingMaskIntoConstraints = false
    
    pointOfInterstSwitch.addTarget(self, action: #selector(togglePointsOfInterest),
                                   for: .valueChanged)
    
    view.addSubview(pointOfInterstSwitch)
    
    
    //UILabel Constraints
    let pointsOfInterestLabelTopConstraint = pointOfInterestLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 15)
    let pointsOfInterestLabelLeadingConstraint = pointOfInterestLabel.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
    
    
    //UISwitch constraints
    let pointsOfinterestSwitchTopConstraint = pointOfInterstSwitch.centerYAnchor.constraint(equalTo: pointOfInterestLabel.centerYAnchor)
    let pointsOfInterestSwitchLeadingConstraint  = pointOfInterstSwitch.leadingAnchor.constraint(equalTo: pointOfInterestLabel.trailingAnchor, constant: 10)
    
    let pointsOfInterestVerticalAlignConstraint = pointOfInterestLabel
      .centerYAnchor.constraint(equalTo: pointOfInterstSwitch.centerYAnchor)
    
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
    print("Map View Controller loaded its view. ")
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    mapView.delegate = self
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
  }
  
  
  @objc func mapTypeChanged(_ segControl: UISegmentedControl){
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
  
  
  @objc func togglePointsOfInterest(_ sender : UISwitch){
    if sender.isOn{
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
    } else{
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
    }
  }
  
  
  func setupLocationManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
  }
  
  func determineCurrentLocation() {
    
    guard [.authorizedWhenInUse,
           .authorizedAlways].contains(locationManager.authorizationStatus)
    else {
      print( "App does not have authorization to determine user location.Authorization status:\(locationManager.authorizationStatus)" )
      return
    }
    
    mapView.showsUserLocation = true
  }
  
  
  func requestLocationPermission() {
    if locationManager.authorizationStatus == .notDetermined {
      
      locationManager.requestWhenInUseAuthorization()
      
    } else {
      determineCurrentLocation()
    }
  }
  
  
  func mapView(_ mapView: MKMapView,
               didUpdate userLocation: MKUserLocation) {
    let span = MKCoordinateSpan(latitudeDelta: 0.08,
                                  longitudeDelta: 0.08)
    let theregion = MKCoordinateRegion(center: userLocation.coordinate,
                                       span: span)
    mapView.setRegion(theregion, animated: true)
    
    
    
    
    }
}


extension MapViewController: CLLocationManagerDelegate {
  func locationManagerDidChangeAuthorization(_ manager:
                                             CLLocationManager) {
    determineCurrentLocation()
  }
  
}
