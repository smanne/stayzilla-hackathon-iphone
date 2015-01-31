//
//  WelcomeViewController.m
//  Stayzilla
//
//  Created by Swapnil Patil on 31/01/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import "WelcomeViewController.h"
#import "HotelsViewController.h"


@interface WelcomeViewController(){
    
    IBOutlet UITextField *location;
    IBOutlet UIImageView *refresh;
    IBOutlet UIView *background;
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


#pragma mark - TextView Delegate

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
    
}


- (void)textViewDidEndEditing:(UITextView *)textView{
    
    
}

#pragma mark IBActions

-(IBAction) searchHotels:(id)sender{
    
    [self startAnimation];
    [location resignFirstResponder];
    __block NSThread *downloadThread = [[NSThread alloc] initWithTarget:self selector:@selector(getHotels) object:nil];
    [downloadThread start];
    
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

@end
