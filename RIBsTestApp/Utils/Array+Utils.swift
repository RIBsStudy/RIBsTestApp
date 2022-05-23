//
//  Array+Utils.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/18.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
