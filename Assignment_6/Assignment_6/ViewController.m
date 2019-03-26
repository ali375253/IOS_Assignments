//
//  ViewController.m
//  Assignment_6
//
//  Created by aliasagar abadani on 3/21/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import "ViewController.h"
#import "mycell.h"
#import "AddEmployeeViewController.h"
@interface ViewController ()

@end
//NSMutableArray *employeesArray;

@implementation ViewController
@synthesize employeesArray;
@synthesize empImageArray;
NSUserDefaults *defaults;
NSUserDefaults *defaultsimage;
NSString *empList;
NSData *data;
//NSData *encodedObject;
- (void)viewDidLoad {
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
    employeesArray = [defaults objectForKey:@"emp"];
    defaultsimage = [NSUserDefaults standardUserDefaults];
    empImageArray = [defaultsimage objectForKey:@"empImage"];
    
    //encodedObject = [defaults objectForKey:@"emp"];
    //AddEmployeeViewController *view = [[AddEmployeeViewController alloc] initWithNibName:@"AddViewController" bundle:nil];
    //self.employeesArray=view.employeesArray;
    
    //NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //employeesArray = [userDefaults objectForKey:@"emp"];
    //view.employeesArray = [NSMutableArray arrayWithArray:self.employeesArray];
    self.myTableView.dataSource=self;
    self.myTableView.delegate=self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return employeesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    mycell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    empList = [employeesArray objectAtIndex:indexPath.row];
    NSArray *emp=[empList componentsSeparatedByString:@"/"];
    cell.employeeIdLabel.text=[emp objectAtIndex:0];
    cell.nameLabel.text=[NSString stringWithFormat:@"%@:%@",@"Name", [emp objectAtIndex:1]];
    cell.positionLabel.text=[NSString stringWithFormat:@"%@:%@",@"Position", [emp objectAtIndex:2]];
    cell.genderLabel.text=[NSString stringWithFormat:@"%@:%@",@"Gender", [emp objectAtIndex:3]];
    
    
    
    data=[empImageArray objectAtIndex:indexPath.row];
    UIImage *image = [UIImage imageWithData:data];
    [image drawInRect:CGRectMake(0, 0, 70, 70)];
    cell.imageView.layer.cornerRadius=35;
    cell.imageView.clipsToBounds = YES;
    cell.imageView.image=image;
    
    NSUserDefaults *sendEmpData=[NSUserDefaults standardUserDefaults];
    [sendEmpData setObject:empList forKey:@"empData"];
    [sendEmpData synchronize];
    NSUserDefaults *sendEmpImage=[NSUserDefaults standardUserDefaults];
    [sendEmpImage setObject:data forKey:@"empImg"];
    [sendEmpImage synchronize];
    
    //NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //employeesArray = [userDefaults objectForKey:@"employees"];
    //NSDictionary *employeeList=[employeesArray objectAtIndex:indexPath.row];
    
    //cell.employeeIdLabel.text=[NSMutableString stringWithFormat:@"%@",[employeeList objectForKeyedSubscript:@"employeeId"]];
    
    //Employee *employee = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    //[cell.nameLabel setText:empList.name];
    //[cell.positionLabel setText:empList.position];
    //[cell.genderLabel setText:empList.gender];
    //cell.employeeIdLabel.text = [self.employeesArray objectAtIndex:indexRow.row];
    //NSLog(employee.name);
    /*cell.employeeIdLabel.text=employee.employeeId;
    cell.nameLabel.text=employee.name;
    cell.positionLabel.text=employee.position;
    cell.genderLabel.text=employee.gender;*/
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    mycell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    empList = [employeesArray objectAtIndex:indexPath.row];
    NSArray *emp=[empList componentsSeparatedByString:@"/"];
    cell.employeeIdLabel.text=[emp objectAtIndex:0];
    cell.nameLabel.text=[NSString stringWithFormat:@"%@:%@",@"Name", [emp objectAtIndex:1]];
    cell.positionLabel.text=[NSString stringWithFormat:@"%@:%@",@"Position", [emp objectAtIndex:2]];
    cell.genderLabel.text=[NSString stringWithFormat:@"%@:%@",@"Gender", [emp objectAtIndex:3]];
    
    
    
    data=[empImageArray objectAtIndex:indexPath.row];
    UIImage *image = [UIImage imageWithData:data];
    [image drawInRect:CGRectMake(0, 0, 70, 70)];
    cell.imageView.layer.cornerRadius=35;
    cell.imageView.clipsToBounds = YES;
    cell.imageView.image=image;
    
    NSUserDefaults *sendEmpData=[NSUserDefaults standardUserDefaults];
    [sendEmpData setObject:empList forKey:@"empData"];
    [sendEmpData synchronize];
    NSUserDefaults *sendEmpImage=[NSUserDefaults standardUserDefaults];
    [sendEmpImage setObject:data forKey:@"empImg"];
    [sendEmpImage synchronize];
    
    /*UIViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EditEmployeeViewController"];
    [self presentViewController:vc animated:YES completion:nil];*/
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSUserDefaults *defaultss = [NSUserDefaults standardUserDefaults];
        NSMutableArray *employeesArr = [[defaultss objectForKey:@"emp"]mutableCopy];
        NSUserDefaults *defaultssi = [NSUserDefaults standardUserDefaults];
        NSMutableArray *empImageArr = [[defaultssi objectForKey:@"empImage"]mutableCopy];
        [employeesArr removeObjectAtIndex:indexPath.row];
   
        [empImageArr removeObjectAtIndex:indexPath.row];
        
        [defaults removeObjectForKey:@"emp"];
        [defaults setObject:employeesArr forKey:@"emp"];
        [defaults synchronize];
        [defaultsimage removeObjectForKey:@"empImage"];
        [defaultsimage setObject:empImageArr forKey:@"empImage"];
        [defaultsimage synchronize];
         [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
        [tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
