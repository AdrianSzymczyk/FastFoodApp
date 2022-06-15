//
//  LocationView.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 14/06/2022.
//

import MapKit
import SwiftUI

struct Point: Identifiable{
    let id = UUID()
    let name: String
    var coordinate: CLLocationCoordinate2D
}

struct LocationView: View {
    @State var place = Point(name: "Fast-Food Restaurant", coordinate: CLLocationCoordinate2D(latitude: 51.247715, longitude: 22.563769))
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.24779, longitude: 22.56328), span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009))
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack{
                Text("Tutaj nas znajdziesz")
                    .font(.title)
                    .fontWeight(.semibold)
                Map(coordinateRegion: $region, annotationItems: [place]){_ in
                    MapPin(coordinate: place.coordinate, tint: .green)
                }
                .gesture(TapGesture().onEnded({
                    _ in
                    region.span.latitudeDelta -= 0.002
                    region.span.longitudeDelta -= 0.002
                    if region.span.latitudeDelta < 0.0001 {
                        region.span.latitudeDelta = 0.009
                        region.span.longitudeDelta = 0.009
                    }
                }))
                .frame(width: 380, height: 500)
                .cornerRadius(10)
                .shadow(radius: 10)
                VStack (alignment: .leading, spacing: 4.0){
                    HStack{
                        Spacer()
                    }
                    Text("Fast-Food Restaurant")
                        .fontWeight(.black)
                        .padding([.top, .leading], 10)
                        .font(.system(size: 24))
                    Text("Krakowskie Przedmieście 15 Lublin")
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 10)
                        .font(.system(size: 16))
                }
                Spacer()
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
