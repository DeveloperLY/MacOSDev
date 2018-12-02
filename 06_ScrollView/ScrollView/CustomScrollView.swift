//
//  CustomScrollView.swift
//  ScrollView
//
//  Created by LiuY on 2018/12/2.
//  Copyright © 2018 DeveloperLY. All rights reserved.
//

import Cocoa

class CustomScrollView: NSScrollView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override var isFlipped: Bool {
        get {
            return true
        }
    }
}
