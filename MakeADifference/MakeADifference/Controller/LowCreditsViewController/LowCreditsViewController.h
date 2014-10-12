//
//  LowCreditsViewController.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "CreditViewController.h"

@interface LowCreditsViewController : CreditViewController {
    
    __weak IBOutlet UITableView *lowCreditTableView;
    
}
- (IBAction)backAction:(id)sender;
+ (LowCreditsViewController *)viewController;
@end
