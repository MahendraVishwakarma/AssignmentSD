//
//  Common+Extension.swift
//  SaadiCode
//
//  Created by Mahendra Vishwakarma on 09/04/21.
//

import Foundation

//MARK:- basic url
class AppURLs {
    static var baseURL = "https://jsonplaceholder.typicode.com/users"
}
//MARK:- generics type result to handle responces
public enum Result<T, U> where U:Error {
    case success(T)
    case failure(U)
}

//MARK:- custom error types
public enum APIError:Error {
     case failedRequest(String?)
}

//MARK:- HTTPS methods type
public enum HttpsMethod {
    case Post
    case Get
    case Put
    case Delate
    
    var localization:String{
        switch self {
        case .Post: return "POST"
        case .Get: return "GET"
        case .Put: return "PUT"
        case .Delate: return "Delete"
            
        }
        
    }
}
