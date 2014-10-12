//
//  VolunteerTableViewCell.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Volunteer.h"

@interface VolunteerTableViewCell : UITableViewCell

@property (nonatomic, strong)IBOutlet UILabel *volunteerName;
@property (nonatomic, strong)IBOutlet UILabel *volunteerEmail;
@property (nonatomic, strong)IBOutlet UILabel *volunteerPhoneNumber;

- (void)cellConfiguration:(Volunteer *)volunteer;

@end
