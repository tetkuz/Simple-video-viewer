//
//  GStreamerBackendDelegate.h
//  SimpleVideoViewer
//
//  Created by tamura on 2017/09/28.
//  Copyright © 2017年 kiroru-inc.jp. All rights reserved.
//

#ifndef GStreamerBackendDelegate_h
#define GStreamerBackendDelegate_h

#import <Foundation/Foundation.h>

@protocol GStreamerBackendDelegate <NSObject>

@optional
/* Called when the GStreamer backend has finished initializing
 * and is ready to accept orders. */
-(void) gstreamerInitialized;

/* Called when the GStreamer backend wants to output some message
 * to the screen. */
-(void) gstreamerSetUIMessage:(NSString *)message;

@end

#endif /* GStreamerBackendDelegate_h */
