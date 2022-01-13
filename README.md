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

CCService支持 iOS 13 以上

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




