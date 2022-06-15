//
//  MainMenuView.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 14/06/2022.
//

import SwiftUI
import CoreData

struct MainMenuView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors:  [NSSortDescriptor(keyPath: \Category.name, ascending: true)], animation: .default)
    private var categories: FetchedResults<Category>

    
    var body: some View {
        NavigationView{
            ZStack{
                Color("BackgroundColor")
                    .edgesIgnoringSafeArea(.all)
                Circle()
                    .fill(Color("GreenColor"))
                    .frame(width: 450)
                    .offset(y:-400)
                VStack{
                    Image("restaurant-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300, alignment: .center)
                        .clipped()
                        .cornerRadius(30)
                        .offset(y:-60)
                        .opacity(0.95)
                    VStack(spacing: 10){
                        HStack(spacing: 20){
                            if(categories.count == 0){
                                NavigationLink(
                                    destination: MenuView(),
                                    label: {
                                    ZStack{
                                        Image("icon_menu")
                                            .resizable()
                                            .frame(width: 140, height: 140)
                                            .cornerRadius(20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color("Brown"), lineWidth: 2))
                                        Text("MENU")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.black)
                                            .multilineTextAlignment(.center)
                                            .offset(y:50)

                                    }}).simultaneousGesture(TapGesture().onEnded{
                                        addCategories()
                                        print(categories)
                                    })
                            }else{
                                NavigationLink(
                                    destination: MenuView(),
                                    label: {
                                    ZStack{
                                        Image("icon_menu")
                                            .resizable()
                                            .frame(width: 140, height: 140)
                                            .cornerRadius(20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color("Brown"), lineWidth: 2))
                                        Text("MENU")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.black)
                                            .multilineTextAlignment(.center)
                                            .offset(y:50)
                                            
                                    }})
                            }
                            NavigationLink(
                                destination: BasketView(),
                                label: {
                                ZStack{
                                    Image("icon_basket")
                                        .resizable()
                                        .frame(width: 140, height: 140)
                                        .cornerRadius(20)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color("Brown"), lineWidth: 2))
                                    Text("KOSZYK")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.center)
                                        .offset(y:50)
                                }})
                        }
                        HStack(spacing: 20){
                            NavigationLink(
                                destination: LocationView(),
                                label: {
                                ZStack{
                                    Image("icon_location")
                                        .resizable()
                                        .frame(width: 140, height: 140)
                                        .cornerRadius(20)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color("Brown"), lineWidth: 2))
                                    Text("LOKALIZACJA")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.center)
                                        .offset(y:50)
                                }})
                        }
                    }
                }
            }
        }
    }
    private func addCategories(){
        var newCategory = Category(context: viewContext)
        newCategory.name = "Burgery"
        newCategory.img = "menu_burger"
        try? viewContext.save()
        newCategory = Category(context: viewContext)
        newCategory.name = "Burrito"
        newCategory.img = "menu_burrito"
        try? viewContext.save()
        newCategory = Category(context: viewContext)
        newCategory.name = "Tacos"
        newCategory.img = "menu_taco"
        try? viewContext.save()
        newCategory = Category(context: viewContext)
        newCategory.name = "Hot-dogi"
        newCategory.img = "menu_hotdog"
        try? viewContext.save()
        newCategory = Category(context: viewContext)
        newCategory.name = "Kanapki"
        newCategory.img = "menu_sandwich"
        try? viewContext.save()
    }
}


struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
