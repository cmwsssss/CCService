//
//  UserService.m
//  User
//
//  Created by cmw on 2022/1/12.
//

#import "UserService.h"
#import "UserViewController.h"
@implementation UserService

- (BOOL)checkEmailExsited:(NSString *)email {
    NSLog(@"%@ (%@)",NSStringFromSelector(_cmd), email);
    return YES;
}

- (UIViewController *)getUserViewController {
    UserViewController *vc = [[UserViewController alloc] init];
    return vc;
}


@end
