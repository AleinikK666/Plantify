//
//  MapView.swift
//  plantify
//
//  Created by Екатерина Алейник on 18.05.25.
//

import UIKit
import MapKit



class MapViewController : UIViewController {
    @IBOutlet weak var confirmButton: UIButton!
    var locationManager = CLLocationManager()

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupManager()
        checkAutorization()
        // originalTopMargin = topMarginConstraint.constant
        confirmButton.setTitle(NSLocalizedString("Confirm", comment: ""), for: .normal)
    
        
    }
   
    
    @IBAction func confirmCity(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "RegistrationView")
        
                    secondVC.modalPresentationStyle = .fullScreen
                    secondVC.modalTransitionStyle = .crossDissolve
                    
                    present(secondVC, animated: true, completion: nil)
    }
    func setupManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkAutorization(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            map.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .denied:
            break
        case .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        @unknown default:
            break
        }
    }
   
    @IBOutlet weak var cityField: UITextField!
}

extension MapViewController : CLLocationManagerDelegate{
    func locationManager(_ manager : CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let location = locations.last?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            map.setRegion(region, animated: true)
            let latitude: CLLocationDegrees = (locationManager.location?.coordinate.latitude)!
                        let longitude: CLLocationDegrees = (locationManager.location?.coordinate.longitude)!
                        let location = CLLocation(latitude: latitude, longitude: longitude) //changed!!!
                        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                            if error != nil {
                                return
                            }else if let country = placemarks?.first?.country,
                                let city = placemarks?.first?.locality {
                                print(country)
                                print(city)
                                self.cityField.text = city
                                citySave = city
                            }
                            else {
                            }
                        })
           // cityField.text = location.locality
        }
    }
    func locationManager(_manager : CLLocationManager, didChangeAutorization status: CLAuthorizationStatus){
        checkAutorization()
    }
}

