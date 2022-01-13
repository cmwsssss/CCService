//
//  CCService.h
//  CCService
//
//  Created by cmw on 2022/1/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define CCServiceAPI(returnType, ServiceClassName, MethodName) - (returnType) ServiceClassName##_##MethodName;

@interface CCService : NSObject

+ (instancetype)anyService;

@end

NS_ASSUME_NONNULL_END
