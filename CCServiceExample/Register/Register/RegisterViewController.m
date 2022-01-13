//
//  RegisterViewController.m
//  Register
//
//  Created by cmw on 2022/1/12.
//

#import "RegisterViewController.h"
#import "UserServiceInterface.h"
#import "CCService.h"
#import "RegisterServiceInterface.h"
@interface RegisterViewController ()

@property (nonatomic, strong) UIButton *buttonRegister;

@end

@implementation RegisterViewController

- (UIButton *)buttonRegister {
    if (!_buttonRegister) {
        _buttonRegister = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
        [_buttonRegister setTitle:@"Register" forState:UIControlStateNormal];
        [_buttonRegister setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_buttonRegister addTarget:self action:@selector(onClickRegister) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_buttonRegister];
    }
    return _buttonRegister;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Register";
    // Do any additional setup after loading the view.
}

- (void)onClickRegister {
    if([(id<UserServiceInterface>)[CCService anyService] UserService_checkEmailExsited:@"cmwsssss@hotmail.com"]) {
        [(id<RegisterServiceInterface>)[CCService anyService] RegisterService_registerWithUsername:@"cmwsssss" password:@"123456"];
        [self.navigationController pushViewController:[(id<UserServiceInterface>)[CCService anyService] UserService_getUserViewController] animated:YES];
    }
}

- (void)viewDidLayoutSubviews {
    self.buttonRegister.center = CGPointMake(CGRectGetWidth(self.view.frame) / 2, CGRectGetHeight(self.view.frame) / 2);
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
