//
//  ClassHistoryViewController.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassHistoryTableViewCell.h"
#import "ClassHistoryRequest.h"

@interface ClassHistoryViewController : UIViewController <ClassHistoryRequestDelegate> {

    __weak IBOutlet UITableView *classHistoryTableView;
    IBOutlet ClassHistoryTableViewCell *customCell;
     NSArray *classHistoryTableData;
}
+ (ClassHistoryViewController *)viewController;
- (IBAction)backAction:(id)sender;

@end
