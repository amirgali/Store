// \HxH School iOS Pass
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import Foundation

enum AuthRequest: Request {
    case putUserSingin(user: String, password: String)
    case getUser
    case patchUser(name: String?, surname: String?, occupation: String?, avatar: String?)
    

    // MARK: Internal

    var path: String {
        switch self {
        case .putUserSingin:
            return "user/signin"
        case .getUser, .patchUser:
            return "user"
        }
    }

    var method: RequestMethod {
        switch self {
        case .putUserSingin:
            return .put
        case .getUser:
            return .get
        case .patchUser:
            return .patch
        }
    }

    var body: Data? {
        switch self {
        case let .putUserSingin(user, password):
            return RequestBuilderImpl.encode(["login": user, "password": password])
        case let .patchUser(name, surname, occupation, avatar):
            return RequestBuilderImpl.encode(["name": name, "surname": surname, "occupation": occupation, "avatar": avatar])
        default:
            return nil
        }
    }

    var mock: Data? {
        switch self {
        case .putUserSingin:
            guard let path = Bundle.main.path(forResource: "putUserSingin", ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            else {
                return nil
            }
            return data
        case .getUser:
            guard let path = Bundle.main.path(forResource: "getUser", ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            else {
                return nil
            }
            return data
        case .patchUser:
            guard let path = Bundle.main.path(forResource: "patchUser", ofType: "json"),
                  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            else {
                return nil
            }
            return data
        }
    }
}

