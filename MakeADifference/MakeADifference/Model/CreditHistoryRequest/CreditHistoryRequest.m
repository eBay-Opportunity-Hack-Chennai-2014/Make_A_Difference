//
//  CreditHistoryRequest.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "CreditHistoryRequest.h"
#import "CreditHistory.h"
#import "SharedSingleton.h"
#import "UserInfo.h"
#import "NetworkHandler.h"
#import "Macros.h"

NSString *kCreditHistoryURL = BASEURL@"user_credit_history";

@implementation CreditHistoryRequest

- (instancetype)initWithDelegate:(id<CreditHistoryRequestDelegate> )delegate {
    
    self = [super self];
    
    if (self) {
        _delegate = delegate;
        _creditHistoryArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)startRequest {
    
    if([NetworkHandler checkInternet] && requestHandler == nil) {
        
        requestHandler = [[RequestHandler alloc] initWithURL:[NSURL URLWithString:kCreditHistoryURL] delegate:self];
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
    
    NSArray *creditHistoryArray = [request.responseData valueForKey:@"data"];
    
    if ([creditHistoryArray count] > 0) {
        
        [_creditHistoryArray removeAllObjects];
        for (NSDictionary *dictionary  in creditHistoryArray) {
            
            CreditHistory *creditHistory = [[CreditHistory alloc] initWithDictionary:dictionary];
            [_creditHistoryArray addObject:creditHistory];
        }
    }
    
    [_delegate creditRequestDidSucceded:self];
    requestHandler = nil;
    
}

- (void)requestDidFailed:(RequestHandler *) request withError:(NSError*) error {
    
    [_delegate creditRequestDidFailed:self withError:[error.userInfo objectForKey:@"message"]];
    requestHandler = nil;
    
}

@end
