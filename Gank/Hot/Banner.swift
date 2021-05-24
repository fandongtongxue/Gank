//
//  Banner.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import Foundation

struct Banner: Hashable, Codable, Identifiable {
    var id : Int
    var url : String
    var image : String
    var title : String
}
