//
//  DishDiveApp.swift
//  DishDive
//
//  Created by David Nguyen on 4/10/24.
//

import SwiftUI
import Firebase

@main
struct DishDiveApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

