//
//  AbsenteeTableViewCell.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Absentee.h"

@interface AbsenteeTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *absenteeName;
@property (nonatomic, strong) IBOutlet UILabel *classCenter;
@property (nonatomic, strong) IBOutlet UILabel *time;

- (void)cellConfiguratinWithAbsentee:(Absentee *)absentee;


@end
