//
//  MapView.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @Binding var countries: [CountriesResponse]
    @Binding var selectedCountry: CountriesResponse
    @Binding var selectedCountryHistoricalData: [Double]
    
    let response: [CountryHistoricalResponse]
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {

        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            parent.filterSelectedCountry(countryName: view.annotation!.title!!)
            mapView.setCenter(view.annotation!.coordinate, animated: true)
        }

    }
    
    func filterSelectedCountry(countryName: String) {
        DispatchQueue.global(qos: .background).async {
            self.selectedCountry = self.countries.filter { $0.country == countryName }.first!
            let he = self.response.filter {
                print($0.country)
                return $0.country == countryName
            }.first?.timeline.cases.map { Double($0.value) }
            print(he)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        if countries.count != uiView.annotations.count {
            uiView.removeAnnotations(uiView.annotations)
            
            var annotations = [MKAnnotation]()
            
            countries.forEach { (country) in
                let annotation = MKPointAnnotation()
                annotation.title = country.country
                annotation.coordinate = CLLocationCoordinate2D(latitude: country.countryInfo.lat, longitude: country.countryInfo.long)
                
                annotations.append(annotation)
            }
            
            uiView.addAnnotations(annotations)
        }
    }
    
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2012 Summer Olympics."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
}
