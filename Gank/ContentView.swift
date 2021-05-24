//
//  ContentView.swift
//  Gank
//
//  Created by Mac on 2021/5/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HotView()
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
                .tabItem {
                    Image(systemName: "livephoto")
                    Text("热门")
                }
            CategoryView()
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
                .tabItem {
                    Image(systemName: "list.triangle")
                    Text("分类")
                }
            GirlView()
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("妹纸")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
