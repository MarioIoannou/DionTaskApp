//
//  Item.swift
//  DionTask
//
//  Created by Marios Ioannou on 16/3/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
