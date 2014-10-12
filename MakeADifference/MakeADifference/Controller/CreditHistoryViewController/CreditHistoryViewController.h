//
//  CreditViewController.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreditHistoryRequest.h"
#import "CreditHistoryTableViewCell.h"

@interface CreditHistoryViewController : UIViewController <CreditHistoryRequestDelegate,UITableViewDataSource, UITableViewDelegate> {

    IBOutlet CreditHistoryTableViewCell *customCell;
    __weak IBOutlet UITableView *creditHistoryTableView;
     NSArray *creditHistoryTableData;
}
+ (CreditHistoryViewController *)viewController;

- (IBAction)backAction:(id)sender;

@end
