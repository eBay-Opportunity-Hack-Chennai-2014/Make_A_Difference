//
//  ClassHistoryViewController.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "ClassHistoryViewController.h"
#import "MBProgressHUD.h"

@interface ClassHistoryViewController ()

@end

@implementation ClassHistoryViewController

+ (ClassHistoryViewController *)viewController {
    ClassHistoryViewController *classViewController = [[ClassHistoryViewController alloc] initWithNibName:@"ClassHistoryViewController" bundle:nil];
    return classViewController;
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ClassHistoryRequest *classHistoryRequest = [[ClassHistoryRequest alloc] initWithDelegate:self];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [classHistoryRequest startRequest];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [classHistoryTableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ClassHistoryTableViewCell *cell = [classHistoryTableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"ClassHistoryTableViewCell" owner:self options:nil];
        cell = customCell;
        customCell = nil;
    }
    
    [cell cellConfigurationWithClassHistory:[classHistoryTableData objectAtIndex:indexPath.row]];
    
    return cell;
}


#pragma mark credithistory delegate

- (void)classHistoryRequestDidSucceded:(ClassHistoryRequest *)classHistoryRequest {
    
    classHistoryTableData = [classHistoryRequest.classHistoryArray copy];
    [classHistoryTableView reloadData];
       [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)classHistoryRequestDidFailed:(ClassHistoryRequest *)classHistoryRequest withError:(NSString *)error {
        [self alertWithMessage:error];
       [MBProgressHUD hideHUDForView:self.view animated:YES];
}


- (void)alertWithMessage:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
@end
