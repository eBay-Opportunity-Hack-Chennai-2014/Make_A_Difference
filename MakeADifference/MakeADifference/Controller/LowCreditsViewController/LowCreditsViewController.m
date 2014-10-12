//
//  LowCreditsViewController.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "LowCreditsViewController.h"
#import "LowCreditRequest.h"
#import "MBProgressHUD.h"

@interface LowCreditsViewController () <LowCreditRequestDelegate>

@end

@implementation LowCreditsViewController

+ (LowCreditsViewController *)viewController {
    LowCreditsViewController *lowCreditsViewController = [[LowCreditsViewController alloc] initWithNibName:@"LowCreditsViewController" bundle:[NSBundle mainBundle]];
    return lowCreditsViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    LowCreditRequest *lowCreditRequet = [[LowCreditRequest alloc] initWithDelegate:self];
    [lowCreditRequet startRequest];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self. navigationController popViewControllerAnimated:YES];
}

#pragma mark 

- (void)lowCreditRequestDidSucceded:(LowCreditRequest *)lowCreditRequest {
    self.creditTableData = lowCreditRequest.creditsArray;
    [lowCreditTableView reloadData];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void)lowCreditRequestDidFailed:(LowCreditRequest *)lowCreditRequest withError:(NSString *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self alertWithMessage:error];
}

- (void)alertWithMessage:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
