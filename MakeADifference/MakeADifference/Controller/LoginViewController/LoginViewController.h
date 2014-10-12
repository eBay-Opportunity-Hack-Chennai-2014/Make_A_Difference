//
//  LoginViewController.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginRequest.h"

@interface LoginViewController : UIViewController <LoginRequestDelegate> {
    __weak IBOutlet UITextField *usernameTextField;
    __weak IBOutlet UITextField *passwordTextField;
}
+ (LoginViewController *)viewController;
- (IBAction)loginPressed:(id)sender;

@end
