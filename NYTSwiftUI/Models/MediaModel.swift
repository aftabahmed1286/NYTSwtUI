//
//  MediaModel.swift
//  NYTMostPopular
//
//  Created by Aftab Ahmed on 4/3/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import Foundation

struct MediaModel: Codable {
    
    var type: String?
    var subtype: String?
    var caption: String?
    var copyright: String?
    var mediaMetadata: [MediaMetadataModel]?
    
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case mediaMetadata = "media-metadata"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.subtype = try container.decodeIfPresent(String.self, forKey: .subtype)
        self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.mediaMetadata = try container.decodeIfPresent([MediaMetadataModel].self, forKey: .mediaMetadata)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.subtype, forKey: .subtype)
        try container.encode(self.caption, forKey: .caption)
        try container.encode(self.copyright, forKey: .copyright)
        try container.encode(self.mediaMetadata, forKey: .mediaMetadata)
    }
}
