//
//  AdView.swift
//  AboutUserDefaults
//
//  Created by 유재호 on 3/26/24.
//

import SwiftUI

struct AdView: View {

  @EnvironmentObject private var userDefaultsClient: UserDefaultsClient

  @Environment(\.dismiss) private var dismiss

  var body: some View {
    VStack(spacing: 30) {
      Image(.hosAd)
        .resizable()
        .scaledToFit()
      
      Button {
        defer { dismiss() }
        userDefaultsClient.adHiddenDate = Date.now.timeIntervalSince1970
        print("광고 30초 숨겨짐!")
      } label: {
        Text("광고 30초 숨기기")
          .font(.title.bold())
          .frame(maxWidth: .infinity)
      }
      .buttonStyle(.borderedProminent)
      .padding(.horizontal, 16)
      .tint(.secondary.opacity(0.5))
    }
  }
}

#Preview {
  AdView()
}
