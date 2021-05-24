//
//  HotView.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import SwiftUI

struct HotView: View {
    @State var bannerViewModel = HotBannerViewModel()
    @State var isLoadFinish = false
    var body: some View {
        NavigationView{
            VStack{
                if isLoadFinish {
                    HotBannerView()
                        .environmentObject(bannerViewModel)
                }
                HotListView()
            }.navigationTitle("热门")
            .onAppear(perform: {
                FDNetwork.GET(url: "https://gank.io/api/v2/banners", param: nil) { response in
                    let responseModel = BaseResponseModel.deserialize(from: response) ?? BaseResponseModel()
                    var banners = [Banner]()
                    let tempModel = HotBannerViewModel()
                    for dict in responseModel.data {
                        let model = Banner.deserialize(from: dict)
                        banners.append(model ?? Banner())
                    }
                    tempModel.homeBannerArray = [banners.last!] + banners + [banners.first!]
                    bannerViewModel = tempModel
                    isLoadFinish = true
                } failure: { error in
                    debugPrint(error)
                }
            })
        }
    }
}

struct HotView_Previews: PreviewProvider {
    static var previews: some View {
        HotView()
    }
}
