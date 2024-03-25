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

  @Published var number: Int = UserDefaults.standard.integer(forKey: Keys.number.id) {
    didSet {
      UserDefaults.standard.set(number, forKey: Keys.number.id)
    }
  }

  @Published var isDarkMode: Bool = UserDefaults.standard.bool(forKey: Keys.isDarkMode.id) {
    didSet {
      UserDefaults.standard.set(isDarkMode, forKey: Keys.isDarkMode.id)
    }
  }

  enum Keys: CaseIterable {
    case number
    case isDarkMode

    var id: String {
      "\(self)"
    }
  }
}
