//
//  NetworkManager.swift
//  MarvelApp
//
//  Created by admin on 4/28/22.
//

import Foundation
import Security

protocol NetworkManagerProtocol {
    func getDataFromMarvelAPI(forID id: Int?, completion: @escaping (_ results: [Results]?,_ errors: Error?) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    func formingUrlRequest(withID id: Int?) -> URLRequest? {
        var charactersDetailURL: String
        let apiKeyValue: String = Bundle.main.infoDictionary?[API_KEY] as! String
        let hashValue: String = Bundle.main.infoDictionary?[HASH_VALUE] as! String
        let tsValue: String = Bundle.main.infoDictionary?[TS_VALUE] as! String
        let charactersURL: String = Bundle.main.infoDictionary?[CHARACTERS_URL] as! String
        charactersDetailURL = charactersURL.replacingOccurrences(of: DOUBLE_SLASH, with: EMPTY_STRING)
        if let idValue = id {
            charactersDetailURL = charactersDetailURL + SINGLE_SLASH + String(idValue)
        }
        var urlComponents = URLComponents(string: charactersDetailURL)
        let queryItems = [URLQueryItem(name: TS, value: tsValue),URLQueryItem(name: APIKEY, value: apiKeyValue),URLQueryItem(name: HASH, value: hashValue)]
        urlComponents?.queryItems = queryItems
        guard let url = urlComponents?.url else { return nil }
        var request = URLRequest(url: url)
        request.setValue(HEADER_VALUE, forHTTPHeaderField: HEADER_FIELD)
        request.httpMethod = GET
        return request
    }
    
    func getDataFromMarvelAPI(forID id: Int?, completion: @escaping (_ results: [Results]?,_ errors: Error?) -> Void) {
        guard let request = self.formingUrlRequest(withID: id) else { return }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
#if DEBUG
                print(error ?? UNKNOWN_ERROR)
#endif
                return
            }
            do {
                let characters = try JSONDecoder().decode(CharactersModel.self, from: data)
                let results = characters.data?.results
                completion(results, nil)
            } catch let error {
                #if DEBUG
                print(error)
                #endif
                completion(nil, error)
                return
            }
        }
        task.resume()
    }
}
