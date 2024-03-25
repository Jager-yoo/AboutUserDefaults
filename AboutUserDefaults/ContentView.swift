//
//  ContentView.swift
//  AboutUserDefaults
//
//  Created by 유재호 on 3/24/24.
//

import SwiftUI

struct ContentView: View {

  @State private var num: Int = UserDefaults.standard.integer(forKey: "nothing")

  @State private var isToggleOn: Bool = UserDefaults.standard.bool(forKey: "abc")

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

      GroupBox {
        // 커스텀 Binding 구현한다.
        Toggle("abc", isOn: Binding(
          get: { isToggleOn },
          set: { newValue in
            isToggleOn = newValue
            UserDefaults.standard.set(newValue, forKey: "abc")
          })
        )
        .labelsHidden()
      }
    }
  }
}

#Preview {
  ContentView()
}
