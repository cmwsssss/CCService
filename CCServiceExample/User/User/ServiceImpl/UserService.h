//
//  UserService.h
//  User
//
//  Created by cmw on 2022/1/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserService : NSObject

- (BOOL)checkEmailExsited:(NSString *)email;
- (UIViewController *)getUserViewController;

@end

NS_ASSUME_NONNULL_END
