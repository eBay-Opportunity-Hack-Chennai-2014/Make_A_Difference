//
//  AttendanceDetailsViewController.h
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 12/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubstituteRequest.h"
#import "Level.h"

@interface AttendanceDetailsViewController : UIViewController <SubstituteRequestDelegate> 

@property (nonatomic, readwrite) Level *level;

+ (AttendanceDetailsViewController *)viewController;

@end
