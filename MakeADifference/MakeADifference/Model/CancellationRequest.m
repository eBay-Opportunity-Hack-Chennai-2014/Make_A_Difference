//
//  CancellationRequest.m
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 12/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "CancellationRequest.h"
#import "SharedSingleton.h"
#import "Macros.h"

@implementation CancellationRequest

- (instancetype)initWithLevel:(Level *)level; {
    
    self = [super init];
    if (self) {
        
        _level = level;
    }
    
    return self;
}

- (void)startRequestWith:(NSString *)classType {
    
    RequestHandler *request = [[RequestHandler alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BASEURL,classType]] delegate:self];
    [request setParameter:_level.classId forKey:@"class_id"];
    [request setParameter:[SharedSingleton singleton].userInfo.userKey forKey:@"key"];
    [request startRequest];
}

@end
