//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Edwin Cardenas on 5/20/25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        tabBarItem.title = "Map"
        tabBarItem.image = UIImage(systemName: "map")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MKMapView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
