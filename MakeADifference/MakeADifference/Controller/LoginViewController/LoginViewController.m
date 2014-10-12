//
//  LoginViewController.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

+ (LoginViewController *)viewController {
    
    LoginViewController *loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    return loginViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginPressed:(id)sender {
//
//    LoginRequest *loginRequest = [[LoginRequest alloc] initWithDelegate:self];
////    [loginRequest startRequestWithUsername:@"fiona.annette.0110@gmail.com" password:@"pass"];
//      [loginRequest startRequestWithUsername:@"mynamesrk@gmail.com" password:@"pass"];
    
    if ([self validateCredentials] == YES) {
        LoginRequest *loginRequest = [[LoginRequest alloc] initWithDelegate:self];
        [loginRequest startRequestWithUsername:usernameTextField.text password:passwordTextField.text];        
    }
    
}

- (BOOL)validateCredentials
{
    if (usernameTextField.text.length == 0 && [usernameTextField.text isEqualToString:@""]) {
        [self alertWithMessage:@"Please enter username"];
        return NO;
        
    } else if (passwordTextField.text.length == 0 && [passwordTextField.text isEqualToString:@""]){
        [self alertWithMessage:@"Please enter password"];
        return NO;
    } else {
        return YES;
    }
}

- (void)alertWithMessage:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - Text Field and Text View

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

#pragma mark loginRequestDelegate

- (void)loginRequestDidSucceded:(LoginRequest *)loginRequest {

    [self.navigationController pushViewController:[HomeViewController viewController] animated:YES];
}

- (void)loginRequestdidFailed:(LoginRequest *)loginRequest withError:(NSString *)error {
    
    [self alertWithMessage:error];
}

@end
