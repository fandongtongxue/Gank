//
//  CategoryListView.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import SwiftUI

struct CategoryListView: View {
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
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
