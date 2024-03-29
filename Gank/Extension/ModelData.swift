//
//  ModelData.swift
//  Gank
//
//  Created by Mac on 2021/5/22.
//

import Foundation

var demo_girls: [Article] = load("girls.json")
var demo_categorys: [Category] = load("category.json")
var demo_articles_ios: [Article] = load("articles_ios.json")
var demo_banners: [Banner] = load("banners.json")
var demo_hots: [Article] = load("hots.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
