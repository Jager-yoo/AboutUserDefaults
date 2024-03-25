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
        Toggle("abc", isOn: $isToggleOn) // 저장이 될까? -> 안 됨! 바인딩이라 메서드도 못 씀. 이럴 땐 어떻게 해? -> onChange 사용
          .labelsHidden()
          .onChange(of: isToggleOn) { oldValue, newValue in
            if oldValue != newValue {
              UserDefaults.standard.set(newValue, forKey: "abc")
            }
          }
      }
    }
  }
}

#Preview {
  ContentView()
}
