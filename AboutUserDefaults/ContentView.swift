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

  // !!!: 편리하지만, View 안에서 다루는 유저디폴트가 많아지면, 프로퍼티가 비례해서 많아진다.
  @AppStorage("abc") private var isToggleOnMirror: Bool = false
  @AppStorage("abc") private var isToggleOnMirror2: Bool = true
  @AppStorage("abc") private var isToggleOnMirror3: Bool = false

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

      GroupBox("UserDefaults") {
        // 커스텀 Binding 구현한다.
        Toggle("abc", isOn: Binding(
          get: { isToggleOn },
          set: { newValue in
            isToggleOn = newValue
            UserDefaults.standard.set(newValue, forKey: "abc") // 여길 바꾸면 @AppStorage 값도 즉시 바뀐다. 실시간 반응하는 것.
          })
        )
        .labelsHidden()
      }

      GroupBox("@AppStorage") { // 키값이 같다면, 모두 같은 값을 바라본다.
        Toggle("", isOn: $isToggleOnMirror)
          .tint(.orange)

        Toggle("", isOn: $isToggleOnMirror2)
          .tint(.pink)

        Toggle("", isOn: $isToggleOnMirror3)
          .tint(.red)
      }
      .labelsHidden()
    }
  }
}

#Preview {
  ContentView()
}
