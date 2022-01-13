//
//  RegisterService.h
//  Register
//
//  Created by cmw on 2022/1/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterService : NSObject

- (void)registerWithUsername:(NSString *)username password:(NSString *)password;
- (UIViewController *)getRegisterViewController;
- (void)unRegisterUser;
@end

NS_ASSUME_NONNULL_END
