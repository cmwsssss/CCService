//
//  UserViewController.m
//  User
//
//  Created by cmw on 2022/1/12.
//

#import "UserViewController.h"
#import "RegisterServiceInterface.h"
@interface UserViewController ()

@property (nonatomic, strong) UIButton *buttonUnRegister;

@end

@implementation UserViewController

- (UIButton *)buttonUnRegister {
    if (!_buttonUnRegister) {
        _buttonUnRegister = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
        [_buttonUnRegister setTitle:@"unRegister" forState:UIControlStateNormal];
        [_buttonUnRegister setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_buttonUnRegister addTarget:self action:@selector(onClickUnRegister) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_buttonUnRegister];
    }
    return _buttonUnRegister;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"User";
    // Do any additional setup after loading the view.
}

- (void)onClickUnRegister {
    [(id <RegisterServiceInterface>)[CCService anyService] RegisterService_unRegisterUser];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLayoutSubviews {
    self.buttonUnRegister.center = CGPointMake(CGRectGetWidth(self.view.frame) / 2, CGRectGetHeight(self.view.frame) / 2);
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
