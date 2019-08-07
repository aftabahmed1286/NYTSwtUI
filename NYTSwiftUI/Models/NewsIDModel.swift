//
//  NewsIDModel.swift
//  NYTimesSwiftUI
//
//  Created by Aftab Ahmed on 7/5/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import Foundation
import SwiftUI

struct NewsIDModel: Identifiable, Codable {
    var id: Int
    var newsModel: NewsModel
    
    func webUrl() -> URL {
        guard let retURL = self.newsModel.url  else {
            return URL(string: "")!
        }
        return retURL
    }
    
    func thumbNailImageURL() -> URL {
        guard let retURL = self.newsModel.thumbnailImageURL else {
            return URL(string: "")!
        }
        return retURL
    }
    
    func thumbNailImageURLString() -> String {
        guard let retURL = self.newsModel.thumbnailImageURL else {
            return ""
        }
        return retURL.absoluteString
    }
}
