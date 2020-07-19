//
//  User.swift
//  GBShop
//
//  Created by Maksim Romanov on 19.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
