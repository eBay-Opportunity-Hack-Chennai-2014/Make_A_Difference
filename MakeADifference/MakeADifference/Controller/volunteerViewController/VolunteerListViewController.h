//
//  VolunteerViewController.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VolunteerRequest.h"
#import "VolunteerTableViewCell.h"

@interface VolunteerListViewController : UIViewController <VolunteerRequestDelegate, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate> {
    
    IBOutlet VolunteerTableViewCell *customCell;
    __weak IBOutlet UITableView *volunteerTableView;
    __weak IBOutlet UISearchBar *volunteerSearchBar;
    NSArray *volunteerTableData;
}
+ (VolunteerListViewController *)viewController;
@property (strong,nonatomic) NSMutableArray *filterVolunteerArray;
- (IBAction)backAction:(id)sender;


@end
