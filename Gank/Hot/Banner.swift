//
//  Banner.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import Foundation
class Banner: BaseModel, Decodable, Identifiable {
    var id = 0
    var url = ""
    var image = ""
    var title = ""
}
