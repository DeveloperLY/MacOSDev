//
//  WindowBorderless.swift
//  WindowLoginEffect
//
//  Created by LiuY on 2018/11/25.
//  Copyright © 2018 DeveloperLY. All rights reserved.
//

import Cocoa

class WindowBorderless: NSWindow {
    override var canBecomeKey: Bool {
        return true
    }
    
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        
        self.isMovableByWindowBackground = true
    }
}
