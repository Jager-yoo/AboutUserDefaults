//
//  ContentView.swift
//  AboutUserDefaults
//
//  Created by 유재호 on 3/24/24.
//

import SwiftUI

struct ContentView: View {

  @State private var isToggleOnAsState: Bool = false // ContentView 가 다시 init 되면 초기화 됨

  @AppStorage("isToggleOn") private var isToggleOn: Bool = false // 유저디폴트 래퍼 - 변화를 계속 감지한다.

  @State private var isToggleOnMirror = UserDefaults.standard.bool(forKey: "isToggleOn") // 변화 감지 못 함

  var body: some View {
    VStack {
      GroupBox {
        Text("@State")
        Toggle("isToggleOn", isOn: $isToggleOnAsState)
          .labelsHidden()
          .tint(.red)
      }

      GroupBox {
        Text("@AppStorage")
        Toggle("isToggleOn", isOn: $isToggleOn)
          .labelsHidden() // Toggle 의 금쪽이 행동 감추기
          .tint(.cyan) // tint 통해 토글의 컬러도 변경 가능
      }

      GroupBox {
        Text("UserDefaults")
        Toggle("isToggleOn", isOn: $isToggleOnMirror)
          .labelsHidden() // Toggle 의 금쪽이 행동 감추기
          .tint(.mint) // tint 통해 토글의 컬러도 변경 가능
          .onChange(of: isToggleOnMirror) { oldValue, newValue in
            if oldValue != newValue {
              UserDefaults.standard.set(newValue, forKey: "isToggleOn")
            }
          }
      }
    }
  }
}

#Preview {
  ContentView()
}
