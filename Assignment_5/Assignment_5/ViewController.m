//
//  ViewController.m
//  Assignment_5
//
//  Created by aliasagar abadani on 3/20/19.
//  Copyright © 2019 aliasagar abadani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *json;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"countrylist" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    self.myTableView.dataSource=self;
    self.myTableView.delegate=self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return json.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *countryList=[json objectAtIndex:indexPath.row];
    SpaceCell *cell=[tableView dequeueReusableCellWithIdentifier:@"spaceCell" forIndexPath:indexPath];
    cell.labelCountryName.text=	[NSMutableString stringWithFormat:@"%@ (%@)",[countryList objectForKeyedSubscript:@"name"],[countryList objectForKeyedSubscript:@"countryCode"]];
    cell.labelPhoneCode.text=   [NSMutableString stringWithFormat:@"%s%@","Phone Code : ",[countryList objectForKeyedSubscript:@"phoneCode"]];
    cell.labelINR.text=    [NSMutableString stringWithFormat:@"%@",[countryList objectForKeyedSubscript:@"currencyCode"]];
    NSString *mediaString =    [NSMutableString stringWithFormat:@"%@",[countryList objectForKeyedSubscript:@"media"]];
    NSString *baseUrl=@"data:image/png;base64,";
    baseUrl = [baseUrl stringByAppendingString:mediaString];
    NSURL *url = [NSURL URLWithString:baseUrl];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *ret = [UIImage imageWithData:imageData];
    cell.img.image=ret;
    /*[cell updateCellWithCountryName:countryList objectForKey:name phoneCode:countryList objectForKey:countryCode inr:currencyCode image:media];*/
    cell.backgroundColor=[UIColor clearColor];
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
