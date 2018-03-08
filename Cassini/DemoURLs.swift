//
//  DemoURLs.swift
//  Cassini
//
//  Created by Chen Weiru on 06/03/2018.
//  Copyright © 2018 ChenWeiru. All rights reserved.
//

import Foundation

struct DemoURLs {
    static let stanford = Bundle.main.url(forResource:"oval", withExtension:".jpg")
    
    static var NASA:Dictionary<String, URL> = {
        let NSURLStrings = [
            "Cassini" : "https://upload.wikimedia.org/wikipedia/commons/b/b2/Cassini_Saturn_Orbit_Insertion.jpg",
            "Earth" : "https://www.evl.uic.edu/pape/data/Earth/2048/BigEarth.jpg",
            "Saturn" : "https://upload.wikimedia.org/wikipedia/commons/c/c7/Saturn_during_Equinox.jpg"
        ]
        
        var urls = Dictionary<String, URL>()
        for (key, value) in NSURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
