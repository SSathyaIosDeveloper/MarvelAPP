//
//  CharactersModel.swift
//  MarvelApp
//
//  Created by admin on 4/28/22.
//

import Foundation

struct CharactersModel: Codable  {
    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var attributionHTML: String?
    var etag: String?
    var data: Data?
}

struct Data: Codable  {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [Results]?
}

struct Results: Codable  {
    var id: Int?
    var name: String?
    var description: String?
    var thumbnail: Thumbnail?
}

struct Thumbnail: Codable  {
    var path: String?
    var `extension`: String?
}

