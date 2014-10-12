//
//  AttendanceCell.m
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 11/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "AttendanceCell.h"

@implementation AttendanceCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)CancellationProcess:(id)sender {
    
    
}

- (IBAction)UndoCancel:(id)sender {
    
    
}

- (void)setLevel:(Level *)level {
    
    _level = level;
    _levelName.text = [NSString stringWithFormat:@"Level %@", _level.levelName];
    _cancelClass.hidden = _level.classStatus.intValue ? NO : YES;
    _undoClass.hidden = _level.classStatus.intValue ? YES : NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
