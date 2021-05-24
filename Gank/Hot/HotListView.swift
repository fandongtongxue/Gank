//
//  HotListView.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import SwiftUI

struct HotListView: View {
    @State var hots = [Article]()
    var body: some View {
        List(hots){ article in
            NavigationLink(
                destination: ArticleDetailView(article: article),
                label: {
                    Text(article.title)
                })
        }
        .onAppear(perform: {
            FDNetwork.GET(url: "https://gank.io/api/v2/hot/views/category/Article/count/20", param: nil) { response in
                let responseModel = BaseResponseModel.deserialize(from: response) ?? BaseResponseModel()
                hots.removeAll()
                for dict in responseModel.data {
                    let model = Article.deserialize(from: dict)
                    hots.append(model ?? Article())
                }
            } failure: { error in
                debugPrint(error)
            }
        })
    }
}

struct HotListView_Previews: PreviewProvider {
    static var previews: some View {
        HotListView()
    }
}
