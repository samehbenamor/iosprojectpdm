//
//  TrackApp.swift
//  Track
//
//  Created by Apple Esprit on 23/11/2023.
//

import SwiftUI

@main
struct TrackApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
