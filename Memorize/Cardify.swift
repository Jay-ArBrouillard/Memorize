//
//  Cardify.swift
//  Memorize
//
//  Created by Jay-Ar Brouillard on 9/17/20.
//  Copyright © 2020 Jay-Ar Brouillard. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    let RECTANGLE_CORNER_RADIUS: CGFloat = 10.0
    let LINE_WIDTH: CGFloat = 3.0
    
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: RECTANGLE_CORNER_RADIUS).fill(Color.white)
                RoundedRectangle(cornerRadius: RECTANGLE_CORNER_RADIUS).stroke(lineWidth: LINE_WIDTH)
                content
            } else {
                RoundedRectangle(cornerRadius: RECTANGLE_CORNER_RADIUS)
                    .fill()
                
            }
        }
    }

}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
