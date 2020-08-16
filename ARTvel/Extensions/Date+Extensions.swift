//
//  Date+Extensions.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/15/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

extension Date  {
    public func dateString(_ format: String = "EEEE, MMM d, h:mm a") -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
