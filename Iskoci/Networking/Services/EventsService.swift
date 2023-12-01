//
//  EventsService.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 6.11.23..
//

import Foundation
import Alamofire

struct EventsService {
    // MARK: - Public methods
    
    static func getRequest(method: HTTPMethod, url: String = Urls.events.urlString,headers: HTTPHeaders, parameters: Parameters, _ completion : @escaping (Result<EventsResponse, Error>) -> ()) {
        
        AF.request(url, method: method, parameters: parameters, headers: headers).responseDecodable(of: EventsResponse.self) {
            response in
            switch(response.result) {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func sendHeadersRequest(method: HTTPMethod, url: String = Urls.userDeviceId.urlString, headers: HTTPHeaders, _ completion : @escaping (Result<UserResponse, Error>) -> ()) {
        
        AF.request(url, method: method, headers: headers)
            .responseDecodable(of: UserResponse.self) {
            response in
            
            switch(response.result) {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func addToFavoriteRequest(method: HTTPMethod, url: String, headers: HTTPHeaders, _ completion : @escaping (Result<UserResponse, Error>) -> ()) {
        
        AF.request(url, method: method, headers: headers)
            .responseDecodable(of: UserResponse.self) {
                response in
                
                switch(response.result) {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }  
    
    static func removeFromFavoriteRequest(method: HTTPMethod, url: String, headers: HTTPHeaders, _ completion : @escaping (Result<UserResponse, Error>) -> ()) {
        
        AF.request(url, method: method, headers: headers)
            .responseDecodable(of: UserResponse.self) {
                response in
                
                switch(response.result) {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func getFavoriteEventsRequest(method: HTTPMethod, url: String = Urls.getFavorites.urlString, parameters: Parameters, headers: HTTPHeaders,  _ completion : @escaping (Result<EventsResponse, Error>) -> ()) {
        
        AF.request(url, method: method, parameters: parameters, headers: headers)
            .responseDecodable(of: EventsResponse.self) {
                response in
                
                switch(response.result) {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func getNotificationEventsRequest(method: HTTPMethod, url: String = Urls.getNotificationEvents.urlString, parameters: Parameters, headers: HTTPHeaders, completion : @escaping (Result<NotificationResponse, Error>) -> ()) {
        AF.request(url, method: method, parameters: parameters, headers: headers)
            .responseDecodable(of: NotificationResponse.self) {
                response in
                switch(response.result) {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
