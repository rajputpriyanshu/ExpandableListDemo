//
//  CategoryModel.swift
//  MantraAssignment
//
//  Created by ATLOGYS on 16/03/21.
//

import Foundation

struct CategoryResponse : Codable {
    let name : String?
    let sub_category : [Sub_category]?
    var opened = false

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case sub_category = "sub_category"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        sub_category = try values.decodeIfPresent([Sub_category].self, forKey: .sub_category)
    }

}

struct Sub_category : Codable {
    let name : String?
    let display_name : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case display_name = "display_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        display_name = try values.decodeIfPresent(String.self, forKey: .display_name)
    }

}
