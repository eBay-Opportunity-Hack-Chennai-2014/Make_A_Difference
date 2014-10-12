//
//  CreditViewController.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "CreditHistoryViewController.h"
#import "MBProgressHUD.h"

@interface CreditHistoryViewController ()

@end

@implementation CreditHistoryViewController

+ (CreditHistoryViewController *)viewController {
    
    CreditHistoryViewController *creditHistoryViewController = [[CreditHistoryViewController alloc] initWithNibName:@"CreditHistoryViewController" bundle:nil];
    return creditHistoryViewController;
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CreditHistoryRequest *request =[[CreditHistoryRequest alloc] initWithDelegate:self];
    [request startRequest];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [creditHistoryTableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CreditHistoryTableViewCell *cell = [creditHistoryTableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        [[NSBundle mainBundle]loadNibNamed:@"CreditHistoryTableViewCell" owner:self options:nil];
        cell = customCell;
        customCell = nil;
    }

    [cell cellConfigurationWithClassHistory:[creditHistoryTableData objectAtIndex:indexPath.row]];

    
    return cell;
}


#pragma mark credithistory delegate

- (void)creditRequestDidSucceded:(CreditHistoryRequest *)creditRequest {
    creditHistoryTableData = [creditRequest.creditHistoryArray copy];
    [creditHistoryTableView reloadData];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}
- (void)creditRequestDidFailed:(CreditHistoryRequest *)creditRequest withError:(NSString *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
       [self alertWithMessage:error];
}

- (void)alertWithMessage:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
