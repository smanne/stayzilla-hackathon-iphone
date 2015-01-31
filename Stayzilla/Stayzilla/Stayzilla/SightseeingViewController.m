//
//  SightseeingViewController.m
//  Stayzilla
//
//  Created by Kiran Juikar on 01/02/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import "SightseeingViewController.h"
#import "HotelsCellViewTableViewCell.h"

#import "APIHelper.h"

@interface SightseeingViewController ()

@end

@implementation SightseeingViewController
@synthesize placesOfInterest;
@synthesize placeTableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [placeTableView reloadData];
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


#pragma mark - TableviewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 255.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[placesOfInterest objectAtIndex:section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [placesOfInterest count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    static NSString *reuseIdentifierLocalWorksheetVideo = @"VideoListCell";
    HotelsCellViewTableViewCell *cell = nil;
    
    //Local Videos
    cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifierLocalWorksheetVideo];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HotelsCellView" owner:self options:nil] objectAtIndex:0];
    }
    
    NSDictionary *hotel = [[placesOfInterest objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] ;
    
    cell.name.text = [hotel objectForKey:@"name"];
    cell.address.text = [hotel objectForKey:@"vicinity"];
    
    dispatch_async(dispatch_get_main_queue(),
                   ^{
    APIHelper* helper = [[APIHelper alloc] init];
    
    if ([hotel objectForKey:@"photos"] && [[hotel objectForKey:@"photos"] isKindOfClass:[NSArray class]]) {
        if ([[hotel objectForKey:@"photos"] count] > 0) {
            NSDictionary* photoDetails = [[hotel objectForKey:@"photos"] objectAtIndex:0];
            UIImage* img = [helper placePhoto:photoDetails];
            cell.image.image = img;
        }
    }
    
                   });
    
    cell.price.hidden = YES;
    cell.book.hidden = YES;
    cell.placesNearby.hidden = YES;
    return cell;
}




- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *array = [placesOfInterest objectAtIndex:section];
    NSDictionary *placeOfInterest = [array objectAtIndex:0];
    return [[placeOfInterest objectForKey:@"type"] capitalizedString];
    
}


@end
