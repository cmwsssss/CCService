# CCService
## CCService是什么？
CCService是一种项目组件化以后各组件之间通信的通信工具

## 介绍
CCService是基于慢速转发机制的组件间通信工具，各组件只需要对CCService的ServiceCenter进行依赖即可进行各组件之间的通信

## 特点

### 易读：
通过CCService进行调用的方法易于阅读，调用方法为: **服务名_方法名**, 这样可以很清晰的调用的是哪个服务提供者的哪个方法
```
//调用Register服务下的register方法
RegisterService_register
```

### 易更新
如果各组件接口有变更时，只需要更新ServiceCenter内的接口协议并进行单独发版即可，不需要像CTMediator一样去对每个组件的category进行发版

### 服务自动注册和发现
服务会被自动注册到服务中心，编程者不用关心如何去注册和发现服务，直接进行服务调用即可

## 使用教程

### 环境要求

CCService支持 iOS 6 以上

### 安装

pod 'CCService'

### 角色构成

#### 1. CCService
CCService是基础工具模块，所有服务的调用都要通过他进行

#### 2. ServiceCenter
ServiceCenter是服务中心模块，这个模块只有protocol文件，所有的模块的对外接口都需要在这个模块的protocol文件里声明，该模块依赖于CCService模块

#### 3. 组件模块
组件模块即为工程的各个组件，比如注册模块，登录模块，用户模块等等，这些组件之间相互不需要任何依赖，有调用需求的模块只需要依赖于ServiceCenter即可。

### 依赖关系

<img width="625" alt="截屏2022-01-13 上午8 38 31" src="https://user-images.githubusercontent.com/16182417/149245735-9a016d5e-7259-4a2b-9ff4-94ced1cb71b8.png">

这张图可以清晰的看出，有调用需求的组件模块（ModuleA, ModuleB....）依赖于服务中心模块（ServiceCenter），服务中心模块依赖于CCService模块

这个架构是可变的，比如服务中心模块可以和CCService集成为一个模块，或者可以声明多个服务中心模块（每个组件都有自己对外的服务中心，这样结构会和CTMediator比较类似）

### 实践
通过对CCServiceExample工程进行解析来进行CCService组件间通信的实践

#### 1. 工程结构：
我们的工程由Register，User，CCServiceExample（主模块）三个模块构成

其中Register模块下的RegisterService类提供了该模块对外部接口的具体实现

```
@interface RegisterService : NSObject

- (void)registerWithUsername:(NSString *)username password:(NSString *)password;
- (UIViewController *)getRegisterViewController;
- (void)unRegisterUser;

@end

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
```

User模块下的UserService类提供了该模块对外部接口的具体实现
```
@interface UserService : NSObject

- (BOOL)checkEmailExsited:(NSString *)email;
- (UIViewController *)getUserViewController;

@end

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
```

#### 2. 构建ServiceCenter
ServiceCenter由User和Register模块的接口声明文件构成，该声明为协议的形式

##### CCServiceAPI宏
在接口声明文件内，需要用CCServiceAPI宏来进行服务接口的声明
```
CCServiceAPI(returnType, ServiceClassName, ServiceMethodName)
```
比如要对 RegisterService 内的 registerWithUsername:(NSString *)username password:(NSString *)password 进行声明

* returnType 为 registerWithUsername 方法的返回值 void

* ServiceClassName 为 RegisterService

* ServiceMethodName 为 registerWithUsername 的完整方法声明 registerWithUsername:(NSString *)username password:(NSString *)password

所以最终该服务应该被声明为
```
CCServiceAPI(void, RegisterService, registerWithUsername:(NSString *)username password:(NSString *)password)
```
##### RegisterServiceInterface.h
对RegisterService的服务进行声明
```
@protocol RegisterServiceInterface <NSObject>

CCServiceAPI(void, RegisterService, registerWithUsername:(NSString *)username password:(NSString *)password)
CCServiceAPI(UIViewController*, RegisterService, getRegisterViewController)
CCServiceAPI(void, RegisterService, unRegisterUser)

@end
```

##### UserServiceInterface.h
对UserService的服务进行声明
```
@protocol UserServiceInterface <NSObject>

CCServiceAPI(BOOL, UserService, checkEmailExsited:(NSString *)email)
CCServiceAPI(UIViewController*, UserService, getUserViewController)

@end
```

#### 3. 配置podspec
因为Register模块和User模块都需要相互进行服务调用，所以需要配置它们的podspec文件，将其依赖于ServiceCenter模块

在podspec文件内加上这一行
```
spec.dependency "ServiceCenter"
```

ServiceCenter则需要依赖于CCService工具，则需要配置它的podspec文件，将其依赖于CCService模块

在podspec文件内加上这一行
```
spec.dependency "CCService"
```

#### 4. 配置主工程的podfile
现在组件的podspec都配置好了，接下来要把组件组合到主工程
```
target 'CCServiceExample' do
pod 'CCService'
pod 'ServiceCenter', :path=>'../ServiceCenter'
pod 'Register', :path=>'../Register'
pod 'User', :path=>'../User'
end
```

#### 5.调用
最后是服务的调用，调用非常简单，比如现在要调用RegisterService下的getRegisterViewController方法
```
UIViewController *registerVC = [(id <RegisterServiceInterface>)[CCService anyService] RegisterService_getRegisterViewController];
```
首先编译器会帮助检查，确保调用正确，其次方法的调用很清晰，调用哪个服务下的哪个方法一目了然，不会出现服务多了以后不同的服务category重名等等问题








