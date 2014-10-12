//
//  Volunteer.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "Volunteer.h"

@implementation Volunteer

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super self];
    
    if (self) {
        self.volunteerID = [self validateData:[dictionary objectForKey:@"id"]];
        self.volunteerName = [self validateData:[dictionary objectForKey:@"name"]];
        self.emailID = [self validateData:[dictionary objectForKey:@"email"]];
        self.phoneNumber = [self validateData:[dictionary objectForKey:@"phone"]];
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
