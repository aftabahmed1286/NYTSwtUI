//
//  ImageWidgetView.swift
//  NYTSwiftUI
//
//  Created by Aftab Ahmed on 8/6/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import Foundation
import SwiftUI


let imageCache = NSCache<AnyObject, AnyObject>()

struct ImageWidgetView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageURL: String) {
        imageLoader = ImageLoader(imageURL: imageURL)
    }
    
    var body: some View {
        Image(uiImage: (imageLoader.imageData.count == 0) ?
            UIImage(named: "placeholderImage")! :
            UIImage(data: imageLoader.imageData)!)
    }
}

class ImageLoader: ObservableObject {
    
    @Published var imageData = Data()
    
    init(imageURL: String) {
        //Check Cache for the image
        if let imData = cachedImage(forKey: imageURL) {
            self.imageData = imData
            return
        }
        //Fetch image Data
        NetworkLayer.shared.requestData(urlString: imageURL, method: .GET, completionHandler: {(data, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.imageData = data
                self.cacheImage(data: data, key: imageURL)
                print("\(imageURL) cached")
            }
        })
    }
    
    func cacheImage(data: Data, key: String) {
        imageCache.setObject(data as AnyObject, forKey:key as AnyObject)
    }
    
    func cachedImage(forKey: String) -> Data? {
        if let data = imageCache.object(forKey: forKey as AnyObject) as? Data {
            return data
        }
        return nil
    }
}

