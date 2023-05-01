//
//  AddressView.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 14/06/2022.
//

import SwiftUI
import CoreData

//struct AddressS{
//    var street: String = ""
//    var homeNumber: String = ""
//    var flatNumber: String = ""
//    var city: String = ""
//}

struct AddressView: View {
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Arial-BoldMT", size: 22)!]
    }
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors:  [NSSortDescriptor(keyPath: \Address.street, ascending: true)], animation: .default)
    private var addr: FetchedResults<Address>
    @FetchRequest(sortDescriptors:  [NSSortDescriptor(keyPath: \Product.name, ascending: true)], animation: .default)
    private var products: FetchedResults<Product>
    @FetchRequest(sortDescriptors:  [NSSortDescriptor(keyPath: \Category.name, ascending: true)], animation: .default)
    private var categories: FetchedResults<Category>
    
    @State var street: String = ""
    @State var houseNumber: String = ""
    @State var flatNumber: String = ""
    @State var city: String = ""
    @State var phoneNumber: String = ""
    //validation/error
    @State var error1: Bool = false
    @State var warning: String = ""
    @State var correctData: Bool = false
    
    
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack{
                Spacer()
                VStack{
                    Text("Adres")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .padding(.top, 10)
                    TextField("Ulica*", text: $street)
                        .padding()
                        .background(Color("AddressColor"))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brown"), lineWidth: 2))
                        .padding(.horizontal, 40)
                    TextField("Numer domu*", text: $houseNumber)
                        .padding()
                        .background(Color("AddressColor"))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brown"), lineWidth: 2))
                        .padding(.horizontal, 40)
                        .padding(.top, 10)
                    TextField("Numer mieszkania", text: $flatNumber)
                        .padding()
                        .background(Color("AddressColor"))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brown"), lineWidth: 2))
                        .padding(.horizontal, 40)
                        .padding(.top, 10)
                    TextField("Miasto*", text: $city)
                        .padding()
                        .background(Color("AddressColor"))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brown"), lineWidth: 2))
                        .padding(.horizontal, 40)
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                }
                .background(Color("AccountColor"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding([.top, .leading, .trailing], 30.0)
                TextField("Podaj numer telefonu", text: $phoneNumber)
                    .padding()
                    .background(Color("AccountColor"))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("Brown"), lineWidth: 2))
                    .padding(.horizontal, 70)
                    .padding(.vertical, 20)
                if(!correctData){
                    Button{
                        error1 = checkInput(street: street, houseNumber: houseNumber, flatNumber: flatNumber, city: city, phoneNumber: phoneNumber)
                        print(error1)
                        if(error1){
                            warning = "Błędne dane!!"
                        }else{
                            warning = ""
                            correctData = true
                            addAddress()
                            print(addr)

                        }
                        print("Data: \(street) \(houseNumber)/\(flatNumber), \(city)")
                        print("Phone number: \(phoneNumber)")
                        print("Warining: \(warning)")
                    } label:{
                        Text("Sprawdź dane")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 180, height: 70)
                            .background(Color("Brown"))
                            .cornerRadius(20)
                    }
                }else{
                    NavigationLink(
                        destination: SummaryView(),
                        label: {
                        ZStack{
                            Text("Podsumowanie")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(width: 180, height: 70)
                                .background(Color("Brown"))
                                .cornerRadius(20)
                        }})

                }
                Text(warning)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.red)
                    .padding()
                    .frame(width: 300)
                    .cornerRadius(30)
                    .font(.title)
                    .padding(.top, 20)
                Spacer()
            }
            .navigationBarTitle(Text("Adres dostawy"), displayMode: .inline)
        }
    }
    public func checkInput(street: String, houseNumber: String, flatNumber: String, city: String, phoneNumber: String) -> Bool{
        if(street.isEmpty || houseNumber.isEmpty || Int(flatNumber) == nil || city.isEmpty || phoneNumber.isEmpty){
            return true
        }else{
            return false
        }
    }
    private func addAddress() {
        let newOrder = Address(context: viewContext)
        newOrder.street = street
        newOrder.houseNumber = houseNumber
        newOrder.flatNumber = flatNumber
        newOrder.city = city
        newOrder.phoneNumber = phoneNumber
        for product in products{
            newOrder.addToBasket(product)
        }
        
        do {
            try viewContext.save()
            print("Order completed!")
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView()
    }
}
