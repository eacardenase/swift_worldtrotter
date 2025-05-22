//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Edwin Cardenas on 5/20/25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        
        control.backgroundColor = .systemBackground
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)
        
        return control
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        tabBarItem.title = "Map"
        tabBarItem.image = UIImage(systemName: "map")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        mapView = MKMapView()
        
        view = mapView
        
        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            segmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
    }
}

// MARK: - Actions

extension MapViewController {
    @objc func mapTypeChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: mapView.preferredConfiguration = MKStandardMapConfiguration()
        case 1: mapView.preferredConfiguration = MKHybridMapConfiguration()
        case 2: mapView.preferredConfiguration = MKImageryMapConfiguration()
        default: break
        }
    }
}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: userLocation.coordinate,
                                        latitudinalMeters: 2000,
                                        longitudinalMeters: 2000)
        
        mapView.setRegion(region, animated: true)
    }
}
