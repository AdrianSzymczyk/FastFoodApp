//
//  AccountView.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 14/06/2022.
//

import SwiftUI

struct Address{
    var street: String = ""
    var homeNumber: String = ""
    var flatNumber: String = ""
    var comments: String = ""
}

struct AccountView: View {
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Arial-BoldMT", size: 22)!]
    }
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var phoneNumber: String = ""
    @State var addres: Address = Address(street: "", homeNumber: "", flatNumber: "", comments: "")
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack{
                TextField("Podaj adres emial", text: $emailAddress)
                    .padding()
                    .background(Color("AccountColor"))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("Brown"), lineWidth: 2))
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                TextField("Podaj hasło", text: $password)
                    .padding()
                    .background(Color("AccountColor"))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("Brown"), lineWidth: 2))
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                Text("Co najmniej 8 znaków, max 64, musi zawierać duże litery, małe litery i cyfry")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 39.0)
                    .font(.system(size: 16))
                    .frame(height:40)
                TextField("Podaj numer telefonu", text: $phoneNumber)
                    .padding()
                    .background(Color("AccountColor"))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("Brown"), lineWidth: 2))
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                VStack{
                    Text("Adres")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .padding(.top, 10)
                    TextField("Ulica*", text: $addres.street)
                        .padding()
                        .background(Color("AddressColor"))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brown"), lineWidth: 2))
                        .padding(.horizontal, 40)
                    TextField("Numer domu*", text: $addres.homeNumber)
                        .padding()
                        .background(Color("AddressColor"))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brown"), lineWidth: 2))
                        .padding(.horizontal, 40)
                        .padding(.top, 10)
                    TextField("Numer mieszkania", text: $addres.flatNumber)
                        .padding()
                        .background(Color("AddressColor"))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brown"), lineWidth: 2))
                        .padding(.horizontal, 40)
                        .padding(.top, 10)
                    TextField("Informacje dodatkowe", text: $addres.comments)
                        .frame(height: 80)
                        .padding()
                        .background(Color("AddressColor"))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Brown"), lineWidth: 2))
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                }
                .background(Color("AccountColor"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding([.top, .leading, .trailing], 30.0)
                Button{
                    print("Sranie zyganie")
                } label: {
                    Text("Załóż konto")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding()
                        .frame(width: 300)
                        .background(Color("BrightGreenColor"))
                        .cornerRadius(30)
                        .font(.title2)
                        .padding(.top, 20)
                }
                Spacer()
            }
            .navigationBarTitle(Text("Utwórz konto"), displayMode: .inline)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
