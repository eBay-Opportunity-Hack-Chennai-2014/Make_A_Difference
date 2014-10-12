//
//  CreditHistoryRequest.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHandler.h"

@class CreditHistoryRequest;

@protocol CreditHistoryRequestDelegate <NSObject>

- (void)creditRequestDidSucceded:(CreditHistoryRequest *)creditRequest;
- (void)creditRequestDidFailed:(CreditHistoryRequest *)creditRequest withError:(NSString *)error;

@end

@interface CreditHistoryRequest : NSObject {
    RequestHandler *requestHandler;
    
}

- (instancetype)initWithDelegate:(id<CreditHistoryRequestDelegate> )delegate;
@property (nonatomic, readwrite) __weak id<CreditHistoryRequestDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *creditHistoryArray;
- (void)startRequest;

@end
