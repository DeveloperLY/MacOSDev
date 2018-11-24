//
//  AppDelegate.swift
//  03_View
//
//  Created by LiuY on 2018/11/24.
//  Copyright © 2018 DeveloperLY. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var customView: CustomView!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let button = NSButton()
        
        button.frame = NSRect(x: 2, y: 2, width: 80, height: 24)
        button.title = "Register"
        button.bezelStyle = .rounded
        self.customView.addSubview(button)
        self.customView.postsFrameChangedNotifications = true
        
        self.registerNotification()
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.recieveFrameChangeNotification(_:)), name: NSView.frameDidChangeNotification, object: nil)
    }

    @objc func recieveFrameChangeNotification(_ notification: Notification) {
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
    @IBAction func captureAction(_ sender: NSButton) {
//        self.customView.saveSelfAsImage()
        self.customView.saveScrollViewAsImage()
    }
    

}

