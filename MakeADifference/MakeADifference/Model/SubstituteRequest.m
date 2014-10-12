//
//  SubstituteRequest.m
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 12/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "SubstituteRequest.h"
#import "SharedSingleton.h"
#import "Substitute.h"
#import "Macros.h"

NSString *kSubstituteUrl = BASEURL@"user_get_teachers";
@implementation SubstituteRequest

- (instancetype)initWithDelegate:(id<SubstituteRequestDelegate>)delegate {
  
    self = [super init];
    if (self) {
        
        _delegate = delegate;
        _teachers = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)startRequest {
    
    RequestHandler *request = [[RequestHandler alloc] initWithURL:[NSURL URLWithString:kSubstituteUrl] delegate:self];
    [request setParameter:[SharedSingleton singleton].userInfo.cityID forKey:@"city_id"];
    [request setParameter:[SharedSingleton singleton].userInfo.userKey forKey:@"key"];
    [request startRequest];
}

- (void)populateInfo:(NSDictionary *)dict {
 
    for (NSDictionary *dictionary in [dictionary objectForKey:@"teachers"]) {
        
        [_teachers addObject:[[Substitute alloc] initWithDictionary:dictionary]];
    }
    [_delegate substituteRequestDidSucceded:self];
}

- (void)requestDidSucceed:(RequestHandler *)request {
    
    [self populateInfo:request.responseData];
}

- (void)requestDidFailed:(RequestHandler *) request withError:(NSError*) error {
}


@end
