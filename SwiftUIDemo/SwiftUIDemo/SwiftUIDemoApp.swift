//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Birju Bhatt on 05/03/23.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
