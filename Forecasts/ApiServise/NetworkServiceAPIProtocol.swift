//
//  ApiServiseProtocol.swift
//  Forecasts
//
//  Created by Z on 11/14/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

protocol CustomErrorProtocol: Error {
    var localizedDescription: String { get }
    var code: Int { get }
}

protocol NetworkServiceApiProtocol {
    func request<T: Codable>(_ method: String,_ url: String,_ parameters: [String: String], completion: @escaping (T?, _ error: String?)->())
    func cancelRequests()
    func loadAPIRequest<T: Codable>(pathURL: String, searchText: String, completion: @escaping (T?, String?)->())
    func loadAPIRequest<T: Codable>(pathURL: String, completion: @escaping (T?, String?)->())
}
