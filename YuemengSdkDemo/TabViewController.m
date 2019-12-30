//
//  TabViewController.m
//  YuemengSdkDemo_GDT
//
//  Created by wangdh on 2019/10/15.
//  Copyright © 2019 wangdh. All rights reserved.
//

#import "TabViewController.h"
#import "BookStoreMgr.h"

@interface TabViewController ()

@property (nonatomic, weak) BookStoreMgr *bookStoreMgr;

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIViewController *subController1 = [_bookStoreMgr getBookStoreWebviewController];
    [self addChildViewController:subController1];
    
    subController1.view.frame = CGRectMake(0, 0+30, self.view.bounds.size.width, self.view.bounds.size.height-30);
    [self.view addSubview:subController1.view];
    // Do any additional setup after loading the view.
}

-(void) setBookStoreMgr:(BookStoreMgr *)bookStoreMgr
{
    _bookStoreMgr = bookStoreMgr;
}

@end
