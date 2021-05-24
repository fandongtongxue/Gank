//
//  CategoryDetailView.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import SwiftUI

struct CategoryDetailView: View {
    var category: Category
    var body: some View {
        ArticleListView()
            .navigationTitle(category.title)
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(category: categorys[0])
    }
}
