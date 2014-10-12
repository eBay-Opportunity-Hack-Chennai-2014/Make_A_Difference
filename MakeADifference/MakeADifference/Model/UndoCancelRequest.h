//
//  UndoCancelRequest.h
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 12/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CancellationRequest.h"

@class UndoCancelRequest;

@protocol UndoCancelRequestDelegate <NSObject>

- (void)undoCancelRequestDidSucceded:(UndoCancelRequest *)undoCancelRequest;
- (void)undoCancelRequestdidFailed:(UndoCancelRequest *)undoCancelRequest withError:(NSString *)error;

@end

@interface UndoCancelRequest : CancellationRequest <RequestHandlerDelegate>

@property (nonatomic, weak) id<UndoCancelRequestDelegate> delegate;

- (instancetype)initWithDelegate:(id<UndoCancelRequestDelegate>)delegate andLevel:(Level *)level;

@end
