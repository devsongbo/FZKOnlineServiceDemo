//
//  FZKOnlineService.m
//  Pods
//
//  Created by 宋搏 on 06/07/2017.
//
//

#import "FZKOnlineService.h"


@implementation FZKOnlineService



+ (instancetype)shared{
    static FZKOnlineService *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (shared == nil) {
            
            shared = [[self alloc] init];
            
        }
    });
    return shared;
}

-(void)registerAppId{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    
    [[QYSDK sharedSDK] registerAppId:@"ba9103b1f7429fcee43648db0364be10" appName:[infoDictionary objectForKey:@"CFBundleDisplayName"]];
    
    
    //推送消息相关处理
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerForRemoteNotifications)]){
        UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound |         UIUserNotificationTypeAlert;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }

    
}


-(void)registerForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{

     [[QYSDK sharedSDK] updateApnsToken:deviceToken];
}





- (void)pushToOnlineServiceWithSessionTitle:(NSString *)title customID:(NSString *)customID Nav:(UINavigationController *)nav{
    
    
    QYSource *source = [[QYSource alloc] init];
    source.title =  @"思锐管家";
    source.urlString = @"https://8.163.com/";
    source.customInfo = customID;
    
    
    
    
    
    QYSessionViewController *sessionViewController = [[QYSDK sharedSDK] sessionViewController];
    sessionViewController.sessionTitle = title;
    sessionViewController.source = source;
    
    
    
    [self setUserInfo];
    
    sessionViewController.hidesBottomBarWhenPushed = YES;
    [nav pushViewController:sessionViewController animated:YES];
    
    
    
}


- (void)logout{
    
    [[QYSDK sharedSDK] logout:^{
        
    }];
    
}


-(void)setUserInfo{
    
    
    QYUserInfo *userInfo = [[QYUserInfo alloc] init];
    userInfo.userId = @"userId";
    NSString *name = @"userId";
    
    name = @"账号A";
    NSMutableArray *array = [NSMutableArray new];
    NSMutableDictionary *dictRealName = [NSMutableDictionary new];
    [dictRealName setObject:@"real_name" forKey:@"key"];
    [dictRealName setObject:@"边晨" forKey:@"value"];
    [array addObject:dictRealName];
    NSMutableDictionary *dictMobilePhone = [NSMutableDictionary new];
    [dictMobilePhone setObject:@"mobile_phone" forKey:@"key"];
    [dictMobilePhone setObject:@"13805713536" forKey:@"value"];
    [dictMobilePhone setObject:@(NO) forKey:@"hidden"];
    [array addObject:dictMobilePhone];
    NSMutableDictionary *dictEmail = [NSMutableDictionary new];
    [dictEmail setObject:@"email" forKey:@"key"];
    [dictEmail setObject:@"bianchen@163.com" forKey:@"value"];
    [array addObject:dictEmail];
    NSMutableDictionary *dictAuthentication = [NSMutableDictionary new];
    [dictAuthentication setObject:@"0" forKey:@"index"];
    [dictAuthentication setObject:@"authentication" forKey:@"key"];
    [dictAuthentication setObject:@"实名认证" forKey:@"label"];
    [dictAuthentication setObject:@"已认证" forKey:@"value"];
    [array addObject:dictAuthentication];
    NSMutableDictionary *dictBankcard = [NSMutableDictionary new];
    [dictBankcard setObject:@"1" forKey:@"index"];
    [dictBankcard setObject:@"bankcard" forKey:@"key"];
    [dictBankcard setObject:@"绑定银行卡" forKey:@"label"];
    [dictBankcard setObject:@"622202******01116068" forKey:@"value"];
    [array addObject:dictBankcard];
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:array
                                                   options:0
                                                     error:nil];
    if (data)
    {
        userInfo.data = [[NSString alloc] initWithData:data
                                              encoding:NSUTF8StringEncoding];
    }
    
    
    [[QYSDK sharedSDK] setUserInfo:userInfo];
    
    
    
}



@end
