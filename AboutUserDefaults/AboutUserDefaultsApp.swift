//
//  AboutUserDefaultsApp.swift
//  AboutUserDefaults
//
//  Created by 유재호 on 3/24/24.
//

import SwiftUI

@main
struct AboutUserDefaultsApp: App {

  @StateObject private var userDefaultsClient = UserDefaultsClient.shared

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(userDefaultsClient)
        .preferredColorScheme(userDefaultsClient.isDarkMode ? .dark : .light)
    }
  }
}
