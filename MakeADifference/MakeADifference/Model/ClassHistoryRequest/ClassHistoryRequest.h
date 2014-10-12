//
//  ClassHistoryRequest.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHandler.h"

@class ClassHistoryRequest;

@protocol ClassHistoryRequestDelegate <NSObject>

- (void)classHistoryRequestDidSucceded:(ClassHistoryRequest *)classHistoryRequest;
- (void)classHistoryRequestDidFailed:(ClassHistoryRequest *)classHistoryRequest withError:(NSString *)error;

@end

@interface ClassHistoryRequest : NSObject {
    RequestHandler *requestHandler;
    
}

- (instancetype)initWithDelegate:(id<ClassHistoryRequestDelegate> )delegate;
@property (nonatomic, readwrite) __weak id<ClassHistoryRequestDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *classHistoryArray;

- (void)startRequest;

@end
