//
//  AppDelegate.swift
//  WindowLoginEffect
//
//  Created by LiuY on 2018/11/24.
//  Copyright © 2018 DeveloperLY. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var windowController: MainWindowController? = {
        let storyBoard = NSStoryboard.init(name: NSStoryboard.Name("Main"), bundle: nil)
        let mainWindowController = storyBoard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("MainWindowController")) as? MainWindowController
        return mainWindowController
    } ()
    
    lazy var loginWindowController: LoginWindowController? = {
        let storyBoard = NSStoryboard.init(name: NSStoryboard.Name("Main"), bundle: nil)
        let loginWindowController = storyBoard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("LoginWindowController")) as? LoginWindowController
        return loginWindowController
    } ()


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        loginWindowController?.showWindow(self)
        
        self.registerNotification()
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.onLoginOK(_:)), name: Notification.Name.loginOK, object: nil)
    }
    
    @objc func onLoginOK(_ notification: Notification) {
        windowController?.showWindow(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        windowController = nil
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

