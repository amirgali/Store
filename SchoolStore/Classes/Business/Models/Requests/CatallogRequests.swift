//
//  CatallogRequests.swift
//  SchoolStore
//
//  Created by Амиргали Туралинов on 05.10.2021.
//

import Foundation

enum CatallogRequests: Request {
    
    case getProducts
    case getProductsId

    var path: String {
        switch self {
        case .getProducts:
            return "products"
        case .getProductsId:
            return "products/{product_id}"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getProducts:
            return .get
        case .getProductsId:
            return .get
        }
    }

    var mock: Data? {
        switch self {
        case .getProducts:
            guard let path = Bundle.main.path(forResource: "getProducts", ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            else {
                return nil
            }
            return data
        case .getProductsId:
            guard let path = Bundle.main.path(forResource: "getProductsId", ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            else {
                return nil
            }
            return data
        }
    }
}
