//
//  Level.h
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 11/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Level : NSObject

@property (nonatomic, copy) NSString *classId;
@property (nonatomic, copy) NSString *lessonId;
@property (nonatomic, copy) NSString *levelId;
@property (nonatomic, copy) NSString *classStatus;
@property (nonatomic, copy) NSString *levelName;
@property (nonatomic, copy) NSArray *allLessons;
@property (nonatomic, copy) NSArray *teachers;
@property (nonatomic, copy) NSString *studentAttendance;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
