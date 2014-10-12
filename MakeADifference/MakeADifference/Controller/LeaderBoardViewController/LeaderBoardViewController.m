//
//  LeaderBoardViewController.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "LeaderBoardViewController.h"
#import "LeaderBoardRequest.h"
#import "MBProgressHUD.h"

@interface LeaderBoardViewController ()<LeaderBoardRequestDelegate>

@end

@implementation LeaderBoardViewController

+ (LeaderBoardViewController *)viewController {
    LeaderBoardViewController *leaderBoard = [[LeaderBoardViewController alloc] initWithNibName:@"LeaderBoardViewController" bundle:[NSBundle mainBundle]];
    return leaderBoard;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    LeaderBoardRequest *leaderBoard = [[LeaderBoardRequest alloc] initWithDelegate:self];
    [leaderBoard startRequest ];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self. navigationController popViewControllerAnimated:YES];
}

#pragma mark leaderBoard request delegate
- (void)leaderBoardRequestDidSucceded:(LeaderBoardRequest *)leaderBoardRequest {
    
    self.creditTableData = leaderBoardRequest.creditsArray;
    [leaderboardTableView reloadData];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}
- (void)leaderBoardRequesttDidFailed:(LeaderBoardRequest *)leaderBoardRequest withError:(NSString *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self alertWithMessage:error];
}

- (void)alertWithMessage:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
