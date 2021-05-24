//
//  Article.swift
//  Gank
//
//  Created by Mac on 2021/5/22.
//

import Foundation

class Article: BaseModel, Decodable, Identifiable {
    var id = 0
    var _id = ""
    var author = ""
    var category = ""
    var createdAt = ""
    var desc = ""
    var images = [String]()
    var likeCounts = 0
    var publishedAt = ""
    var stars = 0
    var title = ""
    var type = ""
    var url = ""
    var views = 0
}
