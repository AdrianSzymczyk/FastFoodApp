//
//  SummaryView.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 16/06/2022.
//

import SwiftUI

struct SummaryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors:  [NSSortDescriptor(keyPath: \Address.street, ascending: true)], animation: .default)
    private var baskets: FetchedResults<Address>
    
    
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack(alignment: .leading){
                ForEach(baskets){basket in
                    Section("Address: \(basket.street!) \(basket.houseNumber!)/\(basket.flatNumber!), \(basket.city!) "){
                        ForEach(basket.productArray){product in
                            VStack{
                                HStack{
                                    Image(product.img ?? "burger_chicken")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .cornerRadius(50)
                                    VStack(alignment: .leading){
                                        Text(product.name!)
                                            .font(.system(size: 18))
                                            .fontWeight(.medium)
                                        Text("\(String(product.price))zł ")
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
