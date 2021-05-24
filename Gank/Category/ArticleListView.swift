//
//  ArticleListView.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import SwiftUI

struct ArticleListView: View {
    var category = Category()
    @State var articles = [Article]()
    var body: some View {
        List(articles){ article in
            NavigationLink(
                destination: WebView(url: article.url),
                label: {
                    Text(article.title)
                })
        }
        .onAppear(perform: {
            FDNetwork.GET(url: "https://gank.io/api/v2/data/category/All/type/"+category.type+"/page/1/count/20", param: nil) { response in
                let responseModel = BaseResponseModel.deserialize(from: response) ?? BaseResponseModel()
                articles.removeAll()
                for dict in responseModel.data {
                    let model = Article.deserialize(from: dict)
                    articles.append(model ?? Article())
                }
            } failure: { error in
                debugPrint(error)
            }
        })
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
