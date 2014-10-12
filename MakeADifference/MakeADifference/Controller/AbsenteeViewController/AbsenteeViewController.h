//
//  AbsenteeViewController.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "CreditViewController.h"
#import "AbsenteeTableViewCell.h"

@interface AbsenteeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>  {
    
    IBOutlet AbsenteeTableViewCell *customCell;
    __weak IBOutlet UILabel *title;
    __weak IBOutlet UITableView *absenteeTableView;
    NSArray *absenteeTableData;
}

- (IBAction)backAction:(id)sender;
+ (AbsenteeViewController *)viewController;



@end
