//
//  BookStoreMgr.h
//  YuemengSdkDemo
//
//  Created by wangdh on 2019/5/7.
//  Copyright © 2019 wangdh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UIViewController;


@interface BookStoreMgr : NSObject

-(void) openBookStore;
-(BOOL) handleOpenURL:(NSURL *)url;
-(void) openBookStoreByUrl;
-(void) openCommonWebviewByUrl:(NSString *)url;
-(void) openTaskController;
-(UIViewController *) getBookStoreWebviewController;

-(NSString *) getWebviewUrl;
-(NSString *) getSDKImei;

@end

NS_ASSUME_NONNULL_END
