//
//  BCSourceEditorExampleApp.swift
//  BCSourceEditorExample
//
//  Created by Khan Winter on 2/24/24.
//

import SwiftUI

@main
struct BCSourceEditorExampleApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: BCSourceEditorExampleDocument()) { file in
            ContentView(document: file.$document, fileURL: file.fileURL)
        }
        .windowToolbarStyle(.unifiedCompact)
    }
}
