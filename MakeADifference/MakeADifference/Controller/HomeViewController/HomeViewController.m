//
//  HomeViewController.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "HomeViewController.h"
#import "AttendanceViewController.h"
#import "ClassHistoryViewController.h"
#import "CreditHistoryViewController.h"
#import "VolunteerListViewController.h"
#import "AbsenteeViewController.h"
#import "ReportViewController.h"
#import "SharedSingleton.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

+ (HomeViewController *)viewController {
    
    HomeViewController *homeViewController = [[HomeViewController alloc] initWithNibName:[SharedSingleton singleton].userInfo.mentor.intValue ? @"MentorViewController" : @"VolunteerViewController" bundle:[NSBundle mainBundle]];
    return homeViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)Attendance:(id)sender {
    
    [self.navigationController pushViewController:[AttendanceViewController viewController] animated:YES];
}

- (IBAction)ClassHistory:(id)sender {
    
     [self.navigationController pushViewController:[ClassHistoryViewController viewController] animated:YES];
}

- (IBAction)CreditHistory:(id)sender {
     [self.navigationController pushViewController:[CreditHistoryViewController viewController] animated:YES];
}

- (IBAction)VolunteerDatabase:(id)sender {
     [self.navigationController pushViewController:[VolunteerListViewController viewController] animated:YES];
}

- (IBAction)reportAction:(id)sender {
    [self.navigationController pushViewController:[ReportViewController viewController] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
