//
//  HotList.swift
//  Gank
//
//  Created by Mac on 2021/5/22.
//

import SwiftUI

struct HotListView: View {
    var body: some View {
        NavigationView{
            List(girls){ article in
                NavigationLink(
                    destination: ArticleDetailView(article: article),
                    label: {
                        Text(article.category+article.title)
                    })
            }
            .navigationTitle("最热")
        }
    }
}

struct HotList_Previews: PreviewProvider {
    static var previews: some View {
        HotListView()
    }
}
