//
//  DataRequest.swift
//  GBShop
//
//  Created by Maksim Romanov on 19.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation
import Alamofire

protocol AbstractRequestFactory {
    var errorParser: AbstractErrorParser { get }
    var session: Session { get }
    var queue: DispatchQueue? { get }
    
    @discardableResult
    func request<T: Decodable>(
        request: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void)
        -> DataRequest
}

extension AbstractRequestFactory {
    
    @discardableResult
    public func request<T: Decodable>(
        request: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void)
        -> DataRequest {
            return session
                .request(request)
                .responseDecodable(completionHandler: completionHandler)
    }
}

extension DataRequest {
    
    @discardableResult
    public func responseDecodable<T: Decodable>(of type: T.Type = T.self,
                                                queue: DispatchQueue = .main,
                                                decoder: DataDecoder = JSONDecoder(),
                                                completionHandler: @escaping (AFDataResponse<T>) -> Void) -> Self {
        
        return response(queue: queue,
                        responseSerializer: DecodableResponseSerializer(decoder: decoder),
                        completionHandler: completionHandler)
    }
}
