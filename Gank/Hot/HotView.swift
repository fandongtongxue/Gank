//
//  HotView.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import SwiftUI

struct HotView: View {
    var body: some View {
        NavigationView{
            VStack{
                HotBannerView()
                    .environmentObject(HotBannerViewModel())
                HotListView()
            }.navigationTitle("热门")
        }
    }
}

struct HotView_Previews: PreviewProvider {
    static var previews: some View {
        HotView()
    }
}
