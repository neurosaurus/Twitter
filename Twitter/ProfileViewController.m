//
//  ProfileViewController.m
//  Twitter
//
//  Created by Tripta Gupta on 4/3/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import "ProfileViewController.h"
#import <UIImageView+AFNetworking.h>
#import "User.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *userProfileImage;
@property (weak, nonatomic) IBOutlet UIImageView *userProfileBackgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *twitterHandleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersCountLabel;

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Profile";
    
    // Adding Buttons to Navigation Bar
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onCancelButton)];
    
    [self setupUser];
}

- (void)setUser:(User *)user {
    NSLog(@"ProfileViewController:setUser %@",user);
    _user = user;
    [self setupUser];
}

- (void)setupUser
{
    if (!self.user) {
        self.user = [User currentUser];
    }
    
    self.usernameLabel.text = self.user.name;
    self.twitterHandleLabel.text = self.user.screen_name;
//    [self.userProfileImage setImageWithURL:self.user.profile_image_url];
    [self.userProfileImage setImageWithURL:[NSURL URLWithString:self.user.profile_image_url]];
    self.tweetCountLabel.text = [NSString stringWithFormat:@"%@",self.user.statusCount];
    self.followersCountLabel.text = [NSString stringWithFormat:@"%@",self.user.followerCount];
    self.followingCountLabel.text = [NSString stringWithFormat:@"%@",self.user.friendCount];
    [self.userProfileBackgroundImage setImageWithURL:[NSURL URLWithString:self.user.profileBackgroundImageURL]];
}

- (void)onCancelButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end