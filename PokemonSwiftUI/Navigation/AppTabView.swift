//
//  AppTabView.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import SwiftUI

struct AppTabView: View {
    @StateObject private var viewModal = AppTabModal()
    var body: some View {
        // Creating table view
        TabView {
            ContentView(viewModal: ContentViewModal())
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            FavsView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favs")
            }
        }
        .onAppear {
            viewModal.runStartUpChecks()
        }
        .sheet(isPresented: $viewModal.isShowingOnBoardView) {
            OnBoardView(isShowingOnBoardView: $viewModal.isShowingOnBoardView)
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
