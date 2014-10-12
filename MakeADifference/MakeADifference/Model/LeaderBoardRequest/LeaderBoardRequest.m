//
//  LeaderBoardRequest.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "LeaderBoardRequest.h"
#import "Credit.h"
#import "SharedSingleton.h"
#import "UserInfo.h"
#import "NetworkHandler.h"
#import "Macros.h"

NSString *kLeaderBoardURL = BASEURL@"report_credit_leaderboard";

@implementation LeaderBoardRequest

- (instancetype)initWithDelegate:(id<LeaderBoardRequestDelegate> )delegate {
    
    self = [super self];
    
    if (self) {
        _delegate = delegate;
        _creditsArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)startRequest {
    
    if([NetworkHandler checkInternet] && requestHandler == nil) {
        
        requestHandler = [[RequestHandler alloc] initWithURL:[NSURL URLWithString:kLeaderBoardURL] delegate:self];
        UserInfo *userinfo = [SharedSingleton singleton].userInfo;
        
        [requestHandler setParameter:userinfo.cityID forKey:@"city_id"];
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
        
        [_creditsArray removeAllObjects];
        for (NSDictionary *dictionary  in volunteerArray) {
            
            Credit *credit = [[Credit alloc] initWithDictionary:dictionary];
            [_creditsArray addObject:credit];
        }
    }
    
    [_delegate leaderBoardRequestDidSucceded:self];
    requestHandler = nil;
    
}

- (void)requestDidFailed:(RequestHandler *) request withError:(NSError*) error {
    
    [_delegate leaderBoardRequesttDidFailed:self withError:[error.userInfo objectForKey:@"message"]];
    requestHandler = nil;
    
}


@end
