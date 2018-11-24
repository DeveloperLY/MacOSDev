//
//  LoginWindowController.swift
//  WindowLoginEffect
//
//  Created by LiuY on 2018/11/24.
//  Copyright © 2018 DeveloperLY. All rights reserved.
//

import Cocoa

class LoginWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    func windowWillClose(_ notification: Notification) {
        self.contentViewController = nil;
        self.window = nil
    }
    
    
    
}
