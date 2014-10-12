//
//  Level.m
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 11/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "Level.h"
#import "Lesson.h"
#import "Teacher.h"

@implementation Level

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        
        self.classId = [dict objectForKey:@"id"];
        self.lessonId = [dict objectForKey:@"lesson_id"];
        self.levelId = [dict objectForKey:@"level_id"];
        self.levelName = [dict objectForKey:@"level_name"];
        self.classStatus = [dict objectForKey:@"class_status"];
        self.studentAttendance = [dict objectForKey:@"student_attendence"];
        self.allLessons = [self populateLessons:[dict objectForKey:@"all_lessons"]];
        self.teachers = [self populateTeachers:[dict objectForKey:@"teachers"]];
    }
    
    return self;
}

- (NSArray *)populateLessons:(NSArray *)lessonsArray {
    
    NSMutableArray *lessons = [NSMutableArray array];
    for (NSDictionary *dict in lessonsArray) {
        
        Lesson *lesson = [[Lesson alloc] initWithDictionary:dict];
        [lessons addObject:lesson];
    }
    
    return lessons;
}

- (NSArray *)populateTeachers:(NSArray *)teacherArray {
    
    NSMutableArray *teachers = [NSMutableArray array];
    for (NSDictionary *dict in teacherArray) {
        
        Teacher *teacher = [[Teacher alloc] initWithDictionary:dict];
        [teachers addObject:teacher];
    }
    
    return teachers;
}

@end
