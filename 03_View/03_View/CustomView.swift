//
//  CustomView.swift
//  03_View
//
//  Created by LiuY on 2018/11/24.
//  Copyright © 2018 DeveloperLY. All rights reserved.
//

import Cocoa

class CustomView: NSView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        
        self.configLayer()
    }
    
    // 坐标系原点从左上角开始
    override var isFlipped: Bool {
        get {
            return true
        }
    }
    
    // MARK: - Event
    override func mouseDown(with event: NSEvent) {
        // 坐标转换
        let point = self.convert(event.locationInWindow, to: nil)
        
        print("Window point: \(event.locationInWindow)")
        print("View point: \(point)")
    }
    
    // MARK: - Draw
    override func draw(_ dirtyRect: NSRect) { // 在 drawRect 方法中实现绘制
        super.draw(dirtyRect)
        // 视图绘制
        NSColor.blue.setFill()
        let frame = self.bounds
        let path = NSBezierPath()
        path.appendRoundedRect(frame, xRadius: 20, yRadius: 20)
        path.fill()
    }
    
    // 在 drawRect 方法之外实现绘制
    func drawViewShape() {
        let text: NSString = "RoundedRect"
        let font = NSFont(name: "Palatino-Roman", size: 12)
        let attrs = [NSAttributedString.Key.font: font!,  NSAttributedString.Key.foregroundColor: NSColor.blue,  NSAttributedString.Key.backgroundColor: NSColor.red]
        let loaction = NSPoint(x: 50, y: 50)
        text.draw(at: loaction, withAttributes: attrs)
    }
    
    // MARK: - Public
    func configLayer() { // 视图的 layer 属性
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.red.cgColor
        self.layer?.borderWidth = 2
        self.layer?.cornerRadius = 10
    }
    
    // 视图截屏
    func saveSelfAsImage() {
        let image = NSImage(data: self.dataWithPDF(inside: self.bounds))
        let imageData = image?.tiffRepresentation
        
        let fileManager = FileManager.default
        
        // 写死路径
        let path = "/Users/DeveloperLY/Documents/myCapture.png"
        fileManager.createFile(atPath: path, contents: imageData, attributes: nil)
        
        // 定位文件路径
        let fileURL = URL(fileURLWithPath: path)
        NSWorkspace.shared.activateFileViewerSelecting([fileURL])
    }
    
    // 带滚动条
    func saveScrollViewAsImage() {
        let pdfData = self.dataWithPDF(inside: self.bounds)
        let imageRep = NSPDFImageRep(data: pdfData)!
        let count = imageRep.pageCount
        for i in 0..<count {
            imageRep.currentPage = i
            let tempImage = NSImage()
            tempImage.addRepresentation(imageRep)
            let rep  = NSBitmapImageRep(data: tempImage.tiffRepresentation!)
            let imageData = rep?.representation(using: .png, properties: [:])
            let fileManager = FileManager.default
            // 写死的文件路径
            let path = "/Users/DeveloperLY/Documents/myCapture.png"
            fileManager.createFile(atPath: path, contents: imageData, attributes: nil)
            
            // 定位文件路径
            let fileURL = URL(fileURLWithPath: path)
            NSWorkspace.shared.activateFileViewerSelecting([fileURL])
        }
    }
}
