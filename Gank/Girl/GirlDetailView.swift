//
//  ArticleDetailView.swift
//  Gank
//
//  Created by Mac on 2021/5/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct GirlDetailView: View {
    var article : Article
    var body: some View {
        VStack{
            Text(article.desc).foregroundColor(.black)
            WebImage(url: URL(string: article.url))
                .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                    .scaledToFit()
        }
        .navigationTitle(article.title)
    }
}

struct GirlDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GirlDetailView(article: demo_girls[0])
    }
}
