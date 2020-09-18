//
//  ArrayIdentifiable.swift
//  Memorize
//
//  Created by Jay-Ar Brouillard on 9/13/20.
//  Copyright © 2020 Jay-Ar Brouillard. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil //Shouldn't get here
    }
}
