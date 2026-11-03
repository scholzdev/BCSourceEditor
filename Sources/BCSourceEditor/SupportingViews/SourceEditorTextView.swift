//
//  SourceEditorTextView.swift
//  BCSourceEditor
//
//  Created by Khan Winter on 7/23/25.
//

import AppKit
import BCTextView

final class SourceEditorTextView: TextView {
    var additionalCursorRects: [(NSRect, NSCursor)] = []

    override func resetCursorRects() {
        discardCursorRects()
        super.resetCursorRects()
        additionalCursorRects.forEach { (rect, cursor) in
            addCursorRect(rect, cursor: cursor)
        }
    }
}
