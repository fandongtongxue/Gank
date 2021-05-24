//
//  Category.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import Foundation

struct Category: Hashable, Codable, Identifiable {
    var id : Int
    var _id : String
    var desc : String
    var coverImageUrl : String
    var title : String
    var type : String
}
