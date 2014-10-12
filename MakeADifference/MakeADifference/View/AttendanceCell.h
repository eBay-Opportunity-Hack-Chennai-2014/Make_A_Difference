//
//  AttendanceCell.h
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 11/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Level.h"

@interface AttendanceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *undoClass;
@property (weak, nonatomic) IBOutlet UIButton *cancelClass;
@property (weak, nonatomic) IBOutlet UILabel *levelName;

@property (nonatomic, readwrite) Level *level;

@end
