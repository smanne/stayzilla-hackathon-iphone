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
    return 255.0;
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
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ComparisionTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.leftMessage.text = @"If you go to your choice";
            cell.rightMessage.text = @"If you go with Stayzilla";
            cell.imageView.image = [UIImage imageNamed:@""];
            break;
            
        case 1:
            cell.leftMessage.text = [NSString stringWithFormat:@"you need to travel 20km"];
            cell.rightMessage.text = [NSString stringWithFormat:@"you need to travel 20km"];
            cell.imageView.image = [UIImage imageNamed:@"map-marker.png"];
            break;
            
        case 2:
            cell.leftMessage.text = [NSString stringWithFormat:@"you will spend 2hrs travelling"];
            cell.rightMessage.text =[NSString stringWithFormat:@"you will spend 2hrs travelling"];
            cell.imageView.image = [UIImage imageNamed:@"clock.png"];
            break;
            
        case 3:
            cell.leftMessage.text = [NSString stringWithFormat:@"you need to spend 100Rs for cab"];
            cell.rightMessage.text = [NSString stringWithFormat:@"you need to spend 50Rs for cab"];;
            cell.imageView.image = [UIImage imageNamed:@"cab.png"];
            break;
            
        case 4:
            cell.leftMessage.text = @"depends upon your relative or family member";
            cell.rightMessage.text = [NSString stringWithFormat:@"486Rs you need to spend behind a hotel"];
            cell.imageView.image = [UIImage imageNamed:@""];
            break;
            
        case 5:
            cell.leftMessage.text = @"doesn't guarantee about insurance";
            cell.rightMessage.text = @"insurance provided(if applied)";
            cell.imageView.image = [UIImage imageNamed:@"accidentcoverage.png"];
            break;
            
        case 6:
            cell.leftMessage.text = @"privacy can't be ensured";
            cell.rightMessage.text = @"privacy is ensured";
            cell.imageView.image = [UIImage imageNamed:@""];
            break;
            
            
        default:
            break;
    }
    
    return cell;
}


@end
