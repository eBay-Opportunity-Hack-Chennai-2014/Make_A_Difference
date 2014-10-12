//
//  Lesson.m
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 11/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "Lesson.h"

@implementation Lesson

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        
        self.unitId = [dict objectForKey:@"unit_id"];
        self.unitName = [dict objectForKey:@"unit_name"];
    }
    
    return self;
}

@end
