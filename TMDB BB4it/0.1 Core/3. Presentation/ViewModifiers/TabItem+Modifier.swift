//
//  ViewModifiers.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

extension View {
    func nowPlayingTabItem() -> some View {
        self.tabItem {
            Label(
                String.text.NowPlaying,
                systemImage: "play.rectangle.on.rectangle.fill"
            )
        }
    }

    func upcomingTabItem() -> some View {
        self.tabItem {
            Label(
                String.text.Upcoming,
                systemImage: "sparkles"
            )
        }
    }

    func popularTabItem() -> some View {
        self.tabItem {
            Label(
                String.text.Popular,
                systemImage: "flame.fill"
            )
        }
    }
}
