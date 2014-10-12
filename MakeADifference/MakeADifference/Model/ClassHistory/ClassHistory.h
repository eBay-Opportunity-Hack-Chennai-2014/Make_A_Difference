//
//  ClassHistory.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassHistory : NSObject

@property (nonatomic, copy) NSString *center;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *substitute;
@property (nonatomic, copy) NSString *teacher;
@property (nonatomic, copy) NSString *time;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
