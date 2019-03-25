//
//  ViewController.m
//  Assignment_2
//
//  Created by aliasagar abadani on 3/15/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)OpenSignUp:(UIButton *)sender {
    ViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController_SignUp"];
    [dvc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:dvc animated:YES completion:nil];
}
@end
