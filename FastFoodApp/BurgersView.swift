//
//  BurgersView.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 14/06/2022.
//

import SwiftUI

struct Burger{
    var name: String
    var description: String
    var burgerImg: String
    var price: Double
}

struct BurgersView: View {
    @ObservedObject var categoryInfo: Category
    @State var burgers: [Burger] =
    [Burger(name: "Burger z kurczakiem", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ", burgerImg: "burger_chicken", price: 26.50),
     Burger(name: "Burger z falafelem", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", burgerImg: "burger_falafel", price: 27.99),
     Burger(name: "Burger z grzybami", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", burgerImg: "burger_mushroom", price: 32.00),
     Burger(name: "Burger rybny", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", burgerImg: "burger_fish", price: 25.99)]
    @State private var selectedProduct: Burger = Burger(name: "", description: "", burgerImg: "", price: 0)
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors:  [NSSortDescriptor(keyPath: \Category.name, ascending: true)], animation: .default)
    private var categories: FetchedResults<Category>

    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack{
                List{
                    ForEach($burgers, id: \.name){$burger in
                        NavigationLink(destination: BurgerView(categoryInfo: categoryInfo, burgerInfo: $burger))
                        {
                            HStack{
                                Image(burger.burgerImg)
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(50)
                                VStack(alignment: .leading){
                                    Text(burger.name)
                                        .font(.system(size: 18))
                                        .fontWeight(.medium)
                                    Text("\(String(burger.price))zł ")
                                }
                            }
                            
                        }
                        .frame(height:80)
                        .swipeActions(edge: .leading, allowsFullSwipe: false){
                            Button {
                                selectedProduct = burger
                                addToBasket()
                                print("Dodawanie do koszyka")
                            } label: {
                                Label("Dodaj", systemImage: "plus.circle")
                            }
                            .tint(.green)
                        }
                    }
                    .listRowBackground(Color("AddressColor"))
                    .navigationBarTitle(Text("Burgery"))
                }
            }
        }
    }
    private func addToBasket() {
        let newProduct = Product(context: viewContext)
        newProduct.name = selectedProduct.name
        newProduct.descriptionn = selectedProduct.description
        newProduct.img = selectedProduct.burgerImg
        newProduct.price = selectedProduct.price
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

struct BurgersView_Previews: PreviewProvider {
    static var previews: some View {
        BurgersView(categoryInfo: Category())
    }
}
