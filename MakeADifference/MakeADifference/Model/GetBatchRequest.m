//
//  GetBatchRequest.m
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 11/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "GetBatchRequest.h"
#import "SharedSingleton.h"
#import "Macros.h"
#import "Level.h"

NSString *kBatchUrl = BASEURL@"class_get_last_batch";
@implementation GetBatchRequest

- (instancetype)initWithDelegate:(id<GetBatchRequestDelegate>)delegate {
    
    self = [super init];
    if (self) {
    
        _delegate = delegate;
        _levels = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)startRequest {
    
    RequestHandler *request = [[RequestHandler alloc] initWithURL:[NSURL URLWithString:kBatchUrl] delegate:self];
    [request setParameter:@"1" forKey:@"user_id"];
    [request setParameter:[SharedSingleton singleton].userInfo.userKey forKey:@"key"];
    [request startRequest];
}

- (void)populateInfo:(NSDictionary *)dictionary {
    
    self.batchId = [dictionary objectForKey:@"batch_id"];
    self.batchName = [dictionary objectForKey:@"batch_name"];
    self.centerName = [dictionary objectForKey:@"center_name"];
    for (NSDictionary *dict in [dictionary objectForKey:@"classes"]) {
        
        Level *level = [[Level alloc] initWithDictionary:dict];
        [_levels addObject:level];
    }
}

#pragma mark RequestHandler

- (void)requestDidSucceed:(RequestHandler *)request {
    
    [self populateInfo:request.responseData];
    [_delegate batchRequestDidSucceded:self];
}

- (void)requestDidFailed:(RequestHandler *) request withError:(NSError*) error {
}

@end
