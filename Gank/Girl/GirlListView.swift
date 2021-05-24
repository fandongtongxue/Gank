//
//  HotList.swift
//  Gank
//
//  Created by Mac on 2021/5/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct GirlListView: View {
    @State var girls = [Article]()
    var body: some View {
        NavigationView{
            List(girls){ article in
                NavigationLink(
                    destination: GirlDetailView(article: article),
                    label: {
                        HStack{
                            Text(article.category+" "+article.title)
                            WebImage(url: URL(string: article.images.first ?? ""))
                                .resizable()
                                .indicator(.activity)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100 * 16 / 9, height: 100, alignment: .trailing)
                        }
                    }).frame(height: 100)
            }
            .navigationTitle("妹纸")
        }
        .onAppear(perform: {
            FDNetwork.GET(url: "https://gank.io/api/v2/data/category/Girl/type/Girl/page/1/count/20", param: nil) { response in
                let responseModel = BaseResponseModel.deserialize(from: response) ?? BaseResponseModel()
                girls.removeAll()
                for dict in responseModel.data {
                    let model = Article.deserialize(from: dict)
                    girls.append(model ?? Article())
                }
            } failure: { error in
                debugPrint(error)
            }
        })
    }
}

struct GirlList_Previews: PreviewProvider {
    static var previews: some View {
        GirlListView()
    }
}
