//
//  ViewController_Signin.m
//  Assignment_2
//
//  Created by aliasagar abadani on 3/17/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import "ViewController_SignUp.h"


@interface ViewController_SignUp ()

@end

@implementation ViewController_SignUp
@synthesize Male,Female;
- (void)viewDidLoad {
    [super viewDidLoad];

    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)toggleMaleRadioButton:(UIButton *)sender {
    
    if([Male isSelected]== TRUE){
        [Male setSelected:NO];
        [Female setSelected:YES];
    }
    else{
        [Male setSelected:YES];
        [Female setSelected:NO];
    }
}

- (IBAction)toggleFemaleRadioButton:(UIButton *)sender {
    if([Female isSelected]== TRUE){
        [Female setSelected:NO];
        [Male setSelected:YES];
    }
    else{
        [Female setSelected:YES];
        [Male setSelected:NO];
    }
}

- (IBAction)OpenSignIn:(UIButton *)sender {
    ViewController_SignUp *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [dvc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:dvc animated:YES completion:nil];
}
@end
