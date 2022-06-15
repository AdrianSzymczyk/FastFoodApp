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
//    @FetchRequest(sortDescriptors: [], animation: .default) var products: FetchedResults<Product>
//    @FetchRequest(sortDescriptors: [], animation: .default) var baskets: FetchedResults<Basket>

    
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack{
//                Text("Koszyk")
//                List {
//                    ForEach(baskets, id: \.self) { baskets in
//                            ForEach(baskets.productArray, id: \.self) { product in
//                                VStack(alignment: .leading){
//                                    Text(product.name!)
//                                    Text("\(product.price, specifier: "%.2f")zł")
//
//                                }
//                            }
//                            .onDelete(perform: self.deleteProduct)
//                    }
//                    .listRowBackground(Color("BrightGreenColor"))
//                }
//                .navigationBarTitle(Text("Koszyk"))
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
