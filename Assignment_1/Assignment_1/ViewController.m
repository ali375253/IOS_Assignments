//
//  ViewController.m
//  Assignment_1
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
}

@synthesize showText;
- (IBAction)showTextOnLabel{
    showText.text = textField.text;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
