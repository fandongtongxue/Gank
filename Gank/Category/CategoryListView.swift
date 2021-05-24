//
//  CategoryListView.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import SwiftUI

struct CategoryListView: View {
    @State var categorys = [Category]()
    var body: some View {
        NavigationView{
            List(categorys){ category in
                NavigationLink(
                    destination: CategoryDetailView(category: category),
                    label: {
                        Text(category.title)
                    })
            }
            .navigationTitle("分类")
            .onAppear(perform: {
                FDNetwork.GET(url: "https://gank.io/api/v2/categories/Article", param: nil) { response in
                    let responseModel = BaseResponseModel.deserialize(from: response) ?? BaseResponseModel()
                    categorys.removeAll()
                    for dict in responseModel.data {
                        let model = Category.deserialize(from: dict)
                        categorys.append(model ?? Category())
                    }
                } failure: { error in
                    debugPrint(error)
                }
            })
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
