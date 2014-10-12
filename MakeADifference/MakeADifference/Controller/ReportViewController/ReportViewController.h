//
//  ReportViewController.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportViewController : UIViewController

- (IBAction)leaderBoardAction:(id)sender;
- (IBAction)lowCreditAction:(id)sender;
- (IBAction)absenteeAction:(id)sender;

+ (ReportViewController *)viewController;
- (IBAction)backAction:(id)sender;

@end
