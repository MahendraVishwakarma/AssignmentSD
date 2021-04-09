//
//  UsersViewModel.swift
//  SaadiCode
//
//  Created by Mahendra Vishwakarma on 09/04/21.
//

import Foundation
import UIKit

class UserViewModel {
    //delegate to update fetched data from server to view
    weak var delegate: UserListUpdate?
    var userList:UserModel?
    init() {
        
    }
    public func fetchUsersData() {
        
        let url = AppURLs.baseURL
        
        WebServices.requestHttp(urlString: url, method: .Get, param: nil, decode: { (json) -> UserModel? in
            guard let response = json as? UserModel else{
                return nil
            }
            return response
            
        }) { [weak self] (result) in
            
            switch result {
            case .success(let response) :
                if let data = response {
                    self?.userList = data
                    self?.delegate?.updateList(status: true)
                    
                }
                break
            case .failure(let error) :
                print(error.localizedDescription)
                self?.delegate?.updateList(status: false)
                break
            }
            
        }


    }
    // deinitialization the model
    deinit {
        //print('user model deinit called')
    }
}
