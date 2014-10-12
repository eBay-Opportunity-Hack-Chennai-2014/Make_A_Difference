//
//  CreditTableViewCell.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "CreditHistoryTableViewCell.h"

@implementation CreditHistoryTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)cellConfigurationWithClassHistory:(CreditHistory *)classHistory {
    
    self.credits.text = [NSString stringWithFormat:@"Total Credits: %@", classHistory.credit];
    self.creditChange.text = [NSString stringWithFormat:@"Change: %@",classHistory.creditChange];
    self.time.text = classHistory.classTime;
    self.classStatus.text = [NSString stringWithFormat:@"Status: %@",classHistory.classStatus];
}

@end
