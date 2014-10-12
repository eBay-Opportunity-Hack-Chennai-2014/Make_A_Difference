//
//  CreditViewController.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "CreditViewController.h"
#import "Credit.h"

@interface CreditViewController ()

@end

@implementation CreditViewController

+ (CreditViewController *)viewController {
    CreditViewController *creditViewController = [[CreditViewController alloc] initWithNibName:@"CreditViewController" bundle:nil];
    return creditViewController;
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

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.creditTableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    Credit *credit = [self.creditTableData objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Name: %@", credit.volunteerName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Credit Point: %@", credit.credit];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir" size:16];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Avenir" size:14];
    
//    [cell cellConfigurationWithClassHistory:[classHistoryTableData objectAtIndex:indexPath.row]];
    
    return cell;
}


@end
