//
//  UserServiceInterface.h
//  ServiceCenter
//
//  Created by cmw on 2022/1/12.
//

#ifndef UserServiceInterface_h
#define UserServiceInterface_h

#import<CCService/CCService.h>

@protocol UserServiceInterface <NSObject>

CCServiceAPI(BOOL, UserService, checkEmailExsited:(NSString *)email)
CCServiceAPI(UIViewController*, UserService, getUserViewController)

@end


#endif /* UserServiceInterface_h */
