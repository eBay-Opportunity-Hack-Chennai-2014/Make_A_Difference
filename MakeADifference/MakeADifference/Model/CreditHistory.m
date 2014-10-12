//
//  CreditHistory.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "CreditHistory.h"

@implementation CreditHistory

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super self];
    
    if (self) {
        self.credit = [self validateData:[dictionary objectForKey:@"Credit"]];
        self.classStatus = [self validateData:[dictionary objectForKey:@"class_status"]];
        self.classTime = [self validateData:[dictionary objectForKey:@"class_time"]];
        self.creditChange = [self validateData:[dictionary objectForKey:@"credit_change"]];
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
