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
  @State private var shouldPresentAd: Bool = false

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
      guard userDefaultsClient.isOnboardingDone else {
        shouldPresentOnboarding = true
        return
      }

      // 광고가 숨겨진 시간에서 30초도 지나지 않았다면
      guard Date.now.timeIntervalSince1970 < userDefaultsClient.adHiddenDate + 30 else {
        shouldPresentAd = true
        return
      }
    }
    .sheet(isPresented: $shouldPresentOnboarding, onDismiss: { userDefaultsClient.isOnboardingDone = true }) {
      OnboardingView()
    }
    .sheet(isPresented: $shouldPresentAd) {
      AdView()
    }
  }
}

#Preview {
  ContentView()
}
