//
//  NoScrollerScrollView.swift
//  ScrollView
//
//  Created by LiuY on 2018/12/2.
//  Copyright © 2018 DeveloperLY. All rights reserved.
//

import Cocoa

// 滚动条的显示控制
class NoScrollerScrollView: NSScrollView {
    override func tile() {
        super.tile()
        var hFrame = self.horizontalScroller?.frame
        hFrame?.size.height = 0
        if let hFrame = hFrame {
            self.horizontalScroller?.frame = hFrame
        }
        
        var vFrame = self.verticalScroller?.frame
        vFrame?.size.width = 0
        if let vFrame = vFrame {
            self.verticalScroller?.frame = vFrame
        }
    }


    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
