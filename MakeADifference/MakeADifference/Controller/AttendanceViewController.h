//
//  AttendanceViewController.h
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 11/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttendanceCell.h"
#import "GetBatchRequest.h"

@interface AttendanceViewController : UIViewController <GetBatchRequestDelegate>

@property (weak, nonatomic) IBOutlet AttendanceCell *attendanceCell;

+ (AttendanceViewController *)viewController;

@end
