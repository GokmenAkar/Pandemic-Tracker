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
    @Binding var selectedCountryCases: [Double]
    @Binding var selectedCountryDeaths: [Double]
    @Binding var selectedCountryRecovered: [Double]

    @Binding var countryHistoricalData: [CountryHistoricalResponse]
    
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
            
            let countryTimeline = self.countryHistoricalData
                .filter { $0.country == countryName }
                .first!.timeline
                
            let mappedCases     = countryTimeline.cases.map { Double($0.value) }
            let mappedDeaths    = countryTimeline.deaths.map { Double($0.value) }
            let mappedRecovered = countryTimeline.recovered.map { Double($0.value) }
            
            self.selectedCountryCases     = Array(mappedCases[mappedCases.count - 30..<mappedCases.count-1])
            self.selectedCountryDeaths    = Array(mappedDeaths[mappedDeaths.count - 30..<mappedDeaths.count-1])
            self.selectedCountryRecovered = Array(mappedRecovered[mappedRecovered.count - 30..<mappedRecovered.count-1])
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
