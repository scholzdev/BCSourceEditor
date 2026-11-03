//
//  NSFont+LineHeight.swift
//  BCSourceEditor
//
//  Created by Lukas Pistrol on 28.05.22.
//

import AppKit
import BCTextView

public extension NSFont {
    /// The default line height of the font.
    var lineHeight: Double {
        NSLayoutManager().defaultLineHeight(for: self)
    }
}
