//
//  ClassHistoryTableViewCell.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassHistory.h"

@interface ClassHistoryTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *classCenter;
@property (nonatomic, strong) IBOutlet UILabel *level;
@property (nonatomic, strong) IBOutlet UILabel *status;
@property (nonatomic, strong) IBOutlet UILabel *time;
- (void)cellConfigurationWithClassHistory:(ClassHistory *)classHistory;
@end
