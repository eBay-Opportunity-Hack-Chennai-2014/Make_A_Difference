//
//  ClassHistory.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "ClassHistory.h"

@implementation ClassHistory

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super self];
    
    if (self) {
        self.center = [self validateData:[dictionary objectForKey:@"center"]];
        self.level = [self validateData:[dictionary objectForKey:@"level"]];
        self.status = [self validateData:[dictionary objectForKey:@"status"]];
        self.substitute = [self validateData:[dictionary objectForKey:@"substitute"]];
        self.teacher = [self validateData:[dictionary objectForKey:@"teacher"]];
        self.time = [self validateData:[dictionary objectForKey:@"time"]];
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
