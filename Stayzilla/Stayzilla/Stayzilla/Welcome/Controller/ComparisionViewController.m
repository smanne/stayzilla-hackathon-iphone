//
//  ComparisionViewController.m
//  Stayzilla
//
//  Created by Swapnil Patil on 31/01/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import "ComparisionViewController.h"
#import "ComaparisonTableViewCell.h"

@interface ComparisionViewController ()

@end

@implementation ComparisionViewController

@synthesize offerDictionary;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    static NSString *reuseIdentifierLocalWorksheetVideo = @"VideoListCell";
    ComaparisonTableViewCell *cell = nil;
    
    //Local Videos
    cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifierLocalWorksheetVideo];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ComaparisonTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    cell.leftMessage.numberOfLines = 3;
    cell.rightMessage.numberOfLines = 3;
    switch (indexPath.row) {
        case 0:
            cell.leftMessage.text = @"If you go to your choice";
            cell.rightMessage.text = @"If you go with Stayzilla";
            cell.featureImage.image = [UIImage imageNamed:@""];
            break;
            
        case 1:
            cell.leftMessage.text = [NSString stringWithFormat:@"you need to travel %@km",[[offerDictionary objectForKey:@"user"] objectForKey:@"distance"]];
            cell.rightMessage.text = [NSString stringWithFormat:@"you need to travel %@km",[[offerDictionary objectForKey:@"stayzilla"] objectForKey:@"distance"]];
            cell.featureImage.image = [UIImage imageNamed:@"map-marker.png"];
            break;
            
        case 2:
            cell.leftMessage.text = [NSString stringWithFormat:@"you will spend %@ travelling",[[offerDictionary objectForKey:@"user"] objectForKey:@"duration"]];
            cell.rightMessage.text =[NSString stringWithFormat:@"you will spend %@ travelling",[[offerDictionary objectForKey:@"stayzilla"] objectForKey:@"duration"]];
            cell.featureImage.image = [UIImage imageNamed:@"clock.png"];
            break;
            
        case 3:
            cell.leftMessage.text = [NSString stringWithFormat:@"you need to spend %@Rs for cab", [[offerDictionary objectForKey:@"user"] objectForKey:@"cabFare"]];
            cell.rightMessage.text = [NSString stringWithFormat:@"you need to spend %@Rs for cab",[[offerDictionary objectForKey:@"stayzilla"] objectForKey:@"cabFare"]];
            cell.featureImage.image = [UIImage imageNamed:@"cab.png"];
            break;
            
        case 4:
            cell.leftMessage.text = @"depends upon your relative or family member";
            cell.rightMessage.text = [NSString stringWithFormat:@"%@ you need to spend behind a hotel",[[offerDictionary objectForKey:@"stayzilla"] objectForKey:@"hotelFare"]];
            cell.featureImage.image = [UIImage imageNamed:@"bed.png"];
            break;
            
        case 5:
            cell.leftMessage.text = @"doesn't guarantee about insurance";
            cell.rightMessage.text = @"insurance provided(if applied)";
            cell.featureImage.image = [UIImage imageNamed:@"ambulance.png"];
            break;
            
        case 6:
            cell.leftMessage.text = @"privacy can't be ensured";
            cell.rightMessage.text = @"privacy is ensured";
            cell.featureImage.image = [UIImage imageNamed:@"eye.png"];
            break;
            
        default:
            break;
    }
    
    return cell;
}


@end
