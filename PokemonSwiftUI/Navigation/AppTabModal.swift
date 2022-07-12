//
//  AppTabModal.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import SwiftUI

final class AppTabModal: ObservableObject {
    @Published var isShowingOnBoardView = false
// This will check if launch screen has been seen
// Ensuring it only gets seen once 
    var hasSeenOnBoardView: Bool {
       return UserDefaults.standard.bool(forKey: "isShowingOnBoardView")
    }
    func runStartUpChecks() {
        if !hasSeenOnBoardView {
            isShowingOnBoardView = true
            UserDefaults.standard.set(true, forKey: "isShowingOnBoardView")
        }
    }
}
