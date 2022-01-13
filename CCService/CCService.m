//
//  CCService.m
//  CCService
//
//  Created by cmw on 2022/1/11.
//

#import "CCService.h"
#import <objc/runtime.h>
@interface CCService ()

@property (nonatomic, strong) NSMutableDictionary *dicService;

@end

@implementation CCService

static CCService *s_instance;

+ (instancetype)anyService {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [[CCService alloc] init];
    });
    return s_instance;
}

- (NSMutableDictionary *)dicService {
    if (!_dicService) {
        _dicService = [[NSMutableDictionary alloc] init];
    }
    return _dicService;
}

- (NSArray *)findNamesFromSelector:(SEL)aSelector {
    NSString *selectorName = [NSString stringWithUTF8String:sel_getName(aSelector)];
    NSArray <NSString *>*names = [selectorName componentsSeparatedByString:@"_"];
    return names;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSArray <NSString *>*names = [self findNamesFromSelector:aSelector];
    Class targetClass = objc_getClass(names.firstObject.UTF8String);
    id target = [self.dicService objectForKey:names.firstObject];
    if (!target) {
        target = [[targetClass alloc] init];
        [self.dicService setObject:target forKey:names.firstObject];
    }
    SEL newSelector = sel_getUid(names.lastObject.UTF8String);
    Method method = class_getInstanceMethod(targetClass, newSelector);
    if (!method) {
        return [super methodSignatureForSelector:aSelector];
    }
    const char *type = method_getTypeEncoding(method);
    return [NSMethodSignature signatureWithObjCTypes:type];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSArray <NSString *>*names = [self findNamesFromSelector:anInvocation.selector];
    id target = [self.dicService objectForKey:names.firstObject];
    SEL newSelector = sel_getUid(names.lastObject.UTF8String);
    anInvocation.selector = newSelector;
    [anInvocation invokeWithTarget:target];
}

@end
