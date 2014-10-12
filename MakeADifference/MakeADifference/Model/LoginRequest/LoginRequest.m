//
//  LoginRequest.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "LoginRequest.h"
#import "NetworkHandler.h"
#import "SharedSingleton.h"
#import "UserInfo.h"

NSString *kLoginURL = @"http://makeadiff.in/madapp/index.php/api/user_login";

@implementation LoginRequest

- (instancetype)initWithDelegate:(id<LoginRequestDelegate> )delegate {
    
    self = [super self];
    
    if (self) {
        self.delegate = delegate;
        
    }
    return self;
}

- (void)startRequestWithUsername:(NSString *)username password:(NSString *)password {
    
    if([NetworkHandler checkInternet] && requestHandler == nil) {
        
        requestHandler = [[RequestHandler alloc] initWithURL:[NSURL URLWithString:kLoginURL] delegate:self];
        [requestHandler setParameter:username forKey:@"email"];
        [requestHandler setParameter:password forKey:@"password"];
        [requestHandler startRequest];
        
    } else {
        return;
    }
}

#pragma mark RequestHandler
- (void)requestDidSucceed:(RequestHandler *)request {
    
    UserInfo *userinfo = [[UserInfo alloc] initWithDictionary:request.responseData];
    [SharedSingleton singleton].userInfo = userinfo;
    [_delegate loginRequestDidSucceded:self];
    requestHandler = nil;
    
}

- (void)requestDidFailed:(RequestHandler *) request withError:(NSError*) error {
    
    [_delegate loginRequestdidFailed:self withError:[error.userInfo objectForKey:@"message"]];
    requestHandler = nil;
    
}

@end
