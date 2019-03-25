//
//  AddEmployeeViewController.h
//  Assignment_6
//
//  Created by aliasagar abadani on 3/22/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEmployeeViewController : UIViewController
@property(strong,retain)NSMutableArray *employeesArray;

@property (weak, nonatomic) IBOutlet UIButton *Male;
@property (weak, nonatomic) IBOutlet UIButton *Female;
- (IBAction)toggleMaleRadioButton:(UIButton *)sender;
- (IBAction)toggleFemaleRadioButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *employeeIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *positionTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
- (IBAction)addEmployeeDetails:(UIButton *)sender;




@end
