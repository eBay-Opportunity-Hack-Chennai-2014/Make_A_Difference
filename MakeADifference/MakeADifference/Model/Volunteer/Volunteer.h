//
//  Volunteer.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Volunteer : NSObject
@property (nonatomic, copy) NSString *volunteerID;
@property (nonatomic, copy) NSString *volunteerName;
@property (nonatomic, copy) NSString *emailID;
@property (nonatomic, copy) NSString *phoneNumber;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
