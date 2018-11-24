//
//  LYWindow.swift
//  ResponderChain
//
//  Created by LiuY on 2018/11/24.
//  Copyright © 2018 DeveloperLY. All rights reserved.
//

import Cocoa

class LYWindow: NSWindow {
    override func scrollWheel(with event: NSEvent) {
        print("scrollWheel \(self)")
    }
}
