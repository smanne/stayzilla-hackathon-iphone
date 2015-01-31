//
//  HotelsViewController.m
//  Stayzilla
//
//  Created by Swapnil Patil on 31/01/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import "HotelsViewController.h"
#import "HotelsCellViewTableViewCell.h"
#import "APIHelper.h"
#import "SightseeingViewController.h"
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
    //cell.image.image = [UIImage imageNamed:@"hotel1.jpg"];
    dispatch_async(dispatch_get_main_queue(),
                   ^{
                       APIHelper* helper = [[APIHelper alloc] init];
                       
                       if ([hotel objectForKey:@"imageURL"]) {
                           
                           UIImage* img = [helper placeHotelPhoto:[hotel objectForKey:@"imageURL"]];
                           cell.image.image = img;
                       }
                       
                   });
    
    [cell.placesNearby addTarget:self action:@selector(placesNearbyClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
-(void) placesNearbyClick:(id)sender{
    
    APIHelper *helper = [[APIHelper alloc] init];
    helper.delegate = self;
    [helper getInterestPlacesForLocation:@""];
    
}


-(void) didGetInterestPlaces:(NSArray *) places{
    
    NSMutableDictionary* placesByInterest = [[NSMutableDictionary alloc] init];
    
    for (NSDictionary* place in places) {
        id types = [place objectForKey:@"types"];
        if (types && [types isKindOfClass:[NSArray class]]) {
            NSArray* types = [place objectForKey:@"types"];
            if (types.count > 0) {
                NSString* key = [types objectAtIndex:0];
                if ([placesByInterest objectForKey:key]) {
                    NSMutableArray* placeByInterest = [placesByInterest objectForKey:key];
                    NSMutableDictionary* mutablePlace = [place mutableCopy];
                    [mutablePlace setObject:[key uppercaseString] forKey:@"type"];
                    [placeByInterest addObject:mutablePlace];
                    
                    [placesByInterest setObject:placeByInterest forKey:key];
                }
                else{
                    NSMutableArray* placeByInterest = [[NSMutableArray alloc] init];
                    NSMutableDictionary* mutablePlace = [place mutableCopy];
                    [mutablePlace setObject:[key uppercaseString] forKey:@"type"];
                    [placeByInterest addObject:mutablePlace];
                    
                    [placesByInterest setObject:placeByInterest forKey:key];
                }
            }
        }
    }
    
    NSMutableArray* placesByInterestArray = [[NSMutableArray alloc] init];
    for (NSString *key in placesByInterest)
    {
        [placesByInterestArray addObject:[placesByInterest objectForKey:key]];
    }
    
    dispatch_async(dispatch_get_main_queue(),
                   ^{
                       SightseeingViewController *sightSeetingViewController = [[SightseeingViewController alloc] initWithNibName:@"SightSeeingView" bundle:nil];
                       sightSeetingViewController.placesOfInterest = placesByInterestArray;
                       [self.navigationController pushViewController:sightSeetingViewController animated:YES];
                   });
    
}
@end
