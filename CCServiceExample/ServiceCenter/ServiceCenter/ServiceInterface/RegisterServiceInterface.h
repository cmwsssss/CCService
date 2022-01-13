//
//  RegisterServiceInterface.h
//  ServiceCenter
//
//  Created by cmw on 2022/1/12.
//

#ifndef RegisterServiceInterface_h
#define RegisterServiceInterface_h

#import<CCService/CCService.h>

@class UIViewController;

@protocol RegisterServiceInterface <NSObject>

CCServiceAPI(void, RegisterService, registerWithUsername:(NSString *)username password:(NSString *)password)
CCServiceAPI(UIViewController*, RegisterService, getRegisterViewController)
CCServiceAPI(void, RegisterService, unRegisterUser)
@end

#endif /* RegisterServiceInterface_h */
