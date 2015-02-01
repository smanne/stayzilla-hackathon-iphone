//
//  WelcomeViewController.m
//  Stayzilla
//
//  Created by Swapnil Patil on 31/01/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController(){
    
    IBOutlet UITextField *location;
    IBOutlet UITextField *userDestionation;
    IBOutlet UIImageView *refresh;
    IBOutlet UIView *background;
    IBOutlet UISegmentedControl *purpose;
    
    int selectedTextfieldTag;
}

@end

@implementation WelcomeViewController

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

-(void) viewDidAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:208.00 green:0.0 blue:162.00 alpha:1.0]];
}


#pragma mark - TextView Delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    SPGooglePlacesAutocompleteViewController *locationViewController = nil;
    
    switch (textField.tag) {
        case 11:
            selectedTextfieldTag = 11;
            locationViewController = [[SPGooglePlacesAutocompleteViewController alloc] init];
            locationViewController.delegate = self;
            [self.navigationController presentViewController:locationViewController animated:YES completion:^{
            
            }];
            break;
            
        case 13:
            selectedTextfieldTag = 13;
            locationViewController = [[SPGooglePlacesAutocompleteViewController alloc] init];
            locationViewController.delegate = self;
            [self.navigationController presentViewController:locationViewController animated:YES completion:^{
                
            }];
            break;
            
        default:
            break;
    }
    
    return NO;
}


#pragma mark IBActions

-(IBAction) searchHotels:(id)sender{
    
    [self startAnimation];

    if (purpose.selectedSegmentIndex == 0) {
        __block NSThread *downloadThread = [[NSThread alloc] initWithTarget:self selector:@selector(getHotels) object:nil];
        [downloadThread start];
    }else{
        __block NSThread *downloadThread = [[NSThread alloc] initWithTarget:self selector:@selector(getOffers) object:nil];
        [downloadThread start];
    }
}

-(void) getOffers{
    
    APIHelper *helper = [[APIHelper alloc] init];
    helper.delegate = self;
    [helper getSavingOfferForLocation:location.text checkInDate:@"06/02/2015" checkOutDate:@"09/02/2015" userDestination:userDestionation.text];
}

-(void) getHotels{
    
    APIHelper *helper = [[APIHelper alloc] init];
    helper.delegate = self;
    [helper getHotelsForLocation:location.text checkInDate:@"06/02/2015" checkOutDate:@"09/02/2015"];
}

-(void) startAnimation{
    background.hidden = NO;
    refresh.hidden = NO;
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
    rotation.duration = 1;
    rotation.repeatCount = INFINITY;
    [refresh.layer addAnimation:rotation forKey:@"Spin"];
}

-(void) stopAnimation{
    refresh.hidden = YES;
    background.hidden = YES;
    [refresh.layer removeAllAnimations];
}

-(void) didGetHotels:(NSArray *) hotels{
    
    dispatch_async(dispatch_get_main_queue(),
                   ^{
                       [self stopAnimation];
                       HotelsViewController *hotelsViewController = [[HotelsViewController alloc] init];
                       hotelsViewController.hotelsArray = hotels;
                       [self.navigationController pushViewController:hotelsViewController animated:YES];
                   });
}

-(void) didGetOffer:(NSDictionary *)offerDictionary{
    
    dispatch_async(dispatch_get_main_queue(),
                   ^{
                       [self stopAnimation];
                       ComparisionViewController *comparisionViewController = [[ComparisionViewController alloc] init];
                       comparisionViewController.offerDictionary = offerDictionary;
                       [self.navigationController pushViewController:comparisionViewController animated:YES];
                   });
}

-(void) setPlace:(NSString *) locationInfo{
   
    if (selectedTextfieldTag == 11) {
        location.text = locationInfo;
    }else if(selectedTextfieldTag == 13){
        userDestionation.text = locationInfo;
    }
}

@end
