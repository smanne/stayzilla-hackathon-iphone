//
//  HotelsViewController.m
//  Stayzilla
//
//  Created by Swapnil Patil on 31/01/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import "HotelsViewController.h"
#import "HotelsCellViewTableViewCell.h"

@implementation HotelsViewController

@synthesize hotelsArray;

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
//    hotelsArray = [[NSMutableArray alloc] init];
//    for (int indexCounter=0; indexCounter < 4; indexCounter++) {
//        NSMutableDictionary * hotel = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"Hotel %d",indexCounter+1],@"name",[NSString stringWithFormat:@"%d",(indexCounter+1)*100],@"price",[NSString stringWithFormat:@"Address %d",indexCounter+1],@"address",[NSString stringWithFormat:@"hotel%d.jpg",indexCounter+1],@"image",nil];
//        
//        [hotelsArray addObject:hotel];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableviewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 255.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return hotelsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    static NSString *reuseIdentifierLocalWorksheetVideo = @"VideoListCell";
    HotelsCellViewTableViewCell *cell = nil;
    
    //Local Videos
    cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifierLocalWorksheetVideo];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HotelsCellView" owner:self options:nil] objectAtIndex:0];
    }

    NSDictionary *hotel = [hotelsArray objectAtIndex:indexPath.row];
    
    cell.name.text = [hotel objectForKey:@"displayName"];
    cell.address.text = [hotel objectForKey:@"address"];
    cell.price.text = [hotel objectForKey:@"price"];
    cell.image.image = [UIImage imageNamed:@"hotel1.jpg"];
    
    return cell;
}


@end
