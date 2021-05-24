//
//  ArticleListView.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import SwiftUI

struct ArticleListView: View {
    var body: some View {
        List(articles_ios){ article in
            NavigationLink(
                destination: ArticleDetailView(article: article),
                label: {
                    Text(article.title)
                })
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
