//
//  HotListView.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import SwiftUI

struct HotListView: View {
    var body: some View {
        List(hots){ article in
            NavigationLink(
                destination: ArticleDetailView(article: article),
                label: {
                    Text(article.title)
                })
        }
    }
}

struct HotListView_Previews: PreviewProvider {
    static var previews: some View {
        HotListView()
    }
}
