//
//  MediaMetadataModel.swift
//  NYTMostPopular
//
//  Created by Aftab Ahmed on 4/2/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import Foundation
import UIKit

struct MediaMetadataModel: Codable {
    
    var url: URL? 
    var format: String?
    var height: Double?
    var width: Double?
    
    enum CodingKeys: String, CodingKey {
        case format,
        height,
        width,
        url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        format = try container.decodeIfPresent(String.self, forKey: .format)
        height = try container.decodeIfPresent(Double.self, forKey: .height)
        width = try container.decodeIfPresent(Double.self, forKey: .width)
        url = try? container.decodeIfPresent(URL.self, forKey: .url)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(format, forKey: .format)
        try container.encode(height, forKey: .height)
        try container.encode(width, forKey: .width)
        try container.encode(url, forKey: .url)
        
        
    }
}
