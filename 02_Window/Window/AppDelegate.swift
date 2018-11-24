//
//  AppDelegate.swift
//  Window
//
//  Created by LiuY on 2018/11/23.
//  Copyright © 2018 DeveloperLY. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var modalWindow: NSWindow!
    
    var sessionCode: NSApplication.ModalSession?
    
    var myWindow: NSWindow!
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        // 监听窗口关闭的通知
        NotificationCenter.default.addObserver(self, selector: #selector(self.windowClose(_:)), name: NSWindow.willCloseNotification, object: nil)
        
        // 设置窗口标题图片
        self.setWindowTitleImage()
        
        // 设置窗口背景色
        self.setWindowBackgroundColor()
        
        // 标题栏上添加按钮
        self.addButtonToTitleBar()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        
        // 移除通知监听
        NotificationCenter.default.removeObserver(self)
    }
    
    // 关闭最后一个窗口时，退出App
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    
    // MARK: - Event
    
    @IBAction func showModalWindow(_ sender: NSButton) {
        NSApplication.shared.runModal(for: self.modalWindow)
        self.modalWindow.center()
    }
    
    // 启动模态回话窗口
    @IBAction func showSessionsWindow(_ sender: NSButton) {
        sessionCode = NSApplication.shared.beginModalSession(for: self.modalWindow)
    }
    
    
    @IBAction func createWindowAction(_ sender: NSButton) {
        self.createWindow()
    }
    
    // MARK: - Private Methods
    func createWindow() -> Void {
        let frame = CGRect(x: 0, y: 0, width: 400, height: 280)
        let style: NSWindow.StyleMask = [NSWindow.StyleMask.titled, NSWindow.StyleMask.closable, NSWindow.StyleMask.resizable]
        // 创建Window
        myWindow = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
        myWindow.title = "New Create Window"
        // 显示Window
        myWindow.makeKeyAndOrderFront(self)
        // 居中显示
        myWindow.center()
    }
    
    func setWindowTitleImage() -> Void {
        self.window.representedURL = URL(string: "WindowTitle")
        self.window.title = "My Window"
        let image = NSImage(named: NSImage.Name("AppIcon.png"))
        self.window.standardWindowButton(.documentIconButton)?.image = image
        
    }
    
    func setWindowBackgroundColor() -> Void {
        self.window.backgroundColor = NSColor.orange
    }
    
    func addButtonToTitleBar() -> Void {
        let titleView = self.window.standardWindowButton(.closeButton)?.superview
        let registerButton = NSButton()
        let x = (self.window.contentView?.frame.size.width)! - 100
        registerButton.frame = CGRect(x: x, y: -3, width: 80, height: 25)
        registerButton.title = "Register"
        registerButton.bezelStyle = .rounded
        titleView?.addSubview(registerButton)
    }
    
    // MARK: - Notification
    @objc func windowClose(_ aNotification: Notification) -> Void {
        
        if let sessionCode = sessionCode { // 结束回话状态
            NSApplication.shared.endModalSession(sessionCode)
            self.sessionCode = nil
        }
        
        if let window = aNotification.object as? NSWindow {
            if window == self.modalWindow { // 停止模态窗口
                NSApplication.shared.stopModal()
            }
            
            if window == self.window { // 关闭当前窗口时，退出程序
                NSApp.terminate(self)
            }
        }

    }
}

