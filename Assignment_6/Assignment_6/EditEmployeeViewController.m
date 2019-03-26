//
//  EditEmployeeViewController.m
//  Assignment_6
//
//  Created by aliasagar abadani on 3/25/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import "EditEmployeeViewController.h"

@interface EditEmployeeViewController (){
    NSUserDefaults *defaults;
    NSString *empData;
}

@end

@implementation EditEmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
    empData=[defaults objectForKey:@"empData"];
    NSArray *emp=[empData componentsSeparatedByString:@"/"];
    _employeeIdTF.text=[emp objectAtIndex:0];
    _nameTF.text=[emp objectAtIndex:1];
    self.title=_nameTF.text;
    _positionTF.text=[emp objectAtIndex:2];
    NSString *gender=[emp objectAtIndex:3];
    NSString *value=@"Male";
    if ([value isEqualToString:gender]){
        [_MaleBtn setSelected: YES];
        [_FemaleBtn setSelected: NO];
    }
    else{
        [_MaleBtn setSelected: NO];
        [_FemaleBtn setSelected: YES];
    }
    _addressTF.text=[emp objectAtIndex:4];
    
    NSUserDefaults *userdefaultsimg = [NSUserDefaults standardUserDefaults];
    NSData *rowImg = [[userdefaultsimg objectForKey:@"empImg"] mutableCopy];
    UIImage *image = [UIImage imageWithData:rowImg];
    self.imageView.layer.cornerRadius=40;
    self.imageView.clipsToBounds = YES;

    _imageView.image=image;
    
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

- (IBAction)updateEmployeeDetails:(UIButton *)sender {
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *employeesArray = [[userdefaults objectForKey:@"emp"] mutableCopy];
    
    for(int i=0;i<employeesArray.count;i++){
        
        NSString *row=[employeesArray objectAtIndex:i];
        if([row isEqualToString:empData]){
            NSArray *emp=[row componentsSeparatedByString:@"/"];
            NSMutableArray *empupdate = [emp mutableCopy];
            empupdate[0] = _employeeIdTF.text;
            empupdate[1]=_nameTF.text;
            empupdate[2]=_positionTF.text;
            if([_MaleBtn isSelected]== TRUE){
                empupdate[3]=@"Male";
            }
            else{
                empupdate[3]=@"Female";
            }
            empupdate[4]=_addressTF.text;
            emp = [NSArray arrayWithArray:empupdate];
            row=[NSString stringWithFormat:@"%@/%@/%@/%@/%@",[emp objectAtIndex:0],[emp objectAtIndex:1],[emp objectAtIndex:2],[emp objectAtIndex:3],[emp objectAtIndex:4]];
            //row=[NSString stringWithString:row];
            [employeesArray replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%@",row]];
            [userdefaults setObject:employeesArray forKey:@"emp"];
            [userdefaults synchronize];
        }
        
    }
    /*UIViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddEmployeeViewController"];
    [self presentViewController:vc animated:YES completion:nil];*/
}

- (IBAction)maleToggle:(UIButton *)sender {
    if([_MaleBtn isSelected]== TRUE){
        [_MaleBtn setSelected:NO];
        [_FemaleBtn setSelected:YES];
    }
    else{
        [_MaleBtn setSelected:YES];
        [_FemaleBtn setSelected:NO];
    }
}

- (IBAction)femaleToggle:(UIButton *)sender {
    if([_FemaleBtn isSelected]== TRUE){
        [_FemaleBtn setSelected:NO];
        [_MaleBtn setSelected:YES];
    }
    else{
        [_FemaleBtn setSelected:YES];
        [_MaleBtn setSelected:NO];
    }
}
@end
