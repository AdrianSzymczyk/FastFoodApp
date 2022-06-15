//
//  BasketView.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 14/06/2022.
//

import SwiftUI

struct BasketView: View {
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Arial-BoldMT", size: 22)!]
        UITableView.appearance().backgroundColor = UIColor(Color("BackgroundColor"))
    }
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors:  [NSSortDescriptor(keyPath: \Product.name, ascending: true)], animation: .default)
    private var products: FetchedResults<Product>
    @FetchRequest(sortDescriptors:  [NSSortDescriptor(keyPath: \Category.name, ascending: true)], animation: .default)
    private var categories: FetchedResults<Category>

    
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack{
                List {
                    ForEach(categories, id: \.self) { category in
                        Section(category.name!){
                            ForEach(category.productArray, id: \.self) { product in
                                VStack(alignment: .leading){
                                    Text(product.name!)
                                    Text("\(product.price, specifier: "%.2f")zł")

                                }
                            }
//                            .onDelete(perform: self.deleteProduct)

                        }
                    }
                    .listRowBackground(Color("BrightGreenColor"))
                }
                .navigationBarTitle(Text("Koszyk"))
                NavigationLink(
                    destination: AddressView(),
                    label: {
                    ZStack{
                        Text("Wprowadź adres")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 180, height: 70)
                            .background(Color("Brown"))
                            .cornerRadius(20)
                    }})
            }
        }
    }
    
//    private func deleteProduct(offsets: IndexSet) { withAnimation {
//        offsets.map { products[$0] }.forEach(viewContext.delete)
//        do {
//            try viewContext.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//        }
//    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
