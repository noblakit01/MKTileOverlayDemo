//
//  ViewController.swift
//  MKTileOverlayDemo
//
//  Created by Minh Luan Tran on 4/24/18.
//  Copyright © 2018 Minh Luan Tran. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var tileRenderer: MKTileOverlayRenderer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpTileRender()
        
        mapView.delegate = self
    }

    func setUpTileRender() {
        let template = "https://mapnik.xinkciti.com/all/2d/{z}/{x}/{y}.png"
        let overlay = MKTileOverlay(urlTemplate: template)
        overlay.canReplaceMapContent = true
        mapView.add(overlay, level: .aboveLabels)
        
        tileRenderer = MKTileOverlayRenderer(tileOverlay: overlay)
    }
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        return tileRenderer
    }
    
}


