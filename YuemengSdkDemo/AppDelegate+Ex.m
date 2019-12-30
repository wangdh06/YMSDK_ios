//
//  AppDelegate+Ex.m
//  YuemengSdkDemo_GDT
//
//  Created by wangdh on 2019/12/25.
//  Copyright © 2019 wangdh. All rights reserved.
//

#import "AppDelegate+Ex.h"

#import <objc/runtime.h>

@implementation DemoAppDelegate (Ex)

+ (void)load
{
    /*
    SEL origSel = @selector(application:didFinishLaunchingWithOptions:);
    SEL swizSel = @selector(application:didFinishLaunchingWithOptionsEx:);
    
    Class c = [[UIApplication sharedApplication].delegate class];
    [DemoAppDelegate swizzleMethods:[self class] originalSelector:origSel swizzledSelector:swizSel];*/
}

//交换两个方法的实现
+ (void)swizzleMethods:(Class)class originalSelector:(SEL)origSel swizzledSelector:(SEL)swizSel
{
    Method origMethod = class_getInstanceMethod(class, origSel);
    Method swizMethod = class_getInstanceMethod(class, swizSel);

    //判断是情况一还是情况二
    BOOL didAddMethod = class_addMethod(class, origSel, method_getImplementation(swizMethod), method_getTypeEncoding(swizMethod));
  
    if (didAddMethod)
    {
        /*
          第一种情况：要交换的方法已经在父类中实现了，则替换父类方法
          使用replaceMethod来替换给定类的方法实现(将origMethod方法替换成swizSel方法)
         */
        class_replaceMethod(class, swizSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }
    else
    {
        /*
          第二种情况：要交换的方法已经存在于目标类中
          通过method_exchangeImplementations来交换方法
         */
        method_exchangeImplementations(origMethod, swizMethod);
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptionsEx:(NSDictionary *)launchOptions{
    
    return [self application:application didFinishLaunchingWithOptionsEx:launchOptions];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptionsEx2:(NSDictionary *)launchOptions{
    
    return [self application:application didFinishLaunchingWithOptionsEx2:launchOptions];
}

@end
