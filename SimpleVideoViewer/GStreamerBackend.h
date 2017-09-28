//
//  GStreamerBackend.h
//  SimpleVideoViewer
//
//  Created by tamura on 2017/09/28.
//  Copyright © 2017年 kiroru-inc.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "GStreamerBackendDelegate.h"

@interface GStreamerBackend : NSObject

/* Initialization method. Pass the delegate that will take care of the UI.
 * This delegate must implement the GStreamerBackendDelegate protocol.
 * Pass also the UIView object that will hold the video window. */
-(id) init:(id) uiDelegate videoView:(NSView*) video_view;

/* Set the pipeline to PLAYING */
-(void) play;

/* Set the pipeline to PAUSED */
-(void) pause;

@end
