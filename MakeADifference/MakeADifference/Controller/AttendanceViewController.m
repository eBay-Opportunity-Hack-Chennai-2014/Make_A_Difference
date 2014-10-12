//
//  AttendanceViewController.m
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 11/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "AttendanceViewController.h"
#import "AttendanceDetailsViewController.h"
#import "GetBatchRequest.h"
#import "NetworkHandler.h"
#import "AppDelegate.h"

@interface AttendanceViewController () {
    
    NSArray *_levels;
}

@property (weak, nonatomic) IBOutlet UITableView *attendanceTable;

@end

@implementation AttendanceViewController

+ (AttendanceViewController *)viewController {
    
    AttendanceViewController *attendanceView = [[AttendanceViewController alloc] initWithNibName:@"AttendanceViewController" bundle:[NSBundle mainBundle]];
    return attendanceView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if ([NetworkHandler checkInternet]) {
        
        GetBatchRequest *getBatchRequest = [[GetBatchRequest alloc] initWithDelegate:self];
        [getBatchRequest startRequest];
    } else {
        
        [[AppDelegate appDelegate] showAlert:@"Connection Error!" withText:@"No internet connection."];
    }
}

- (void)batchRequestDidSucceded:(GetBatchRequest *)batchRequest {
    
    _levels = batchRequest.levels;
    [self.attendanceTable reloadData];
}

- (void)batchRequestdidFailed:(GetBatchRequest *)batchRequest withError:(NSString *)error {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _levels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AttendanceCell *cell = (AttendanceCell *)[tableView dequeueReusableCellWithIdentifier:@"LevelCell"];
    if (cell == nil) {
        
        [[NSBundle mainBundle] loadNibNamed:@"AttendanceCell" owner:self options:nil];
        cell = self.attendanceCell;
        self.attendanceCell = nil;
    }
    cell.level = [_levels objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AttendanceDetailsViewController *attendanceDetailsView = [AttendanceDetailsViewController viewController];
    attendanceDetailsView.level = [_levels objectAtIndex:indexPath.row];;
    [self.navigationController pushViewController:attendanceDetailsView animated:YES];
}

- (IBAction)Back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
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

@end
