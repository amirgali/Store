//
//  OrdersRequests.swift
//  SchoolStore
//
//  Created by Амиргали Туралинов on 05.10.2021.
//

import Foundation

enum OrdersRequests: Request {
    case postOrdersCheckout(productId: String, size: String, quantity: Int, house: String, apartment: String?, etd: String)
    case getOrders
    case putOrdersIdCancel
    
    var path: String {
        switch self {
        case .postOrdersCheckout:
            return "orders/checkout"
        case .getOrders:
            return "orders"
        case .putOrdersIdCancel:
            return "orders/{order_id}/cancel"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .postOrdersCheckout:
            return .post
        case .getOrders:
            return .get
        case .putOrdersIdCancel:
            return .put
        }
    }
    
    var body: Data? {
        switch self {
        case let .postOrdersCheckout(productId, size, quantity, house, apartment, etd):
            return RequestBuilderImpl.encode(["productId": productId, "size": size, "quantity": String(quantity), "house": house, "apartment": apartment, "etd": etd])
        default:
            return nil
        }
    }
    
    var mock: Data? {
        switch self {
        case .postOrdersCheckout:
            guard let path = Bundle.main.path(forResource: "postOrdersCheckout", ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            else {
                return nil
            }
            return data
        case .getOrders:
            guard let path = Bundle.main.path(forResource: "getOrders", ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            else {
                return nil
            }
            return data
        case .putOrdersIdCancel:
            guard let path = Bundle.main.path(forResource: "putOrdersIdCancel", ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            else {
                return nil
            }
            return data
        }
    }
}
