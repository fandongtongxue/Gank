//
//  Category.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import Foundation

class Category: BaseModel, Identifiable, Decodable {
    var id = 0
    var _id = ""
    var desc = ""
    var coverImageUrl = ""
    var title = ""
    var type = ""
}
