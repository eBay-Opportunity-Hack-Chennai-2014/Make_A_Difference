//
//  Lesson.h
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 11/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lesson : NSObject

@property (nonatomic, copy) NSString *unitName;
@property (nonatomic, copy) NSString *unitId;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
