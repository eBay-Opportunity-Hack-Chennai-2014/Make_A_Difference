//
//  Absentee.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Absentee : NSObject

@property (nonatomic, copy) NSString *centerName;
@property (nonatomic, copy) NSString *classTime;
@property (nonatomic, copy) NSString *absenteeName;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
