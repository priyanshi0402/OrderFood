//
//  OrderFoodApp.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 04/10/24.
//

import SwiftUI
import SwiftData

@main
struct OrderFoodApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            DishOrder.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        
        @AppStorage("firstName") var firstName: String = ""
        
        WindowGroup {
            if firstName.isEmpty {
                SplashView()
            } else {
                HomeView()
            }
        }
        .modelContainer(for: DishOrder.self)
    }
}
