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

  // !!!: iOS 14 에 등장한 UserDefaults 를 감싼 프로퍼티 래퍼! 마치 @State 처럼 쓸 수 있다. 초기값이 필요하다.
  @AppStorage("abc") private var isToggleOnMirror: Bool = false // 'true'로 세팅된 값을 'false'로 시작하더라도 true 가 됨.

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

      GroupBox("@AppStorage") {
        Toggle("", isOn: $isToggleOnMirror) // 근데 여길 바꾸면 @State 로 홀딩한 유저디폴트는 반응하지 않는다. 종료했다가 키면 바뀌어있다. 왜? view redrawing 안 돼서 그래.
          .labelsHidden()
          .tint(.orange)
      }
    }
  }
}

#Preview {
  ContentView()
}
