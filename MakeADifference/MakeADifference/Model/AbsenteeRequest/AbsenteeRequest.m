//
//  AbsenteeRequest.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "AbsenteeRequest.h"
#import "Absentee.h"
#import "SharedSingleton.h"
#import "UserInfo.h"
#import "NetworkHandler.h"
#import "Macros.h"

NSString *kAbsenteeURL = BASEURL@"report_absent_user";

@implementation AbsenteeRequest

- (instancetype)initWithDelegate:(id<AbsenteeRequestRequestDelegate> )delegate {
    
    self = [super self];
    
    if (self) {
        _delegate = delegate;
        _absenteeArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)startRequest {
    
    if([NetworkHandler checkInternet] && requestHandler == nil) {
        
        requestHandler = [[RequestHandler alloc] initWithURL:[NSURL URLWithString:kAbsenteeURL] delegate:self];
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
        
        [_absenteeArray removeAllObjects];
        for (NSDictionary *dictionary  in volunteerArray) {
            
            Absentee *volunteer = [[Absentee alloc] initWithDictionary:dictionary];
            [_absenteeArray addObject:volunteer];
        }
    }
    
    [_delegate absenteeRequestDidSucceded:self];
    requestHandler = nil;
    
}

- (void)requestDidFailed:(RequestHandler *) request withError:(NSError*) error {
    
    [_delegate absenteeRequestDidFailed:self withError:[error.userInfo objectForKey:@"message"]];
    requestHandler = nil;
    
}




@end
