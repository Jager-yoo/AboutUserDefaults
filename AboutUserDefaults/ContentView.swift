//
//  ContentView.swift
//  AboutUserDefaults
//
//  Created by 유재호 on 3/24/24.
//

import SwiftUI

struct ContentView: View {

  @State private var num: Int = .zero

  var body: some View {
    VStack {
      GroupBox {
        Text("\(num)")
          .font(.largeTitle)
      }

      Button("Up!") {
        num += 1
      }
      .buttonStyle(.bordered)
    }
  }
}

#Preview {
  ContentView()
}
