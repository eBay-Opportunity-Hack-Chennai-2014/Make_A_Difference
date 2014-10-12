//
//  AttendanceDetailsViewController.m
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 12/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "AttendanceDetailsViewController.h"
#import "NetworkHandler.h"
#import "AppDelegate.h"

@interface AttendanceDetailsViewController (){
    
    NSArray *_substitutes;
}

@property (weak, nonatomic) IBOutlet UIButton *unitTaught;
@property (weak, nonatomic) IBOutlet UIButton *studentsAttended;
@property (weak, nonatomic) IBOutlet UILabel *noOfTeachers;
@property (weak, nonatomic) IBOutlet UIButton *substitute;
@property (weak, nonatomic) IBOutlet UIButton *attendance;
@property (weak, nonatomic) IBOutlet UIButton *zeroHours;

@end

@implementation AttendanceDetailsViewController

+ (AttendanceDetailsViewController *)viewController {
    
    AttendanceDetailsViewController *attendanceDetailsView = [[AttendanceDetailsViewController alloc] initWithNibName:@"AttendanceDetailsViewController" bundle:[NSBundle mainBundle]];
    return attendanceDetailsView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _studentsAttended.titleLabel.text = _level.studentAttendance;
    _noOfTeachers.text = _level.teachers.description;
    if ([NetworkHandler checkInternet]) {
        
        SubstituteRequest *substituteRequest = [[SubstituteRequest alloc] initWithDelegate:self];
        [substituteRequest startRequest];
    } else {
        
        [[AppDelegate appDelegate] showAlert:@"Connection Error!" withText:@"No internet connection."];
    }
}

- (IBAction)ZeroHours:(id)sender {
    
    _zeroHours.selected = [sender isSelected] ? NO : YES;
    _zeroHours.titleLabel.text = _zeroHours.isSelected ? @"No" : @"Yes";
}

- (IBAction)AttendanceSelection:(id)sender {
    
    _attendance.selected = [sender isSelected] ? NO : YES;
    _attendance.titleLabel.text = _attendance.isSelected ? @"Absent" : @"Attended";
}

- (IBAction)Substitute:(id)sender {
}

- (IBAction)UnitTaught:(id)sender {
}

- (IBAction)StudentsAttended:(id)sender {
    
}

- (IBAction)Save:(id)sender {
}

- (void)substituteRequestDidSucceded:(SubstituteRequest *)substituteRequest {
    
    _substitutes = substituteRequest.teachers;
}

- (void)substituteRequestdidFailed:(SubstituteRequest *)substituteRequest withError:(NSString *)error {
    
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
