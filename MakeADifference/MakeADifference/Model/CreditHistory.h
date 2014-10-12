//
//  CreditHistory.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreditHistory : NSObject
@property (nonatomic, copy) NSString *credit;
@property (nonatomic, copy) NSString *classStatus;
@property (nonatomic, copy) NSString *classTime;
@property (nonatomic, copy) NSString *creditChange;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
