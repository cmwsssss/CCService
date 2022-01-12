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

## 使用教程

