//
//  ViewController.swift
//  MapView
//
//  Created by 나윤서 on 2021/02/05.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocatioInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    let defaultLocation = CLLocation(latitude: 100, longitude: 40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocatioInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    func goLocation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let planeLocation = CLLocationCoordinate2DMake(latitudeValue, longtitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let planeRegion = MKCoordinateRegion(center: planeLocation, span: spanValue)
        let returnCoordinate = CLLocationCoordinate2D(latitude: latitudeValue, longitude: longtitudeValue)
        
        myMap.setRegion(planeRegion, animated: true)
        
        return returnCoordinate
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {        // 위치 업데이트 시 지도에 나타내기 위한 함수Z
        
        let planeLocation = locations.last ?? defaultLocation
        _ = goLocation(latitudeValue: planeLocation.coordinate.latitude, longtitudeValue: planeLocation.coordinate.longitude, delta: 0.01)
        // delta 작을 수록 확대
        CLGeocoder().reverseGeocodeLocation(planeLocation) {(placeMarks, error) -> Void in
            let pm = placeMarks!.first
            let country = pm!.country
            var address: String = country!
            
            if let locality = pm!.locality {
                address = address + " " + locality
            }
            if let street = pm!.thoroughfare {
                address = address + " " + street
            }
            
            self.lblLocatioInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        }
        locationManager.stopUpdatingLocation()
    }
    func setAnnotation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtitudeValue: longtitudeValue, delta: span)
        
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // 현재 위치
            locationManager.startUpdatingLocation()
            
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.293900, longtitudeValue: 126.975443, delta: 0.01, title: "선택한 위치", subtitle: "성균관대 자과캠")
            
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitudeValue: 37.394708, longtitudeValue: 127.110634, delta: 0.01, title: "선택한 위치", subtitle: "분당 판교역")
        }
    }
    

}

