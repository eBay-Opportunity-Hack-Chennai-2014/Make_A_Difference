//
//  Credit.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "Credit.h"

@implementation Credit
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super self];
    
    if (self) {
        self.credit = [self validateData:[dictionary objectForKey:@"credit"]];
        self.volunteerName = [self validateData:[dictionary objectForKey:@"name"]];
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
