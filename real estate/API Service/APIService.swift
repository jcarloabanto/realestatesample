//
//  APIService.swift
//  real estate
//
//  Created by jcarloabanto on 5/20/21.
//

import Foundation

protocol GetPostDelegate {
    func didGetPost(_ apiService: APIService, propertyViewModel: [PropertyViewModel])
}

struct APIService {
    
    var delegate: GetPostDelegate?
    
    func getPropertyData() {
        if let url = URL(string:"https://f213b61d-6411-4018-a178-53863ed9f8ec.mock.pstmn.io/properties") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let safeData = data {
                    if let propertyViewModelArray = self.parseJSON(safeData) {
                        self.delegate?.didGetPost(self, propertyViewModel: propertyViewModelArray)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> [PropertyViewModel]? {
        let decoder = JSONDecoder()
        
        do {
            var propertyViewModelArray = [PropertyViewModel]()
            let decodedPropertyArray = try decoder.decode(Property.self, from: data)
            
            for eachProperty in decodedPropertyArray.data {
                let propertyViewModel = PropertyViewModel(property: eachProperty)
                propertyViewModelArray.append(propertyViewModel)
            }
            return propertyViewModelArray
        } catch {
            return nil
        }
    }
}
