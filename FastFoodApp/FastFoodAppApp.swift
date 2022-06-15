//
//  FastFoodAppApp.swift
//  FastFoodApp
//
//  Created by Adrian Szymczyk on 14/06/2022.
//

import SwiftUI

@main
struct FastFoodAppApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            MainMenuView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
