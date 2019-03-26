//
//  EditEmployeeViewController.h
//  Assignment_6
//
//  Created by aliasagar abadani on 3/25/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditEmployeeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *employeeIdTF;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *positionTF;
@property (weak, nonatomic) IBOutlet UIButton *MaleBtn;
@property (weak, nonatomic) IBOutlet UIButton *FemaleBtn;
@property (weak, nonatomic) IBOutlet UITextField *addressTF;

- (IBAction)updateEmployeeDetails:(UIButton *)sender;
- (IBAction)maleToggle:(UIButton *)sender;
- (IBAction)femaleToggle:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end
