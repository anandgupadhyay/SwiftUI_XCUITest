// Define your tip's content.
struct FavoriteCarTip: Tip {
    var title: Text {
        Text("Save as a Favorite")
    }


    var message: Text? {
        Text("Your favorite Cars always appear at the top of the list.")
    }


    var image: Image? {
        Image(systemName: "star")
    }
}


@main
struct CarTips: App {
    // Create an instance of your tip.
    var favoriteCarTip = FavoriteCarTip()


    var body: some Scene {
        WindowGroup {
            VStack {
                // Place the tip view near the button you want to highlight.
                TipView(favoriteCarTip, arrowEdge: .bottom)


                Image(systemName: "star")
                    .imageScale(.large)
                Spacer()
            }
            .task {
                // Configure and load your tips at app launch.
                try? Tips.configure([
                    .displayFrequency(.immediate),
                    .datastoreLocation(.applicationDefault)
                ])
            }
        }
    }
}
