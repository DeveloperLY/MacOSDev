//
//  DisableVerticalScrollView.swift
//  ScrollView
//
//  Created by LiuY on 2018/12/2.
//  Copyright © 2018 DeveloperLY. All rights reserved.
//

import Cocoa

class DisableVerticalScrollView: NSScrollView {
    
    override func scrollWheel(with event: NSEvent) {
        let f = abs(event.deltaY)
        if event.deltaX == 0.0 && f >= 0.01  {
            return
        }
        
        if event.deltaX == 0.0 && f == 0.0  {
            return
        } else {
            super.scrollWheel(with: event)
        }
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
