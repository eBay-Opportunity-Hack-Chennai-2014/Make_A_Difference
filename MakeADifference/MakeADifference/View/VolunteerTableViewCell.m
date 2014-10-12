//
//  VolunteerTableViewCell.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "VolunteerTableViewCell.h"

@implementation VolunteerTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)cellConfiguration:(Volunteer *)volunteer {
    
    self.volunteerName.text = [volunteer.volunteerName capitalizedString];
    self.volunteerPhoneNumber.text = volunteer.phoneNumber;
    self.volunteerEmail.text = [volunteer.emailID lowercaseString];
}

@end
