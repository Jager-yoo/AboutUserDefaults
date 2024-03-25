//
//  ContentView.swift
//  AboutUserDefaults
//
//  Created by 유재호 on 3/24/24.
//

import SwiftUI

struct ContentView: View {

  @State private var num: Int = UserDefaults.standard.integer(forKey: "nothing")

  @StateObject private var userDefaultsClient = UserDefaultsClient.shared

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

      GroupBox("유저디폴트 전용 뷰모델") {
        Toggle("isToggleOn", isOn: $userDefaultsClient.isToggleOn)

        Toggle("isDarkMode", isOn: $userDefaultsClient.isDarkMode)
          .tint(.cyan)

        Toggle("isSomething", isOn: $userDefaultsClient.isSomething)
          .tint(.mint)
      }
      .labelsHidden()
    }
  }
}

#Preview {
  ContentView()
}
