//
//  FZKOnlineService.h
//  Pods
//
//  Created by 宋搏 on 06/07/2017.
//
//

#import <Foundation/Foundation.h>
#import "QYSDK.h"

@interface FZKOnlineService : NSObject
+(instancetype)shared;
-(void)registerAppId;
-(void)registerForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
-(void)pushToOnlineServiceWithSessionTitle:(NSString *)title customID:(NSString *)customID Nav:(UINavigationController *)nav;
@end
