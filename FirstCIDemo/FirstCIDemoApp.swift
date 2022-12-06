//
//  FirstCIDemoApp.swift
//  FirstCIDemo
//
//  Created by Anand Upadhyay on 05/12/22.
//

import SwiftUI

@main
struct FirstCIDemoApp: App {
    var user = User()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user)
        }
    }
}
