//
//  NetworkManager.swift
//  CatchPracticleTestDemo
//
//  Created by Riya Kaniyawala on 01/07/21.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<APIRouter> { get }
    func fetchUserss(completion: @escaping (Result<Users, Error>) -> ())
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<APIRouter>(plugins: [NetworkLoggerPlugin()])
    func fetchUserss(completion: @escaping (Result<Users, Error>) -> ()) {
        request(target: .getUsers, completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: APIRouter, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
