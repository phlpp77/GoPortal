//
//  MapView.swift
//  GoPortal
//
//  Created by Philipp Hemkemeyer on 4/8/23.
//

import MapKit
import SwiftUI

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}

struct MapView: View {
    
    @Binding var score: Int
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.7771785, longitude: -84.3963289), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    var annotationItems: [MyAnnotationItem] = [
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 33.7771785, longitude: -84.3963289)),
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 33.7711185, longitude: -84.3923589)),
    ]
    
    
    var body: some View {
        
        @State var contentActive = false
        
        NavigationStack {
            NavigationLink(destination: ContentView(score: $score).foregroundColor(.black), isActive: $contentActive) {
                
            
            
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: annotationItems, annotationContent: { location in
                MapAnnotation(coordinate: location.coordinate) {
//                    Image(systemName: "pin.circle.fill")
                    Text("+5")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("AccentColor"))
                        .background(Color.white)
                        .cornerRadius(38)
                        .frame(width: 38, height: 38)
                        .overlay(
                                Circle()
                                    .stroke(Color("AccentColor"), lineWidth: 2)
                                    

                            )
                                                .onTapGesture(count: 1, perform: {
                            contentActive.toggle()
                            
                        })
                }
            })
            }
            .navigationTitle("Explore the Portals")
            .accentColor(.black)
        }
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
