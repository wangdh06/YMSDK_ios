//
//  ViewController.m
//  BroadcastSdkDemo
//
//  Created by wangdh on 2016/11/11.
//  Copyright © 2016年 wangdh. All rights reserved.
//

#import "ViewController.h"
#import "BookStoreMgr.h"
#import "TabViewController.h"
#import <AdSupport/ASIdentifierManager.h>
#import <WebKit/WebKit.h>

@interface ViewController ()

@property (nonatomic, weak) BookStoreMgr *bookStoreMgr;

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIControl *bgControl = [[UIControl alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:bgControl];
    [bgControl addTarget:self action:@selector(onClickBgControl) forControlEvents:UIControlEventTouchUpInside];
    bgControl.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 100, 30)];
    _textField.placeholder = @"请输入网站地址";
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [bgControl addSubview:_textField];
    _textField.center = CGPointMake((self.view.bounds.size.width - 80)/2, 50);
    _textField.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin;
    
    UIButton *openBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 36)];
    [openBtn addTarget:self action:@selector(onClickOpenUrlBtn) forControlEvents:UIControlEventTouchUpInside];
    [openBtn setTitle:@"进入" forState:UIControlStateNormal];
    [bgControl addSubview:openBtn];
    openBtn.center = CGPointMake(self.view.bounds.size.width-40, 50);
    openBtn.backgroundColor = [UIColor grayColor];
    openBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 260, 36)];
    title.text = @"小说SDK合作演示";
    title.textAlignment = NSTextAlignmentCenter;
    [bgControl addSubview:title];
    title.center = CGPointMake(self.view.bounds.size.width/2, 100);
    title.backgroundColor = [UIColor clearColor];
    title.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *bookStoreBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 260, 36)];
    [bookStoreBtn addTarget:self action:@selector(onClickBookStoreBtn) forControlEvents:UIControlEventTouchUpInside];
    [bookStoreBtn setTitle:@"打开进入小说书城" forState:UIControlStateNormal];
    [bgControl addSubview:bookStoreBtn];
    bookStoreBtn.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2 - 36 - 160);
    bookStoreBtn.backgroundColor = [UIColor grayColor];
    bookStoreBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    UIButton *urlBookStoreBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 260, 36)];
    [urlBookStoreBtn addTarget:self action:@selector(onClickUrlBookStoreBtn) forControlEvents:UIControlEventTouchUpInside];
    [urlBookStoreBtn setTitle:@"打开单本小说" forState:UIControlStateNormal];
    [bgControl addSubview:urlBookStoreBtn];
    urlBookStoreBtn.center = CGPointMake(self.view.bounds.size.width/2, bookStoreBtn.center.y + 80);
    urlBookStoreBtn.backgroundColor = [UIColor grayColor];
    urlBookStoreBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    UIButton *webBookStoreBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 260, 36)];
    [webBookStoreBtn addTarget:self action:@selector(onClickWebBookStoreBtn) forControlEvents:UIControlEventTouchUpInside];
    [webBookStoreBtn setTitle:@"tab栏嵌入小说书城" forState:UIControlStateNormal];
    [bgControl addSubview:webBookStoreBtn];
    webBookStoreBtn.center = CGPointMake(self.view.bounds.size.width/2, urlBookStoreBtn.center.y + 80);
    webBookStoreBtn.backgroundColor = [UIColor grayColor];
    webBookStoreBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    UIButton *taskBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 260, 36)];
    [taskBtn addTarget:self action:@selector(onClickTaskBtn) forControlEvents:UIControlEventTouchUpInside];
    [taskBtn setTitle:@"打开任务界面" forState:UIControlStateNormal];
    [bgControl addSubview:taskBtn];
    taskBtn.center = CGPointMake(self.view.bounds.size.width/2, webBookStoreBtn.center.y + 80);
    taskBtn.backgroundColor = [UIColor grayColor];
    taskBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    UIButton *idfaBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 260, 36)];
    [idfaBtn addTarget:self action:@selector(onClickIdfaBtn) forControlEvents:UIControlEventTouchUpInside];
    [idfaBtn setTitle:@"查看&复制idfa" forState:UIControlStateNormal];
    [bgControl addSubview:idfaBtn];
    idfaBtn.center = CGPointMake(self.view.bounds.size.width/2, taskBtn.center.y + 80);
    idfaBtn.backgroundColor = [UIColor grayColor];
    idfaBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    UIButton *imeiBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 260, 36)];
    [imeiBtn addTarget:self action:@selector(onClickImeiBtn) forControlEvents:UIControlEventTouchUpInside];
    [imeiBtn setTitle:@"查看&复制imei" forState:UIControlStateNormal];
    [bgControl addSubview:imeiBtn];
    imeiBtn.center = CGPointMake(self.view.bounds.size.width/2, idfaBtn.center.y + 80);
    imeiBtn.backgroundColor = [UIColor grayColor];
    imeiBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    UIButton *clearCacheBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 260, 36)];
    [clearCacheBtn addTarget:self action:@selector(onClickClearCacheBtn) forControlEvents:UIControlEventTouchUpInside];
    [clearCacheBtn setTitle:@"清除缓存" forState:UIControlStateNormal];
    [bgControl addSubview:clearCacheBtn];
    clearCacheBtn.center = CGPointMake(self.view.bounds.size.width/2, imeiBtn.center.y + 80);
    clearCacheBtn.backgroundColor = [UIColor grayColor];
    clearCacheBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
}

-(void) dealloc
{
    _bookStoreMgr = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initNavigationBar
{
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.title = @"阅盟SDK DEMO";
}

#pragma mark - public
-(void) setBookStoreMgr:(BookStoreMgr *)bookStoreMgr
{
    _bookStoreMgr = bookStoreMgr;
}

-(BOOL) handleOpenURL:(NSURL *)url
{
    return [_bookStoreMgr handleOpenURL:url];
}

#pragma mark - private
-(void) onClickBgControl
{
    [_textField resignFirstResponder];
}

-(void) onClickOpenUrlBtn
{
    if (_textField.text.length == 0){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入url地址" preferredStyle:UIAlertControllerStyleAlert];
         
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
         
        [self presentViewController:alertController animated:YES completion:nil];
        return ;
    }
    
    [_bookStoreMgr openCommonWebviewByUrl:_textField.text];
    [self performSelector:@selector(addControlToNavBar) withObject:nil afterDelay:0.3];
}

-(void) onClickBookStoreBtn
{
    [_bookStoreMgr openBookStore];
    //BookStoreMgr *mgr = [[BookStoreMgr alloc] init];
    //[mgr openBookStore];
    
    [self performSelector:@selector(addControlToNavBar) withObject:nil afterDelay:0.3];
}

-(void) onClickUrlBookStoreBtn
{
    [_bookStoreMgr openBookStoreByUrl];
    [self performSelector:@selector(addControlToNavBar) withObject:nil afterDelay:0.3];
}

-(void) onClickWebBookStoreBtn
{
    UIViewController *webviewController = [_bookStoreMgr getBookStoreWebviewController];
    [self.navigationController pushViewController:webviewController animated:YES];
    
    [self performSelector:@selector(addControlToNavBar) withObject:nil afterDelay:0.3];
    
    //TabViewController *tabController = [TabViewController alloc];
    //[tabController setBookStoreMgr:_bookStoreMgr];
    //[self.navigationController pushViewController:tabController animated:YES];
}

-(void) onClickTaskBtn
{
    [_bookStoreMgr openTaskController];
    [self performSelector:@selector(addControlToNavBar) withObject:nil afterDelay:0.3];
}

-(void) onClickIdfaBtn
{
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    if (idfa == nil){
        idfa = @"";
    }
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = idfa;
    
    
    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"idfa" message:idfa preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *leftAction = [UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleDefault handler:nil];
    UIAlertAction *rightAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertCtrl addAction:leftAction];
    [alertCtrl addAction:rightAction];
    [self presentViewController:alertCtrl animated:YES completion:nil];
}

-(void) onClickImeiBtn
{
    NSString *ret = nil;
    NSInteger awardScore = 150000;
    if (awardScore >= 10000){
        if (awardScore % 10000 == 0){
            NSInteger dd = awardScore / 10000;
            ret = [NSString stringWithFormat:@"%ld万", (long)dd];
        }else{
            double ff = awardScore / 10000.0;
            ret = [NSString stringWithFormat:@"%.1f万", ff];
        }

    }else{
        ret = [NSString stringWithFormat:@"%ld", (long)awardScore];
    }
    
    NSString *imei = [_bookStoreMgr getSDKImei];//[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    if (imei == nil){
        imei = @"";
    }
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = imei;
    
    
    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"imei" message:imei preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *leftAction = [UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleDefault handler:nil];
    UIAlertAction *rightAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertCtrl addAction:leftAction];
    [alertCtrl addAction:rightAction];
    [self presentViewController:alertCtrl animated:YES completion:nil];
}

-(void) onClickClearCacheBtn
{
    NSString*appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{

    }];
    
    

//     [[WKWebsiteDataStore defaultDataStore] fetchDataRecordsOfTypes:[WKWebsiteDataStore allWebsiteDataTypes] completionHandler:^(NSArray<WKWebsiteDataRecord *> * _Nonnull records) {
//            for (WKWebsiteDataRecord *record in records) {
//                NSLog(@"r: %@", record.displayName);
//                //NSString *hostName = self->dappWebView.URL.host;//关键代码
//                //if ([record.displayName containsString: hostName])
//                {
//                    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes: record.dataTypes forDataRecords:@[record] completionHandler:^{
//
//                    }];
//                }
//            }
//        }];
}

-(void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //NSLog(@"%@", self.view);
}


#pragma mark - additional private
-(void) onClickNavBarControl
{
    NSString *url = [_bookStoreMgr getWebviewUrl];
    if (url.length == 0){
        return ;
    }
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = url;
    
    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"url" message:url preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *rightAction = [UIAlertAction actionWithTitle:@"复制" style:UIAlertActionStyleDefault handler:nil];
    [alertCtrl addAction:rightAction];
    
    UIViewController *topController = [self topViewController];
    
    [topController presentViewController:alertCtrl animated:YES completion:nil];
}

-(void) addControlToNavBar
{
    UIViewController *topController = [self topViewController];
    
    UIControl *bgControl = [[UIControl alloc] initWithFrame:CGRectMake(80, 0, self.view.bounds.size.width - 80*2, self.navigationController.navigationBar.bounds.size.height)];
    [self.view addSubview:bgControl];
    //bgControl.backgroundColor = [UIColor blueColor];
    [bgControl addTarget:self action:@selector(onClickNavBarControl) forControlEvents:UIControlEventTouchUpInside];
    
    [topController.navigationController.navigationBar addSubview:bgControl];
}

- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    
    return nil;
}
@end
