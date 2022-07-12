//
//  OnBoardView.swift
//  PokemonSwiftUI
//
//  Created by james Jones on 30/06/2022.
//

import SwiftUI

struct OnBoardView: View {
    @Binding var isShowingOnBoardView: Bool
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isShowingOnBoardView = false
                }, label: {
                    XDismissButton()
                }).padding()
            }
            Spacer()
            Image(systemName: "house")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.bottom, 30)
            VStack(alignment: .leading, spacing: 32.0) {
                OnboardInfoView(imageName: "magnifyingglass", title: "Search", description: "Find for your favourites")
                OnboardInfoView(imageName: "star", title: "Save", description: "Keep the best in your PokeDex")
                OnboardInfoView(imageName: "octagon", title: "Pokemon!", description: "Catch'em All!")
            }
            .padding(.horizontal, 30)
            Spacer()
        }
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView(isShowingOnBoardView: .constant(true))
    }
}

struct OnboardInfoView: View {
    var imageName: String
    var title: String
    var description: String
    var body: some View {
        HStack(spacing: 26.0) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.red.opacity(0.4))
            VStack(alignment: .leading, spacing: 4.0) {
                Text(title).bold()
                Text(description)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.75)
            }
        }
    }
}
