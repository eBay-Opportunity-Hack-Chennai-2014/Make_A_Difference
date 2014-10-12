//
//  Absentee.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "Absentee.h"

@implementation Absentee

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super self];
    
    if (self) {
        self.centerName = [self validateData:[dictionary objectForKey:@"center_name"]];
        self.classTime = [self validateData:[dictionary objectForKey:@"class_nime"]];
        self.absenteeName = [self validateData:[dictionary objectForKey:@"name"]];
     
    }
    return self;
}

- (NSString *)validateData:(NSString *)text {
    
    if([text isEqual:[NSNull null]]||text==nil||text==NULL)
        return @"";
    else
        return text;
}


@end
