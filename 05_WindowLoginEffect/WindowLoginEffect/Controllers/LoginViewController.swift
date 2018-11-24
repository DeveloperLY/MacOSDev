//
//  LoginViewController.swift
//  WindowLoginEffect
//
//  Created by LiuY on 2018/11/24.
//  Copyright © 2018 DeveloperLY. All rights reserved.
//

import Cocoa

class LoginViewController: NSViewController {
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.red.cgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    // MARK: - Event
    @IBAction func loginButtonAction(_ sender: NSButton) {
        // TODO 向服务器登录验证
        
        // 关闭窗口
        self.view.window?.close()
        
        // 登录完成发送通知
        NotificationCenter.default.post(name: Notification.Name.loginOK, object: nil)
    }
    
    @IBAction func closeButtonAction(_ sender: NSButton) {
        self.view.window?.close()
    }
    
}

extension Notification.Name {
    // 定义消息通知名称
    static let loginOK = Notification.Name("loginOk")
}
