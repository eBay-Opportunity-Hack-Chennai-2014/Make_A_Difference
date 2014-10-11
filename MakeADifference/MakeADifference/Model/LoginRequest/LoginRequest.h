//
//  LoginRequest.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>


@class LoginRequest;

@protocol LoginRequestDelegate <NSObject>

- (void)loginRequestDidSucceded:(LoginRequest *)loginRequest;
- (void)loginRequestdidFailed:(LoginRequest *)loginRequest withError:(NSString *)error;

@end

@interface LoginRequest : NSObject

- (instancetype)initWithDelegate:(id<LoginRequestDelegate> )delegate username:(NSString *)username password:(NSString *)password;

@property (nonatomic, readwrite) __weak id<LoginRequestDelegate> delegate;

@end
