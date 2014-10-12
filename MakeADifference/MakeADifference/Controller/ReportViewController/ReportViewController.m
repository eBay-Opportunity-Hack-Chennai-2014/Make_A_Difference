//
//  ReportViewController.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "ReportViewController.h"
#import "LeaderBoardViewController.h"
#import "LowCreditsViewController.h"
#import "AbsenteeViewController.h"

@interface ReportViewController ()

@end

@implementation ReportViewController

+ (ReportViewController *)viewController {
    ReportViewController *reportViewController = [[ReportViewController alloc] initWithNibName:@"ReportViewController" bundle:nil];
    return reportViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)leaderBoardAction:(id)sender {
    [self.navigationController pushViewController:[LeaderBoardViewController viewController] animated:YES];
}

- (IBAction)lowCreditAction:(id)sender {
    [self.navigationController pushViewController:[LowCreditsViewController viewController] animated:YES];
}

- (IBAction)absenteeAction:(id)sender {
    [self.navigationController pushViewController:[AbsenteeViewController viewController] animated:YES];
}


- (IBAction)backAction:(id)sender {
    [self. navigationController popViewControllerAnimated:YES];
}
@end
