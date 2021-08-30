//
//  File.swift
//  testAppForMDH
//
//  Created by Жеребцов Данил on 29.08.2021.
//

import Foundation
import SwiftyJSON

struct Photo {
    var smallPhoto: String
    
    init?(json: JSON) {
        guard let unwrPhoto = json["urls"]["small"].string else {return nil}
        
        self.smallPhoto = unwrPhoto
    }
}

class Model {
    var photos = [Photo]()
}
