//
//  ContentView.swift
//  AboutUserDefaults
//
//  Created by 유재호 on 3/24/24.
//

import SwiftUI

struct ContentView: View {

  @State private var num: Int = UserDefaults.standard.integer(forKey: "nothing") // 크래시가 날까?

  var body: some View {
    VStack {
      GroupBox {
        Text("\(num)")
          .font(.largeTitle)
      }

      Button("Up!") {
        num += 1 // 저장이 될까? -> 안 됨. @State 값을 바꾼거지 유저디폴트를 건드린 게 아님.
        UserDefaults.standard.set(num, forKey: "nothing") // 이러면 됨
        // 무슨 리스크가 있을까?
        // 1. 순서가 바뀌면 크리티컬 하다.
        // 2. 매번 이렇게 수동으로 set 을 해줘야 한다.
        // 3. key 값을 하드코딩하기 때문에 typo 리스크가 있다.
      }
      .buttonStyle(.bordered)
    }
  }
}

#Preview {
  ContentView()
}
