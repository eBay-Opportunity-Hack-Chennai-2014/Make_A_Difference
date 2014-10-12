//
//  Teacher.m
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 11/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        
        self.teacherId = [dict objectForKey:@"id"];
        self.teacherName = [dict objectForKey:@"name"];
        self.status = [dict objectForKey:@"status"];
        self.substitute = [dict objectForKey:@"substitute"];
        self.substituteId = [dict objectForKey:@"substitute_id"];
        self.userType = [dict objectForKey:@"user_type"];
        self.zeroHourAttendance = [dict objectForKey:@"zero_hour_attendance"];
    }
    
    return self;
}

@end
