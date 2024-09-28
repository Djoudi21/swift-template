//
//  SwiftTemplateApp.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 28/09/2024.
//

import SwiftUI

@main
struct SwiftTemplateApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
