//
//  NewsResponseModel.swift
//  NYTMostPopular
//
//  Created by Aftab Ahmed on 6/20/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import SwiftUI

struct NewsResponseModel: Codable {
    
    var newsData: [NewsModel]?
    
    enum CodingKeys: String, CodingKey {
        case newsData = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.newsData = try container.decodeIfPresent([NewsModel].self, forKey: .newsData)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.newsData, forKey: .newsData)
    }
    
    func makeIdentifiableNewsModel(allNews: [NewsModel]) -> [NewsIDModel]{
        var retNews:[NewsIDModel] = []
        var id = 0
        for news in allNews {
            retNews.append(NewsIDModel(id: id, newsModel: news))
            id += 1
        }
        return retNews
    }
}



