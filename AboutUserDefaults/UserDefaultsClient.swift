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

  @Published var isToggleOn: Bool = UserDefaults.standard.bool(forKey: "abc") {
    didSet {
      print("\(oldValue) -> \(isToggleOn)")
      UserDefaults.standard.set(isToggleOn, forKey: "abc")
    }
  }

  @Published var isDarkMode: Bool = UserDefaults.standard.bool(forKey: "isDarkMode") {
    didSet {
      UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
    }
  }

  @Published var isSomething: Bool = UserDefaults.standard.bool(forKey: "isSomething") {
    didSet {
      UserDefaults.standard.set(isSomething, forKey: "isSomething")
    }
  }
}
