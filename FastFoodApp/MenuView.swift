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
    @FetchRequest(sortDescriptors:  [NSSortDescriptor(keyPath: \Category.name, ascending: true)], animation: .default)
    private var categoriesD: FetchedResults<Category>

    
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack(alignment: .leading){
                ForEach(categoriesD, id: \.self){(category: Category) in
                    NavigationLink(
                        destination: BurgersView(categoryInfo: category),
                    label: {
                        VStack(alignment: .leading){
                            HStack(alignment: .center, spacing: 20){
                                Image(category.img ?? "menu_burger")
                                    .resizable()
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(20)
                                    .overlay(RoundedRectangle(cornerRadius: 30)
                                                .stroke(Color("Brown"), lineWidth: 2))
                                    .shadow(radius: 5)
                                Text(category.name!)
                                    .font(.title2)
                                    .foregroundColor(Color("Brown"))
                            }
                        }
                    })
                }
            }
            .navigationBarTitle(Text("Produkty"), displayMode: .inline)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
.previewInterfaceOrientation(.portrait)
    }
}
