//
//  HotBannerView.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct HotBannerView: View {
    
    @EnvironmentObject var viewModel: HotBannerViewModel
    
    /// SwiftUI对定时器的简化，可以进去看看具体参数的定义
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    /// 拖拽的偏移量
    @State var dragOffset: CGFloat = .zero
    ///当前显示的位置索引,
    ///这是实际数据中的1就是数据没有被处理之前的0位置的图片
    ///所以这里默认从1开始
    @State var currentIndex: Int = 1
    /// 是否需要动画
    @State var isAnimation: Bool = true
     
    let spacing: CGFloat = 10
    
    var body: some View {
        
        /// 单个子视图偏移量 = 单个视图宽度 + 视图的间距
        let currentOffset = CGFloat(currentIndex) * (viewModel.homeBannerWidth + spacing)
        /// GeometryReader 改变了它显示内容的方式。在 iOS 13.5 中，内容放置方式为 .center。在 iOS 14.0 中则为：.topLeading
        GeometryReader(content: { geometry in
            
            HStack(spacing: spacing){
                
                ForEach(0..<viewModel.homeBannerCount()){
                    
                    /*
                    如果想自定义Image大小，可以添加frame
                    clipped()相当于UIKit里的clipsToBounds,
                    与aspectRatio(contentMode: .fill)搭配使用。
                       
                    注意：frame 要放在resizable后面，否则报错,
                    如果需求裁剪，需要放在aspectRatio后面，
                    clipped()前面，否则frame失效 */
                    
                    WebImage(url: URL(string: viewModel.bannerImage($0)))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width,
                               height: $0 == currentIndex ? geometry.size.height:geometry.size.height*0.8 )
                        .clipped() /// 裁减
                        .cornerRadius(10)                            
                }
            }.frame(width:geometry.size.width,
                   height:geometry.size.height,alignment:.leading)
             .offset(x: dragOffset - currentOffset)
             .gesture(dragGesture)
             /// 绑定是否需要动画
             .animation(isAnimation ?.spring():.none)
             /// 监听当前索引的变化,最开始初始化为0是不监听的，
             .onChange(of: currentIndex, perform: { value in
            
                isAnimation = true
                /// 第一张的时候
                if value == 0 {
                    
                    isAnimation.toggle()
                    currentIndex = viewModel.homeBannerCount() - 2
                /// 最后一张的时候currentIndex设置为1关闭动画
                }else if value == viewModel.homeBannerCount() - 1 {
                    
                    isAnimation.toggle()
                    currentIndex = 1
                }
             })
             /// 对定时器的监听
             .onReceive(timer, perform: { _ in
                currentIndex += 1
             })
            
        }).frame(width: viewModel.homeBannerWidth,
                 height: viewModel.homeBannerHeight)
    }
}


// MARK: -
extension HotBannerView{
    
    /// 定义拖拽手势
    private var dragGesture: some Gesture{
        
        DragGesture()
            /// 拖动改变
            .onChanged {
                
                isAnimation = true
                dragOffset = $0.translation.width
            }
            /// 结束
            .onEnded {
                
                dragOffset = .zero
                /// 拖动右滑，偏移量增加，显示 index 减少
                if $0.translation.width > 50{
                    currentIndex -= 1
                }
                /// 拖动左滑，偏移量减少，显示 index 增加
                if $0.translation.width < -50{
                    currentIndex += 1
                }
                /// 防止越界
                currentIndex = max(min(currentIndex, viewModel.homeBannerCount() - 1), 0)
            }
    }
}

struct HotBannerView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HotBannerView().environmentObject(HotBannerViewModel())
    }
}
