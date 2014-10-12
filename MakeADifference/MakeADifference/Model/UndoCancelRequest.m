//
//  UndoCancelRequest.m
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 12/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "UndoCancelRequest.h"

@implementation UndoCancelRequest

- (instancetype)initWithDelegate:(id<UndoCancelRequestDelegate>)delegate andLevel:(Level *)level {
    
    self = [super initWithLevel:level];
    if (self) {
        
        _delegate = delegate;
    }
    
    return self;
}

#pragma mark RequestHandler

- (void)requestDidSucceed:(RequestHandler *)request {
    
    [_delegate undoCancelRequestDidSucceded:self];
}

- (void)requestDidFailed:(RequestHandler *) request withError:(NSError*) error {
    
}

@end
