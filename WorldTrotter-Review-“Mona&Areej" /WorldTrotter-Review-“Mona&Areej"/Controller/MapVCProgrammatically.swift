
import MapKit
import UIKit


class MapVCProgrammatically : UIViewController {
  
  
  var mapView: MKMapView!
  
  
  override func loadView() {
    
    mapView = MKMapView()
    view = mapView
    
    //Add SegmentedControl
    let segmentedControl = UISegmentedControl(items: ["Standerd", "Hybrid", "Satellite"])
    
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    segmentedControl.addTarget(
      self,
      action: #selector(mapTypeChanged(_:)), for: .valueChanged)
    
    
    //Add SegmentedControl Constraints
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo:
                                                                view.safeAreaLayoutGuide.topAnchor,constant: 8)
    
    let margins = view.layoutMarginsGuide
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo:
                                                                        margins.leadingAnchor)
    
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo:
                                                                          margins.trailingAnchor)
    
    //Add Label
    let pointOfInterestLabel = UILabel()
    pointOfInterestLabel.text = "Point of interst"
    pointOfInterestLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pointOfInterestLabel)
    
    
    //Add Switch
    let pointOfInterstSwitch = UISwitch()
    pointOfInterstSwitch.isOn = true
    pointOfInterstSwitch.addTarget(self, action: #selector(togglePointsOfInterest), for: .valueChanged)
    pointOfInterstSwitch.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pointOfInterstSwitch)
    
    
    //UILabel Constraints
    let pointsOfInterestLabelTopConstraint = pointOfInterestLabel.topAnchor.constraint(greaterThanOrEqualTo: segmentedControl.bottomAnchor, constant: 8)
    
    let pointsOfInterestLabelLeadingConstraint = pointOfInterestLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8)
    
    
    //UISwitch constraints
    let pointsOfinterestSwitchTopConstraint = pointOfInterstSwitch.topAnchor.constraint(greaterThanOrEqualTo: segmentedControl.bottomAnchor, constant: 8)
    let pointsOfInterestSwitchLeadingConstraint  = pointOfInterstSwitch.leadingAnchor.constraint(equalTo: pointOfInterestLabel.trailingAnchor, constant: 8)
    
  
    //Active Constraints
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    
    pointsOfInterestLabelTopConstraint.isActive = true
    pointsOfInterestLabelLeadingConstraint.isActive = true
    pointsOfInterestSwitchLeadingConstraint.isActive = true
    pointsOfinterestSwitchTopConstraint.isActive = true
    
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Map View Controller loaded its view. ")
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
  
}
