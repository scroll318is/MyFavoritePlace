//
//  Asset.swift
//  MyFavoritePlace
//
//  Created by Stoyan Yordanov Kostov on 10/28/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import Foundation

class Asset {
    private var _imageName:String!
    private var _description:String!
    private var _index:Int!
    
    var imageName: String {
        return _imageName
    }
    
    var description: String {
        return _description
    }
    
    var index: Int {
        return _index
    }
    
    init(imageName:String, description: String, index:Int) {
        _imageName = imageName
        _description = description
        _index = index
    }
    
}