//
//  APIRouter.swift
//  CatchPracticleTestDemo
//
//  Created by Riya Kaniyawala on 01/07/21.
//

import Foundation
import Moya

enum APIRouter {
    case getUsers
}

extension APIRouter: TargetType {

    var baseURL: URL {
        return URL(string: "https://raw.githubusercontent.com")!
    }
    
    var path: String {
        switch self {
        case .getUsers: return "/catchnz/ios-test/master/data/data.json" }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUsers: return .get }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUsers :
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type":"application/json"]
    }
    
    var sampleData: Data { return Data() }
}
