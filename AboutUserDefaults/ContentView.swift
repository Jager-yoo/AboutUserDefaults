//
//  ContentView.swift
//  AboutUserDefaults
//
//  Created by 유재호 on 3/24/24.
//

import SwiftUI

struct ContentView: View {

  @State private var num: Int = UserDefaults.standard.integer(forKey: "nothing")

  @EnvironmentObject private var userDefaultsClient: UserDefaultsClient

  var body: some View {
    VStack {
      GroupBox {
        Text("\(num)")
          .font(.largeTitle)
      }

      Button("Up!") {
        num += 1
        UserDefaults.standard.set(num, forKey: "nothing")
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
