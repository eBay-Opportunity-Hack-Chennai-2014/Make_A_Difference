//
//  GetBatchRequest.h
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 11/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHandler.h"

@class GetBatchRequest;

@protocol GetBatchRequestDelegate <NSObject>

- (void)batchRequestDidSucceded:(GetBatchRequest *)batchRequest;
- (void)batchRequestdidFailed:(GetBatchRequest *)batchRequest withError:(NSString *)error;

@end

@interface GetBatchRequest : NSObject

@property (nonatomic, readwrite) NSString *batchId;
@property (nonatomic, readwrite) NSString *batchName;
@property (nonatomic, readwrite) NSString *centerName;
@property (nonatomic, readwrite) NSMutableArray *levels;

@property (nonatomic, weak) id<GetBatchRequestDelegate> delegate;

- (instancetype)initWithDelegate:(id<GetBatchRequestDelegate>)delegate;
- (void)startRequest;

@end
