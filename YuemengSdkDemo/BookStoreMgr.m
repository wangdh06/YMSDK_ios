//
//  BookStoreMgr.m
//  YuemengSdkDemo
//
//  Created by wangdh on 2019/5/7.
//  Copyright © 2019 wangdh. All rights reserved.
//

#import "BookStoreMgr.h"
#import "YuemengAdSdkCenter.h"

@interface BookStoreMgr () <BookStoreDelegate>

@property (nonatomic, strong) YuemengAdSdkCenter *adCenter;

@property (nonatomic, strong) NSString *thirdUserId;

@end



@implementation BookStoreMgr

-(id) init
{
    self = [super init];
    if (self){
        
        _thirdUserId = @"test+abc123dfdsk+123";
        _adCenter = [[YuemengAdSdkCenter alloc] initYuemengSdkWithBookStoreId:8000 delegate:self];
        
        //设置navigation title 颜色
        //[_adCenter setWebiewNavigationbarTitleColor:[UIColor blueColor]];
        
        //设置navigation bar 背景颜色
        //[_adCenter setWebiewNavigationbarBgColor:[UIColor colorWithRed:0.2745 green:0.5921 blue:0.9294 alpha:1]];
        
        //[_adCenter setWebiewNavigationbarTitleColor:[UIColor redColor]];
        //0x4697ED
        //navigation bar上添加自定义view
//        UIView *customHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 80)];
//
//        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 90, 30)];
//        [btn setTitle:@"ceshi" forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(onTestBtn) forControlEvents:UIControlEventTouchUpInside];
//        [customHeaderView addSubview:btn];
//
//        customHeaderView.backgroundColor = [UIColor blueColor];
//        [_adCenter setCustomHeaderView:customHeaderView];
        
    }
    
    return self;
}

-(void) onTestBtn
{
    
}

-(void) dealloc
{
    _adCenter = nil;
}

-(void) openBookStore
{
    [_adCenter presentBookStore:_thirdUserId];
}

-(void) openBookStoreByUrl
{
    //[_adCenter presentBookStoreByUrl:@"http://api.alliread.com/test/index.html" :_thirdUserId];
    //[_adCenter presentBookStoreByUrl:@"http://ceshi.weebook.cn/app/demo?bookStore=3&channel=test_test&timer=1" :_thirdUserId];
    //[_adCenter presentBookStoreByUrl:@"http://api.alliread.com/test/localstorage.html" :_thirdUserId];
    
    //[_adCenter presentBookStoreByUrl:@"http://boardy.huanqiu.com" :_thirdUserId];
    
    //[_adCenter presentCommonWebviewController:@"http://ceshi.weebook.cn/test/?timer=1&tgclose=1"];
    [_adCenter presentBookStoreByUrl:@"http://huif.weebook.cn/app/reader/728153?bookStore=3&channel=ces1&timer=1" :_thirdUserId];
}

-(void) openCommonWebviewByUrl:(NSString *)url
{
    [_adCenter presentCommonWebviewController:url];
}

-(void) openTaskController
{
    [_adCenter presentTaskController:_thirdUserId];
}

-(BOOL) handleOpenURL:(NSURL *)url
{
    return [_adCenter handleOpenURL:url :_thirdUserId];
}

-(UIViewController *) getBookStoreWebviewController
{
    _thirdUserId = [NSString stringWithFormat:@"test+abc123dfdsk+123%lld", (long)[[NSDate date] timeIntervalSince1970]];// @"test+abc123dfdsk+123"+[[NSDate date] timeIntervalSince1970];
//    [_adCenter setThirdUserId:@"111222333"];
//    return [_adCenter getBookStoreWebviewController:nil];
    return [_adCenter getBookStoreWebviewController:_thirdUserId];
}

-(NSString *)getWebviewUrl
{
    return [_adCenter getCurWebviewUrl];
}

-(NSString *) getSDKImei
{
    return [_adCenter getSDKImei];
}

#pragma --mark BookStoreDelegate
-(void) notifySVIPUser
{
    //初始化后或者用户使用过程中购买了svip，通过这个接口通知app
    
}

-(void) yuemengSdkDidOpen
{

}

-(void) yuemengSdkDidClose
{
    
}

@end
