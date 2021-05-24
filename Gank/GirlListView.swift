//
//  HotList.swift
//  Gank
//
//  Created by Mac on 2021/5/22.
//

import SwiftUI

struct GirlListView: View {
    var body: some View {
        NavigationView{
            List(girls){ article in
                NavigationLink(
                    destination: GirlDetailView(article: article),
                    label: {
                        Text(article.category+article.title)
                    })
            }
            .navigationTitle("妹纸")
        }
    }
}

struct GirlList_Previews: PreviewProvider {
    static var previews: some View {
        GirlListView()
    }
}
