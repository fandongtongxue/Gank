//
//  ArticleDetailView.swift
//  Gank
//
//  Created by Mac on 2021/5/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ArticleDetailView: View {
    var article : Article
    var body: some View {
//        Text(article.category+article.title)
        WebImage(url: URL(string: article.url))
            .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFit()
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .center)
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: girls[0])
    }
}
