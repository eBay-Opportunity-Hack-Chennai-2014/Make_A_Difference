//
//  LeaderBoardViewController.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "CreditViewController.h"

@interface LeaderBoardViewController : CreditViewController {
    
    __weak IBOutlet UITableView *leaderboardTableView;
}
+ (LeaderBoardViewController *)viewController;

- (IBAction)backAction:(id)sender;

@end
