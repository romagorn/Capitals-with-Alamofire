//
//  Servise.swift
//  AlamofireCapitals
//
//  Created by SalemMacPro on 12.03.2021.
//

import Foundation
import Alamofire


class Service {
    //https://restcountries.eu/rest/v2
    fileprivate var baseUrl = ""
    typealias coutriesCallBack = (_ countries:[Country]?, _ status: Bool, _ message: String) -> Void
    var callBack: coutriesCallBack?
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
//MARK:- getAllCountryNameFrom
    func getAllCountryNameFrom(endPoint:String) {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            (responseData) in
            //print("We got the response")
            guard let data = responseData.data else {
                self.callBack?(nil, false, "")
                return }
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                self.callBack?(countries, true, "")
            } catch {
                print("Error decoding == \(error)")
                self.callBack?(nil, false, error.localizedDescription)
            }
        }
    }
    func complectionHandler(callBack: @escaping coutriesCallBack) {
        self.callBack = callBack
    }
}
