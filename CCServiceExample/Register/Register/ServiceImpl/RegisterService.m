//
//  RegisterService.m
//  Register
//
//  Created by cmw on 2022/1/12.
//

#import "RegisterService.h"
#import "RegisterViewController.h"
@implementation RegisterService

- (UIViewController *)getRegisterViewController {
    RegisterViewController *vc = [[RegisterViewController alloc] init];
    return vc;
}

- (void)registerWithUsername:(NSString *)username password:(NSString *)password {
    NSLog(@"%@ (%@, %@) ", NSStringFromSelector(_cmd), username, password);
}

- (void)unRegisterUser {
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

@end
