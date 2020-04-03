//
//  AllRequest.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation

class AllRequest: BaseAPIRequest<AllResponse> {
    override var endPoint: EndPoints {
        return .all
    }
}
