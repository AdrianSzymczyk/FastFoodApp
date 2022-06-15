//
//  BurgerView.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 14/06/2022.
//

import SwiftUI
import CoreData

struct BurgerView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @ObservedObject var categoryInfo: Category
    @Binding var burgerInfo: Burger
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack{
                Text(burgerInfo.name)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                Image(burgerInfo.burgerImg)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("Brown"), lineWidth: 2))
                    .shadow(radius: 10)
                Text(burgerInfo.description)
                    .padding(.horizontal, 30.0)
                    .padding(.top)
                Button{
                    print("Burger dodany do koszyka")
                    addToBasket()
                } label: {
                    Text("Dodaj do koszyka")
                        .padding(20)
                        .background(Color("GreenColor"))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .shadow(radius: 10)
                        .padding(.top, 50)
                }
                Spacer()
                
            }
        }
    }
    private func addToBasket() {
        let newProduct = Product(context: viewContext)
        newProduct.name = burgerInfo.name
        newProduct.descriptionn = burgerInfo.description
        newProduct.img = burgerInfo.burgerImg
        newProduct.price = burgerInfo.price
        newProduct.category = categoryInfo
        do {
            try viewContext.save()
            print("Product added")
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct BurgerView_Previews: PreviewProvider {
    static var previews: some View {
        BurgerView(categoryInfo: Category(), burgerInfo: .constant(Burger(name: "", description: "", burgerImg: "", price: 0)))}
}
