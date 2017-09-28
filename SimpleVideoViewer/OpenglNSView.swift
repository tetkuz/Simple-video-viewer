//
//  OpenGLNSView.swift
//  SimpleVideoViewer
//
//  Created by tamura on 2017/09/28.
//  Copyright © 2017年 kiroru-inc.jp. All rights reserved.
//

import Foundation
import OpenGL
import Cocoa

class OpenglNSView: NSView {
    override func makeBackingLayer() -> CALayer {
        return CAOpenGLLayer();
    }
}
