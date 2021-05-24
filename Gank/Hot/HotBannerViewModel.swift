//
//  HotBannerViewModel.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import Foundation
import SwiftUI

final class HotBannerViewModel: ObservableObject {
    
    /// Banner-Size
    public let homeBannerWidth: CGFloat = CGFloat.screenW - 30
    public let homeBannerHeight: CGFloat = 150
    
    public var homeBannerArray = [Banner]()
}

// MARK: -
extension HotBannerViewModel{
    
    /// banner个数
    /// - Returns: description
    func homeBannerCount() -> NSInteger {
        return homeBannerArray.count
    }
    
    /// banner 图片
    /// - Parameter indexPath: indexPath description
    /// - Returns: description
    func bannerImage(_ indexPath:NSInteger) -> String {
        return homeBannerArray[indexPath].image
    }
}
