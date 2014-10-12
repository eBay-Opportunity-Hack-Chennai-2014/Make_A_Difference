//
//  ClassHistoryTableViewCell.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "ClassHistoryTableViewCell.h"

@implementation ClassHistoryTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)cellConfigurationWithClassHistory:(ClassHistory *)classHistory {
    
    self.classCenter.text = [NSString stringWithFormat:@"%@", classHistory.center];
    self.level.text = [NSString stringWithFormat:@"%@", classHistory.level];
    
    if ([classHistory.substitute isEqualToString:@""]) {
          self.status.text = [NSString stringWithFormat:@"%@", classHistory.status];
    } else {status:
          self.status.text = [NSString stringWithFormat:@"Subsituted by %@",classHistory.substitute];
    }
    self.time.text = [NSString stringWithFormat:@"%@", classHistory.time];
  
}

@end
