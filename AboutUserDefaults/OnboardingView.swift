//
//  OnboardingView.swift
//  AboutUserDefaults
//
//  Created by 유재호 on 3/26/24.
//

import SwiftUI

struct OnboardingView: View {

  @EnvironmentObject private var userDefaultsClient: UserDefaultsClient

  @Environment(\.dismiss) private var dismiss

  var body: some View {
    Image(.onboarding)
      .resizable()
      .scaledToFit()
      .ignoresSafeArea()
      .overlay(alignment: .topTrailing) {
        Button(action: { dismiss() }) {
          Image(systemName: "xmark")
            .font(.largeTitle.bold())
            .foregroundStyle(.red)
            .padding()
            .background(.ultraThinMaterial, in: .circle)
        }
        .padding(.trailing, 16)
      }
  }
}

#Preview {
  OnboardingView()
}
