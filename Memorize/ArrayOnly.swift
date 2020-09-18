//
//  ArrayOnly.swift
//  Memorize
//
//  Created by Jay-Ar Brouillard on 9/13/20.
//  Copyright © 2020 Jay-Ar Brouillard. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
