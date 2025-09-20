//
//  ListScreen.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import SwiftUI

struct ListScreen: View {
    var body: some View {
        TabView {
            MovieListTabView(
                controller: .init(
                    title: .text.NowPlaying,
                    useCase: .nowPlaying
                )
            )
            .tabItem {
                Label(
                    String.text.NowPlaying,
                    systemImage: "play.rectangle.on.rectangle.fill"
                )
            }

            MovieListTabView(
                controller: .init(
                    title: .text.Upcoming,
                    useCase: .upcoming
                )
            )
            .tabItem {
                Label(
                    String.text.Upcoming,
                    systemImage: "sparkles"
                )
            }

            MovieListTabView(
                controller: .init(
                    title: .text.Popular,
                    useCase: .popular
                )
            )
            .tabItem {
                Label(
                    String.text.Popular,
                    systemImage: "flame.fill"
                )
            }
        }
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            // correct the transparency bug for Navigation bars
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithTransparentBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance

        }
    }
}


struct FeaturedMovieView: View {
    //    let movie: Movie

    var body: some View {
        Color.clear
            .frame(height: 375)
            .background {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/1RgPyOhN4DRs225BGTlHJqCudII.jpg")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
            }
            .overlay {
                LinearGradient(
                    gradient: .init(
                        colors: [
                            .clear,
                            .black.opacity(0.975)
                        ]
                    ),
                    startPoint: .init(x: 0.5, y: 0.35),
                    endPoint: .bottom
                )
            }
            .overlay {
                VStack(alignment: .leading) {
                    Spacer()

                    Text("Movie Title")
                        .font(.title)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

                    Text("This is a brief overview of the movie that gives users an idea of what it's about.")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
    }
}

import SwiftUI

//struct CarouselView: View {
//    // This would be your array of movies
//    let items: [Movie]
//
//    var body: some View {
//        // 1. The main container is a horizontal ScrollView
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 0) { // Use spacing: 0 and add padding inside the item
//                ForEach(items) { item in
//                    CarouselItemView(item: item)
//                }
//            }
//            // 2. This is the new iOS 16 modifier that tells the scroll view
//            //    where its content's scroll targets are.
//            .scrollTargetLayout()
//        }
//        // 3. This is the magic part. It tells the scroll view to align its
//        //    paged scrolling behavior to the center of each view inside.
//        //    This creates the "snapping" effect.
//        .scrollTargetBehavior(.viewAligned)
//    }
//}
//
//struct CarouselItemView: View {
//    let item: Movie
//
//    var body: some View {
//        // 4. Use GeometryReader to get the item's position on the screen
//        GeometryReader { proxy in
//            let scale = calculateScale(for: proxy)
//
//            VStack {
//                // You would use an AsyncImage here to load the poster
//                AsyncImage(url: item.posterURL) { image in
//                    image
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 200, height: 300)
//                        .clipped()
//                        .cornerRadius(20)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
//                        )
//                        .shadow(radius: 10)
//                } placeholder: {
//                    Color.gray.opacity(0.3)
//                        .frame(width: 200, height: 300)
//                        .cornerRadius(20)
//                }
//            }
//
//                // You can add title/date here if you want
//            }
//            // 5. Apply the scaling and opacity effects
//            .scaleEffect(CGSize(width: scale, height: scale))
//            .opacity(scale) // Fade out the items on the side
//            .padding(.horizontal, 20) // Creates space between items
//        }
//        // Set the base frame for the GeometryReader
//        .frame(width: 240, height: 350)
//    }
//
//    // This is the function that calculates the scaling effect
//    private func calculateScale(for proxy: GeometryProxy) -> CGFloat {
//        // Get the absolute center of the screen
//        let screenCenterX = UIScreen.main.bounds.width / 2
//        // Get the item's center coordinate
//        let itemCenterX = proxy.frame(in: .global).midX
//
//        // Calculate the distance from the center (0 is center, >0 is right, <0 is left)
//        let diff = abs(screenCenterX - itemCenterX)
//
//        // If the item is far from the center, make it smaller.
//        // You can play with these numbers to get the effect you want.
//        if diff > 100 {
//            return 0.8
//        }
//
//        // If it's close to the center, make it full size.
//        return 1.0
//    }
//}
