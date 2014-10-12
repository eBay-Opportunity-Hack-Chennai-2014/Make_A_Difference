//
//  ClassHistoryRequest.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "ClassHistoryRequest.h"
#import "ClassHistory.h"
#import "SharedSingleton.h"
#import "UserInfo.h"
#import "Macros.h"
#import "NetworkHandler.h"

NSString *kClassHistoryURL = BASEURL@"user_class_history";

@implementation ClassHistoryRequest

- (instancetype)initWithDelegate:(id<ClassHistoryRequestDelegate> )delegate {
    
    self = [super self];
    
    if (self) {
        _delegate = delegate;
        _classHistoryArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)startRequest {
    
    if([NetworkHandler checkInternet] && requestHandler == nil) {
        
        requestHandler = [[RequestHandler alloc] initWithURL:[NSURL URLWithString:kClassHistoryURL] delegate:self];
        UserInfo *userinfo = [SharedSingleton singleton].userInfo;
        
        [requestHandler setParameter:userinfo.userID forKey:@"user_id"];
        [requestHandler setParameter:userinfo.userKey forKey:@"key"];
        [requestHandler startRequest];
        
    } else {
        return;
    }
    
}

#pragma mark RequestHandler

- (void)requestDidSucceed:(RequestHandler *)request {
    NSArray *volunteerArray = [request.responseData valueForKey:@"data"];
    
    if ([volunteerArray count] > 0) {
    
        [_classHistoryArray removeAllObjects];
        for (NSDictionary *dictionary  in volunteerArray) {
            
            ClassHistory *volunteer = [[ClassHistory alloc] initWithDictionary:dictionary];
            [_classHistoryArray addObject:volunteer];
        }
    }
    
    [_delegate classHistoryRequestDidSucceded:self];
    requestHandler = nil;
    
}

- (void)requestDidFailed:(RequestHandler *) request withError:(NSError*) error {
    
    [_delegate classHistoryRequestDidFailed:self withError:[error.userInfo objectForKey:@"message"]];
    requestHandler = nil;
    
}


@end
