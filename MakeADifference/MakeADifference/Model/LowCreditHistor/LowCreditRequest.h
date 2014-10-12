//
//  LowCreditRequest.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHandler.h"

@class LowCreditRequest;

@protocol LowCreditRequestDelegate <NSObject>

- (void)lowCreditRequestDidSucceded:(LowCreditRequest *)lowCreditRequest;
- (void)lowCreditRequestDidFailed:(LowCreditRequest *)lowCreditRequest withError:(NSString *)error;

@end

@interface LowCreditRequest : NSObject {
    RequestHandler *requestHandler;
    
}

- (instancetype)initWithDelegate:(id<LowCreditRequestDelegate> )delegate;
@property (nonatomic, readwrite) __weak id<LowCreditRequestDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *creditsArray;

- (void)startRequest;


@end
