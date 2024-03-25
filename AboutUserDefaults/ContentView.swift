//
//  ContentView.swift
//  AboutUserDefaults
//
//  Created by 유재호 on 3/24/24.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject private var userDefaultsClient: UserDefaultsClient

  @State private var shouldPresentOnboarding: Bool = false

  var body: some View {
    VStack {
      GroupBox {
        Text("\(userDefaultsClient.number)")
          .font(.largeTitle)
      }

      Button("Up!") {
        userDefaultsClient.number += 1
      }
      .buttonStyle(.bordered)

      GroupBox("다크 모드 설정") {
        Toggle("isDarkMode", isOn: $userDefaultsClient.isDarkMode)
          .labelsHidden()
          .tint(.cyan)
      }
    }
    .onAppear {
      if !userDefaultsClient.isOnboardingDone {
        shouldPresentOnboarding = true
      }
    }
    .sheet(isPresented: $shouldPresentOnboarding, onDismiss: { userDefaultsClient.isOnboardingDone = true }) {
      OnboardingView()
    }
  }
}

#Preview {
  ContentView()
}
