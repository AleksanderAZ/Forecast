//
//  ApiServise.swift
//  Forecasts
//
//  Created by Z on 11/14/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

class NetworkServiceAPI: NSObject, NetworkServiceApiProtocol {
    
    static let shared = NetworkServiceAPI()
    private var sessionDataTask: URLSessionDataTask?
    
    internal func request<T: Codable>(_ method: String,_ url: String,_ parameters: [String: String], completion: @escaping (T?, _ error: String?)->()) {
        guard var components = URLComponents(string: url) else { return completion(nil, ErrorInfo.urlIsNil.string) }
        components.addQueryItems(parameters)
        guard let componentsUrl = components.url else { return completion(nil, ErrorInfo.componentsUrlIsNil.string) }
        var request = URLRequest(url: componentsUrl)
        request.httpMethod = method
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode, error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            if let result = try? JSONDecoder().decode(T?.self, from: data) {
                return completion(result, nil)
            } else {
                return completion(nil, ErrorInfo.dataIsNil.string)
            }
        }
        self.sessionDataTask = task
        task.resume()
    }
    
    func cancelRequests() {
        sessionDataTask?.cancel()
    }
    
    func loadAPIRequest<T: Codable>(pathURL: String, searchText: String, completion: @escaping (T?, String?)->()) {
        let parameters: [String: String] = RequestsDataAPI.parametersApiKey.merging([RequestsDataAPI.searchKey: searchText], uniquingKeysWith: { (_, new) in new })
        let url = RequestsDataAPI.baseURL + pathURL
        self.request(RequestsDataAPI.methodGet, url, parameters) { [weak self] (result: T?, error) in
            guard let result = result else {
                completion(nil, error)
                return
            }
            completion(result, nil)
        }
    }
    func loadAPIRequest<T: Codable>(pathURL: String, completion: @escaping (T?, String?)->()) {
        let url = RequestsDataAPI.baseURL + pathURL
        self.request(RequestsDataAPI.methodGet, url, RequestsDataAPI.parametersApiKey) { [weak self] (result: T?, error) in
            guard let result = result else {
                completion(nil, error)
                return
            }
            completion(result, nil)
        }
    }
}

extension URLComponents {
    mutating func addQueryItems(_ parameters: [String: String]) {
        self.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        self.percentEncodedQuery = self.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
    }
}

