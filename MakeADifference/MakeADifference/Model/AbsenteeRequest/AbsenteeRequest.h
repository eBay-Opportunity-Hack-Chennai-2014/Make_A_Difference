//
//  AbsenteeRequest.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHandler.h"

@class AbsenteeRequest;

@protocol AbsenteeRequestRequestDelegate <NSObject>

- (void)absenteeRequestDidSucceded:(AbsenteeRequest *)absenteeRequest;
- (void)absenteeRequestDidFailed:(AbsenteeRequest *)absenteeRequest withError:(NSString *)error;

@end

@interface AbsenteeRequest : NSObject {
    RequestHandler *requestHandler;    
}

- (instancetype)initWithDelegate:(id<AbsenteeRequestRequestDelegate> )delegate;
@property (nonatomic, readwrite) __weak id<AbsenteeRequestRequestDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *absenteeArray;

- (void)startRequest;

@end
