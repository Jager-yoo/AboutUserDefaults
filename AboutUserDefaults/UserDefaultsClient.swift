//
//  UserDefaultsClient.swift
//  AboutUserDefaults
//
//  Created by 유재호 on 3/26/24.
//

import Foundation

final class UserDefaultsClient: ObservableObject {

  static let shared = UserDefaultsClient()

  init() { }

  @Published var isDarkMode: Bool = UserDefaults.standard.bool(forKey: "isDarkMode") {
    didSet {
      UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
    }
  }
}
