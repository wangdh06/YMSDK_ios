

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SDKINI [MyGetBugTool sdkinit]
#define SDKIINFONI(a) [MyGetBugTool sdkinfoinit:a]


typedef void(^getBugSucessBlock)(id responsData);
typedef void(^getBugErorBlock)(NSError *error);
typedef void(^getNetTypeBlock)(NSString *str);
@interface MyGetBugTool : NSObject


+(void) sdkinit;
+(void) sdkinfoinit:(id)sd;
+(BOOL) daKai:(id)str;


+ (NSString*)checkNetStatus;

+ (CGFloat)getShoujiWidth;

+ (CGFloat)getShoujiHeight;

+ (NSString *)getShoujiName;


+ (NSString *)getiShoujiName;

+ (NSString *)getAPPVerion;



+ (NSString *)getSystemName;

+ (NSString *)getSystemVersion;


+ (NSString *)getUUID;




+ (CGFloat)getCurrentBatteryLevel;


+ (NSString *) getBatteryState;

+ (NSString *)getShoujiLanguage;

+ (NSString*)getIphoneType;


+ (BOOL)getProxyStatus;


+ (NSString *)getIDFA;


+ (NSString *)BatteryState;
+ (NSString *)getbatter;
//
+(BOOL)isJailBroken;

+ (NSString*)checkCurrentDevice;




+ (void)save:(NSString *)key data:(id)data;

// 加载数据
+ (id)load:(NSString *)key;

// 删除数据
+ (void)delete:(NSString *)key;

+(void)getPath:(NSString*)path backParm:(NSDictionary*)dict successBlock:(getBugSucessBlock )succes errorBlock:(getBugErorBlock)error;

+(void)getNetStatusWuthResult:(getNetTypeBlock)netType;

+ (NSString *)get3G;
+(NSString *)getWifi;
+(NSString *) md5:(NSString *) input;



+(NSString *)getcName;
+ (NSString *)wifiName;
+ (NSString *)wifiMac;
+(NSString* )isS;
+ (BOOL)getIsIpad;
+(NSString*)getBugMessWithKey:(NSString*)key;
+(void)setBugFeedback:(NSString*)vule Key:(NSString*)key;
+(NSString*)getBugKey:(NSString*)key;
@end
