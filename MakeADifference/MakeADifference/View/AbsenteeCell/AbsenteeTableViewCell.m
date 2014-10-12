//
//  AbsenteeTableViewCell.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "AbsenteeTableViewCell.h"

@implementation AbsenteeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)cellConfiguratinWithAbsentee:(Absentee *)absentee {
    self.absenteeName.text = absentee.absenteeName;
    self.classCenter.text = absentee.centerName;
    self.time.text = absentee.classTime;
}

@end
