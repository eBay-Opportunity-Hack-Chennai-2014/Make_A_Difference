//
//  VolunteerRequest.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "VolunteerRequest.h"
#import "SharedSingleton.h"
#import "Volunteer.h"
#import "UserInfo.h"
#import "NetworkHandler.h"
#import "Macros.h"

NSString *kVolunteerRequest = BASEURL@"user_get_all";

@implementation VolunteerRequest

- (instancetype)initWithDelegate:(id<VolunteerRequestDelegate> )delegate {
    
    self = [super self];
    
    if (self) {
        _delegate = delegate;
        _volunteerArray = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)startRequest {
    
    if([NetworkHandler checkInternet] && requestHandler == nil) {
        
        requestHandler = [[RequestHandler alloc] initWithURL:[NSURL URLWithString:kVolunteerRequest] delegate:self];
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
        [_volunteerArray removeAllObjects];
        for (NSDictionary *dictionary  in volunteerArray) {
            
            Volunteer *volunteer = [[Volunteer alloc] initWithDictionary:dictionary];
            [_volunteerArray addObject:volunteer];
        }
    }
    
    [_delegate volunteerRequestDidSucceded:self];
    requestHandler = nil;
    
}

- (void)requestDidFailed:(RequestHandler *) request withError:(NSError*) error {
    
    [_delegate volunteerRequestDidFailed:self withError:[error.userInfo objectForKey:@"message"]];
    requestHandler = nil;
    
}

@end
