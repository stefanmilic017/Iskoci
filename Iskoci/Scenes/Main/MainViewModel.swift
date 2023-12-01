//
//  MainViewModel.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 20.11.23..
//

import Foundation
import Alamofire
import UIKit

final class MainViewModel {
    var defaults = UserDefaults.standard
    
    init() {
        setUserId()
    }
    
    func setUserId (){
        defaults.set(false, forKey: "\(UserDefaultsHelper.Keys.isRegistered)")
        guard !defaults.bool(forKey: "\(UserDefaultsHelper.Keys.isRegistered)") else { return }

        EventsService.sendHeadersRequest(method: .post, url: Urls.userDeviceId.urlString, headers: mojHeader, { [weak self] result in
            guard let self else { return }
            guard case .success(_) = result else { return }
            defaults.set(true, forKey: "\(UserDefaultsHelper.Keys.isRegistered)")
        })
    }
}


let mojHeader: HTTPHeaders = ["DeviceId": "024"]
