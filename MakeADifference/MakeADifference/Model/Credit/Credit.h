//
//  Credit.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Credit : NSObject
@property (nonatomic, copy) NSString *credit;
@property (nonatomic, copy) NSString *volunteerName;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
