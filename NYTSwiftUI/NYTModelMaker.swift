//
//  NYTModelMaker.swift
//  NYTSwiftUI
//
//  Created by Aftab Ahmed on 8/5/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import Foundation
import Combine

class NYTModelMaker: ObservableObject {
    
    @Published var allNewsData: [NewsIDModel] = []
    
//    init() {
//        fetch()
//    }
    
    func fetch() {
        APIManager.shared.mostviewedResponse(completion: {
            (responseData, error) in
            if error == nil {
                self.parseNewsData(response: responseData!)
            }
        })
    }
    
    func parseNewsData(response: Data) {
        do {
            let newsResponseModel = try JSONDecoder().decode(NewsResponseModel.self, from: response)
            DispatchQueue.main.async {
                self.allNewsData = newsResponseModel.makeIdentifiableNewsModel(allNews: newsResponseModel.newsData!)
            }
        } catch let parsingError {
            print("Error : \(parsingError)")
        }
    }
}
