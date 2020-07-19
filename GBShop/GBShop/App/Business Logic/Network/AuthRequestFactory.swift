//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Maksim Romanov on 19.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void)
}
