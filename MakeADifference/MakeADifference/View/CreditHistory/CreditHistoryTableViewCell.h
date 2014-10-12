//
//  CreditTableViewCell.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreditHistory.h"

@interface CreditHistoryTableViewCell : UITableViewCell
- (void)cellConfigurationWithClassHistory:(CreditHistory *)classHistory;
@property (nonatomic, strong) IBOutlet UILabel *credits;
@property (nonatomic, strong) IBOutlet UILabel *creditChange;
@property (nonatomic, strong) IBOutlet UILabel *time;
@property (nonatomic, strong) IBOutlet UILabel *classStatus;


@end
