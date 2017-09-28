//
//  ViewController.swift
//  SimpleVideoViewer
//
//  Created by tamura on 2017/09/28.
//  Copyright © 2017年 kiroru-inc.jp. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, GStreamerBackendDelegate {

    @IBOutlet weak var video_container_view: NSView!
    @IBOutlet weak var video_view: NSView!
    @IBOutlet weak var video_view_width_constraint: NSLayoutConstraint!
    @IBOutlet weak var video_view_height_constraint: NSLayoutConstraint!

    @IBOutlet weak var play_button: NSButton!
    @IBOutlet weak var pause_button: NSButton!
    @IBOutlet weak var message_label: NSTextField!

    let media_width: CGFloat = 320
    let media_height: CGFloat = 240
    var gst_backend: GStreamerBackend? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        play_button.isEnabled = false
        pause_button.isEnabled = false

        gst_backend = GStreamerBackend.init(self, videoView: video_view)
    }

    @IBAction func play(_ sender: Any) {
        gst_backend?.play()
    }

    @IBAction func pause(_ sender: Any) {
        gst_backend?.pause()
    }

    override func viewDidLayout() {
        let view_width: CGFloat = video_container_view.bounds.size.width;
        let view_height: CGFloat = video_container_view.bounds.size.height;
        
        let correct_height = view_width * media_height / media_width;
        let correct_width = view_height * media_width / media_height;
        
        if (correct_height < view_height) {
            video_view_height_constraint.constant = correct_height;
            video_view_width_constraint.constant = view_width;
        } else {
            video_view_width_constraint.constant = correct_width;
            video_view_height_constraint.constant = view_height;
        }
    }

    func gstreamerInitialized() {
        DispatchQueue.main.async {
            self.play_button.isEnabled = true
            self.pause_button.isEnabled = true
            self.message_label.stringValue = "Ready"
        }
    }

    func gstreamerSetUIMessage(_ message: String!) {
        DispatchQueue.main.async {
            self.message_label.stringValue = message
        }
    }
}

