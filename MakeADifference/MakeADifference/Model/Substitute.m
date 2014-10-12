//
//  Substitute.m
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 12/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "Substitute.h"

@implementation Substitute

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        
        self.substituteId = [dict objectForKey:@"id"];
        self.substituteName = [dict objectForKey:@"name"];
    }
    
    return self;
}

@end
