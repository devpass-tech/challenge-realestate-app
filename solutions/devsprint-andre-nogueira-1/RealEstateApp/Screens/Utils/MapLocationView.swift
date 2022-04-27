//
//  MapLocationView.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 24/04/22.
//

import MapKit

final class MapLocationView: MKMapView {
    
    private var coordinateRegion: MKCoordinateRegion = {
        let center = CLLocationCoordinate2D(latitude: 43.6109200, longitude: 3.8772300)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        return region
    }()
    
    private lazy var annotationPin: MKPointAnnotation = {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinateRegion.center
        
        return annotation
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.mapType = .standard
        self.isZoomEnabled = false
        self.setRegion(coordinateRegion, animated: true)
        self.addAnnotations([annotationPin])
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLocation(lat: Double, long: Double) {
        self.removeAnnotation(annotationPin)
        coordinateRegion.center.latitude = lat
        coordinateRegion.center.longitude = long
        annotationPin.coordinate = coordinateRegion.center
        self.setRegion(coordinateRegion, animated: true)
        self.addAnnotations([annotationPin])
    }
}

