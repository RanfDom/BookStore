//
//  ParameterEncoding.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation

public typealias Parameters = [String:Any]

public protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum ParameterEncoding {
    
    case jsonEncoding
    
    public func encode(urlRequest: inout URLRequest,
                     bodyParameters: Parameters?,
                     urlParameters: Parameters?) throws {
        do {
            switch self {
            case .jsonEncoding:
                guard let bodyParameters = bodyParameters else { return }
                try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
            }
        }catch {
            throw error
        }
    }
}

public enum NetworkError : String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
