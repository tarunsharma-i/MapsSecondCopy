//
//  SecondViewController.swift
//  Maps
//
//  Created by Tarun Sharma on 29/06/22.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    var locationManager = CLLocationManager()
    
    var newCordinate = CLLocationCoordinate2D()
    
    var currentLocation = CLLocation()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
        
    func getDirections() {
        let request                         = MKDirections.Request()
        request.source                      = MKMapItem(placemark: MKPlacemark(coordinate: currentLocation.coordinate))
        request.destination                 = MKMapItem(placemark: MKPlacemark(coordinate: newCordinate))
        request.transportType               = .automobile
        request.requestsAlternateRoutes     = true
        
        self.mapView.removeOverlays(mapView.overlays)
    
        let directions = MKDirections(request: request)
        directions.calculate { (response, error) in
            guard let response = response else {return}
            let route = response.routes[0]
            DispatchQueue.main.async {
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
