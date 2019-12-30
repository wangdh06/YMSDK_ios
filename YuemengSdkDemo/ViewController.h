//
//  ViewController.h
//  BroadcastSdkDemo
//
//  Created by wangdh on 2016/11/11.
//  Copyright © 2016年 wangdh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BookStoreMgr;

@interface ViewController : UIViewController

-(void) setBookStoreMgr:(BookStoreMgr *)bookStoreMgr;
-(BOOL) handleOpenURL:(NSURL *)url;

@end

