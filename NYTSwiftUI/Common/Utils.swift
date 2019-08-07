//
//  Utils.swift
//  NYTimesSwiftUI
//
//  Created by Aftab Ahmed on 7/5/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import Foundation

class Utils {
    
    static let shared: Utils = Utils()
    
    func NYTimesImagesFolerURL() -> URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let imagesFolder = documentDirectory.appendingPathComponent("NYTimesImages")
        return imagesFolder
    }
    
    func createImagesFolder() {
        let imagesFolder = Utils.shared.NYTimesImagesFolerURL()
        if !FileManager.default.fileExists(atPath: imagesFolder.path) {
            do {
                try FileManager.default.createDirectory(at: imagesFolder, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Unable to create a folder")
                return
            }
        } else {
            try? FileManager.default.removeItem(atPath: imagesFolder.path)
            createImagesFolder()
        }
    }
}
