//
//  APIManager.swift
//  NYTimesSwiftUI
//
//  Created by Aftab Ahmed on 7/5/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import Foundation

class APIManager {
    
    /**********************************************
     * CONSTANTS
     **********************************************/
    
    static let shared: APIManager = APIManager()
    
    let baseURL = "https://api.nytimes.com/svc/mostpopular"
    
    let apiKey = "EafVnFG3bA3MfHJ3AThGxMrsAyaUzPLV"
    
    /**********************************************
     * END POINTS
     **********************************************/
    
    let mostViewedAllSection1FarJSONEndpoint = "/v2/mostviewed/all-sections/1.json"
    
    /**********************************************
     * API REQUEST RESPONSES
     **********************************************/
    
    func mostviewedResponse(completion: @escaping (
        _ data: Data?,
        _ error: Error?) -> Void
        ) {
        let urlString = APIManager.shared.baseURL +
            APIManager.shared.mostViewedAllSection1FarJSONEndpoint +
            "?api-key=" +
            APIManager.shared.apiKey
        
        NetworkLayer.shared.requestData(urlString: urlString,
                                        method: .GET,
                                        completionHandler: { (data, error) in
                                            guard let responseData = data,
                                                error == nil  else {
                                                    print(error?.localizedDescription ?? "Response Error")
                                                    completion(nil, error)
                                                    return
                                                    
                                            }
                                            completion(responseData, nil)
        })
    }
    
    func downloadImage(url: URL) {
        NetworkLayer.shared.requestDownload(urlString: url.absoluteString,
                                            method: .GET,
                                            completionHandler: {(url, urlResponse ,error) in
                                                
                                                let imagesFolder = Utils.shared.NYTimesImagesFolerURL()
                                                
                                                guard let localURL = url else {
                                                    print("Download Error: ", error ?? "")
                                                    return
                                                }
                                                
                                                let destPath = imagesFolder.appendingPathComponent(urlResponse?.suggestedFilename ?? localURL.lastPathComponent)
                                                
                                                do {
                                                    try FileManager.default.moveItem(at: localURL, to: destPath)
                                                } catch {
                                                    print(error)
                                                }
                                                
        })
    }
    
}
