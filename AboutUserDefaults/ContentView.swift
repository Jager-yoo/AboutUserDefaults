//
//  ContentView.swift
//  AboutUserDefaults
//
//  Created by 유재호 on 3/24/24.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject private var userDefaultsClient: UserDefaultsClient

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
  }
}

#Preview {
  ContentView()
}
