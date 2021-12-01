# SW-Lab-U02Review_WReview-WorldTrotter-Prod
WorldTrotter application where the user can convert temperatures from degrees Fahrenheit to celsius and also show the location of the user in a map

## Topics
1. The **_view hierarchy_**
2. Initialize views programmatically
   - The view’s frame `CGRect`
   - `CGPoint` that contains the origin of the `CGRect`s
   - `CGSize` that contains the size of the `CGRect`
   - Customize the **_view hierarchy_** from the life cycle function `viewDidLoad()`
   - Add subviews to views
3. `UIWindow` as the superview of all views
4. Absolute frames versus Auto layout constraints
5. `CALayer` and `CAGradientLayer`
---
6. **_Tab Bar Controller_**
   - _**Transition relationship segues**_ between _Tab Bar Controllers_ and _view controllers_. 
   - _Tab Bar Controller_ as the _initial view controller_
---
7. Property `view` in `UIViewController`s as the root of the _view controller’s view hierarchy_
8. Introduction to **_Map Kit View_**
9. Associate interfaces with _view controllers classes_
10. _**Lazy loading**_ of _view controllers_
    - _View controllers_ **_life cycle_**
---
11. Set up _**constraints**_ and controls _**programmatically**_.
    - Explicit constraints 
      - `NSLayoutConstraint`
    - Fix _**Autoresize mask**_ inconsistencies with the property `translatesAutoresizingMaskIntoConstraints`
    - Creation of constraints wirh _**anchors**_ 
    - _**Layout Guides**_
      - `safeAreaLayoutGuide`
    - _**Margins**_
      - `layoutMarginsGuide`
    - `UISegmentedControl`
12. Control events with _**Target-Action**_ paradigm
    - Expose methods to the _**Objective-C runtime**_ with the `@objc` annotation 
13. Refactoring
    - Design patterns
     - Factory Method
    - Activate constraints with `NSLayoutConstraint.activate(_)`
    - Create an _**extension**_ of `UIColor` to reuse customized colours
    - Use of _**extension**_ files to make the extensions reusable on other projects
    - Create customized labels that inherit `UILabel`
---
14. _**Text Editing**_
    - `UITextField`
15. Keyboard attributes
    - `UITextInputTraits`
16. Responding to text field changes
    - `.editingChanged`
17. _**Dismissing the keyboard**_
    - `UITapGestureRecognizer`
18. Number Formatters
    - `NumberFormatter` 
19. _**Delegate**_ Design Pattern
    - Conforming to a Protocol
    - Using a delegate
    - Implement `UITextFieldDelegate`

## Description
1. WorldTrotter application where the user can convert temperatures from degrees Fahrenheit to celsius and also show the location of the user in a map. 
   - The layout of the two main screens are made both with Storyboard and  programmatically. 
   - The user navigate from one screen to another with a tab bar.
2. Challenge 1: _**Points of Interest**_
   - Add a `UILabel` and `UISwitch` to the `MapViewController` interface. 
   - The label should say “Points of Interest” and the switch should toggle the display of points of interest on the map.
   - You will want to add a _**target-action_** pair to the switch that updates the map’s `pointOfInterestFilter` property. 
3. Challenge 2: _**Rebuild the Conversion Interface**_ 
   - Currently, the `ConversionViewController` interface is being built in _Interface Builder_.
   - Delete the interface in the storyboard and re-create it programmatically inConversionViewController.swift. 
   - You will want to override `loadView()` just as you did for `MapViewController`.
4. Challenge 3: _**Disallow Alphabetic Characters**_ 
   - Currently, the user can enter alphabetic characters either by using a Bluetooth keyboard or by pasting copied text into the text field. Fix this issue 
5. Challenge 4: _**Displaying the User’s Region**_ 
   - Display and zoom in on the user’s location on the map. `MKMapView` has a mechanism for _**displaying a blue dot annotation on the map**_, but there is no built-in way to _**zoom in on that location**_. To get this to work, you will need to do a few things: 
   - Add a _**“Privacy – Location When In Use Usage Description” key**_ to your application’s _**Info.plist**_. This key is associated with a description that tells your users why you will be accessing their location information. 
   - Ask the user for permission to find their location. You will need to add a property to `MapViewController` for a `CLLocationManager` instance and call `requestWhenInUseAuthorization()` when the `MapViewController`’s view appears. This will present an alert to the user with the usage description requesting their permission to get their location. 
   - Use the user’s location to zoom in on their map region. To do this, assign the map’s `delegate` property. Look through the documentation for `MKMapViewDelegate` and find the appropriate callback to get informed when the user’s location has been updated.
   - Implement this method to set the region on the map, either directly or using `setRegion(_:animated:)`.

## Deadline 
Review _**Pair Programming**_ without deadline

## ScreenShot
![Simulator Screen Shot - iPhone 12 - 2021-12-01 at 16 27 58](https://user-images.githubusercontent.com/89598376/144242986-5a42f504-a8c8-4d07-bb4c-f16dd4866865.png)

![Simulator Screen Shot - iPhone 12 - 2021-12-01 at 16 27 50](https://user-images.githubusercontent.com/89598376/144243016-802c2e25-5a5b-4b3e-ae08-5dd1d8d0955b.png)

![Simulator Screen Shot - iPhone 12 - 2021-12-01 at 16 27 27](https://user-images.githubusercontent.com/89598376/144243049-fb8b6675-860c-42b2-96d4-b34893128733.png)

![Simulator Screen Shot - iPhone 12 - 2021-12-01 at 16 27 22](https://user-images.githubusercontent.com/89598376/144243072-a84bea03-76ef-4f77-8619-b416e1d44430.png)

