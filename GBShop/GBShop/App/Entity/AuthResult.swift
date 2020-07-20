//
//  AuthResult.swift
//  GBShop
//
//  Created by Maksim Romanov on 19.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
}

struct LogoutResult: Codable {
    let result: Int
}
