//
//  ClassCancelRequest.h
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 12/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CancellationRequest.h"

@class ClassCancelRequest;

@protocol ClassCancelRequestDelegate <NSObject>

- (void)cancelRequestDidSucceded:(ClassCancelRequest *)cancelRequest;
- (void)cancelRequestdidFailed:(ClassCancelRequest *)cancelRequest withError:(NSString *)error;

@end
@interface ClassCancelRequest : CancellationRequest <RequestHandlerDelegate>

@property (nonatomic, weak) id<ClassCancelRequestDelegate> delegate;

- (instancetype)initWithDelegate:(id<ClassCancelRequestDelegate>)delegate andLevel:(Level *)level;

@end
