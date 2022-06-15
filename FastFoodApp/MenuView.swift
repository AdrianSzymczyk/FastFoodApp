//
//  MenuView.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 14/06/2022.
//

import SwiftUI

struct Categoryy{
    var name: String
    var CategoryyImg: String
}

struct MenuView: View {
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Arial-BoldMT", size: 22)!]
    }
    
    @Environment(\.managedObjectContext) private var viewContext

//    @FetchRequest(sortDescriptors:  [NSSortDescriptor(keyPath: \Product.name, ascending: true)], animation: .default)
//    private var products: FetchedResults<Product>
    
    @State var categories :[Categoryy] =
    [Categoryy(name: "Burgery", CategoryyImg: "menu_burger"),
    Categoryy(name: "Burrito", CategoryyImg: "menu_burrito"),
    Categoryy(name: "Tacos", CategoryyImg: "menu_taco"),
    Categoryy(name: "Hot-dogi", CategoryyImg: "menu_hotdog"),
    Categoryy(name: "Kanapki", CategoryyImg: "menu_sandwich")
    ]
    @State var columnCount: Int = 2
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea(.all)
            ScrollView(.vertical){
                let count = categories.count
                let rowCount = (Double(count) / Double(columnCount)).rounded(.up)
                ForEach(0..<Int(rowCount)){row in
                    Spacer(minLength: 60)
                    HStack(spacing: 20){
                        ForEach(0..<columnCount){ column in
                            let index = row * columnCount + column
                            if index < count {
                                NavigationLink(
                                    destination: BurgersView(),
                                label: {
                                    VStack{
                                        Image(categories[index].CategoryyImg)
                                            .resizable()
                                            .frame(width: 180, height: 230)
                                            .cornerRadius(30)
                                            .overlay(RoundedRectangle(cornerRadius: 30)
                                                        .stroke(Color("Brown"), lineWidth: 2))
                                            .shadow(radius: 10)
                                        Text(categories[index].name)
                                            .font(.title2)
                                            .foregroundColor(Color("Brown"))
                                    }
                                })
//                                    .simultaneousGesture(TapGesture().onEnded{addProducts()})
                            } else {
                                Spacer().frame(width: 180.0)
                            }
                        }
                    }
                }
                
            }
            .navigationBarTitle(Text("Produkty"), displayMode: .inline)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
