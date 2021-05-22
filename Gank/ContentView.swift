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
                .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    Image(systemName: "thermometer.sun")
                    Text("最热")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
