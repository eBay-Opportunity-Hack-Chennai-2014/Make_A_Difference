//
//  AbsenteeViewController.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "AbsenteeViewController.h"
#import "AbsenteeRequest.h"
#import "MBProgressHUD.h"

@interface AbsenteeViewController ()<AbsenteeRequestRequestDelegate>

@end

@implementation AbsenteeViewController


+ (AbsenteeViewController *)viewController {
    AbsenteeViewController *absent = [[AbsenteeViewController alloc] initWithNibName:@"AbsenteeViewController" bundle:nil];
    return absent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    AbsenteeRequest *request = [[AbsenteeRequest alloc] initWithDelegate:self];
    [request startRequest];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self. navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [absenteeTableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AbsenteeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        [[NSBundle mainBundle]loadNibNamed:@"AbsenteeTableViewCell" owner:self options:nil];
        cell = customCell;
        customCell = nil;
    }
    
    [cell cellConfiguratinWithAbsentee:[absenteeTableData objectAtIndex:indexPath.row]];
    
    
    return cell;
}



#pragma mark Absentee Request Delegate

- (void)absenteeRequestDidSucceded:(AbsenteeRequest *)absenteeRequest {
    absenteeTableData = absenteeRequest.absenteeArray;
    [absenteeTableView reloadData];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void)absenteeRequestDidFailed:(AbsenteeRequest *)absenteeRequest withError:(NSString *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self alertWithMessage:error];
}

- (void)alertWithMessage:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
