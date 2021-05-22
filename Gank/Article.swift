//
//  Article.swift
//  Gank
//
//  Created by Mac on 2021/5/22.
//

import Foundation

struct Article: Hashable, Codable, Identifiable {
    var id : Int
    var _id : String
    var author : String
    var category : String
    var createdAt : String
    var desc : String
    var images : [String]
    var likeCounts : Int
    var publishedAt : String
    var stars : Int
    var title : String
    var type : String
    var url : String
    var views : Int
}
