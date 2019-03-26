//
//  AddEmployeeViewController.m
//  Assignment_6
//
//  Created by aliasagar abadani on 3/22/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import "AddEmployeeViewController.h"
#import "ViewController.h"

@interface AddEmployeeViewController ()

@end


@implementation AddEmployeeViewController
@synthesize employeesArray;
@synthesize empImageArray;
@synthesize Male,Female;
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(100.0, 100.0, 100.0, 100.0)];
    //[imageview setImage:[UIImage imageNamed:@"userimage.png"]];
    self.imageView.layer.cornerRadius=40;
    self.imageView.clipsToBounds = YES;
    [imageview setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapping:)];
    [singleTap setNumberOfTapsRequired:1];
    [imageview addGestureRecognizer:singleTap];
    
    [self.view addSubview:imageview];
}

-(void)singleTapping:(UIGestureRecognizer *)recognizer {
    [self pickImage:self];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addEmployeeDetails:(UIButton *)sender {
    
    NSString *employeeDetails;
    employeesArray = [[NSMutableArray alloc] initWithCapacity:40];
    empImageArray = [[NSMutableArray alloc] initWithCapacity:40];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *registeredEmp = [defaults objectForKey:@"emp"];
    NSMutableArray *registeredData=[defaults objectForKey:@"empImage"];
    if ([registeredEmp count] != 0) {
        for(int i=0;i<registeredEmp.count;i++){
            [employeesArray addObject:[registeredEmp objectAtIndex:i]];
            [empImageArray addObject:[registeredData objectAtIndex:i]];
        }
    }
    employeeDetails=[NSString stringWithFormat:@"%@/%@/%@", _employeeIdTextField.text, _nameTextField.text, _positionTextField.text];
    if([Male isSelected]== TRUE){
        employeeDetails=[NSString stringWithFormat:@"%@/%@", employeeDetails,@"Male"];
    }
    else{
        employeeDetails=[NSString stringWithFormat:@"%@/%@", employeeDetails,@"Female"];
    }
    employeeDetails=[NSString stringWithFormat:@"%@/%@", employeeDetails,_addressTextField.text];
    [employeesArray addObject:employeeDetails];
    [defaults setObject:employeesArray forKey:@"emp"];
    [defaults synchronize];
    
    NSData *dataImage = UIImagePNGRepresentation(self.imageView.image);
    [empImageArray addObject:dataImage];
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    
    [userdefaults setObject:empImageArray forKey:@"empImage"];
    [userdefaults synchronize];
    
    _imageView.image=[UIImage imageNamed:@"userimage.png"];
    _employeeIdTextField.text=@"";
    _nameTextField.text=@"";
    _positionTextField.text=@"";
    [Male setSelected:NO];
    [Female setSelected:NO];
    _addressTextField.text=@"";
    //NSMutableArray *employeesArray;
    
    /*Employee *myemployee = [[Employee alloc] init];
    myemployee.employeeId = _employeeIdTextField.text;
    myemployee.name=_nameTextField.text;
    myemployee.position= _positionTextField.text;
    if([Male isSelected]== TRUE){
        myemployee.gender=@"Male";
    }
    else{
        myemployee.gender=@"Female";
    }
    myemployee.address=_addressTextField.text;*/
    
    //NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:myemployee];
    
    
    
    //[self.navigationController pushViewController:view animated:YES];
    
    
    
    //NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    
    //[userdefaults setObject:employeesArray forKey:@"emp"];
    //[userdefaults synchronize];
    
}

- (IBAction) pickImage:(id)sender{
    
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]
                                                 init];
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
}



#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void) imagePickerController:(UIImagePickerController *)picker
         didFinishPickingImage:(UIImage *)image
                   editingInfo:(NSDictionary *)editingInfo
{
    [image drawInRect:CGRectMake(0, 0, 80, 80)];
    _imageView.layer.cornerRadius=40;
    _imageView.clipsToBounds = YES;
    self.imageView.image = image;
    [self dismissModalViewControllerAnimated:YES];
    
    
}


@end
