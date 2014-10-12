//
//  Teacher.h
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 11/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject

@property (nonatomic, copy) NSString *teacherId;
@property (nonatomic, copy) NSString *teacherName;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *substitute;
@property (nonatomic, copy) NSString *substituteId;
@property (nonatomic, copy) NSString *userType;
@property (nonatomic, copy) NSString *zeroHourAttendance;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
