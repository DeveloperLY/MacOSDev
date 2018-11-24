//
//  LYView.swift
//  ResponderChain
//
//  Created by LiuY on 2018/11/24.
//  Copyright © 2018 DeveloperLY. All rights reserved.
//

import Cocoa

class LYView: NSView {
    
    override func scrollWheel(with event: NSEvent) {
        print("scrollWheel \(self)")
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
