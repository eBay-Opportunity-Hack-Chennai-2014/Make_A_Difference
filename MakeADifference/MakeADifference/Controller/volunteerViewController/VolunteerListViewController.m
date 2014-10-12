//
//  VolunteerViewController.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "VolunteerListViewController.h"
#import "MBProgressHUD.h"

@interface VolunteerListViewController ()

@end

@implementation VolunteerListViewController

+ (VolunteerListViewController *)viewController {
    
    VolunteerListViewController *viewController = [[VolunteerListViewController alloc] initWithNibName:@"VolunteerListViewController" bundle:nil];
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    volunteerTableData = [[NSArray alloc] init];
    [self styleTableView];
    
    VolunteerRequest *request = [[VolunteerRequest alloc] initWithDelegate:self];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [request startRequest];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)styleTableView {
    [volunteerTableView setShowsVerticalScrollIndicator:NO];
    volunteerTableView.tableFooterView = [[UIView alloc] init];
    [self.searchDisplayController.searchResultsTableView setRowHeight:volunteerTableView.rowHeight];
}

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [self.filterVolunteerArray count];
    }
    else
    {
        return [volunteerTableData count];

    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VolunteerTableViewCell *cell = [volunteerTableView dequeueReusableCellWithIdentifier:@"cell"];

    if(cell == nil) {
        [[NSBundle mainBundle]loadNibNamed:@"VolunteerTableViewCell" owner:self options:nil];
        cell = customCell;
        customCell = nil;
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
           [cell cellConfiguration:[self.filterVolunteerArray objectAtIndex:indexPath.row]];
    }
    else
    {
          [cell cellConfiguration:[volunteerTableData objectAtIndex:indexPath.row]];
    }

    return cell;
}

#pragma mark - volunteer request

- (void)volunteerRequestDidSucceded:(VolunteerRequest *)volunteerRequest {
    
    volunteerTableData = [volunteerRequest.volunteerArray copy];
    [volunteerTableView reloadData];
    [MBProgressHUD hideHUDForView:self.view animated:YES];

}
- (void)volunteerRequestDidFailed:(VolunteerRequest *)VolunteerRequest withError:(NSString *)error {
    [self alertWithMessage:error];
    [MBProgressHUD hideHUDForView:self.view animated:YES];

}

- (void)alertWithMessage:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    [self.filterVolunteerArray removeAllObjects];
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"volunteerName contains[c] %@", searchText];
    self.filterVolunteerArray = [NSMutableArray arrayWithArray:[volunteerTableData filteredArrayUsingPredicate:resultPredicate]];
}


#pragma mark - UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}



- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
