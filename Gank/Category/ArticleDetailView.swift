//
//  ArticleDetailView.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import SwiftUI

struct ArticleDetailView: View {
    var article: Article
    var body: some View {
        Text(article.desc)
            .navigationTitle(article.title)
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: demo_articles_ios[0])
    }
}
