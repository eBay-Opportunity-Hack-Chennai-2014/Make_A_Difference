//
//  LoginRequest.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest

- (instancetype)initWithDelegate:(id<LoginRequestDelegate> )delegate username:(NSString *)username password:(NSString *)password {
    
    self = [super self];
    
    if (self) {
        self.delegate = delegate;
        
    }
    return self;
}

@end
