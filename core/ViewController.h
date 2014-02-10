//
//  ViewController.h
//  core
//
//  Created by BSA univ 9 on 29/01/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imagetodatatransformer.h"

@interface ViewController : UIViewController <UIImagePickerControllerDelegate,UIImagePickerControllerDelegate>

//@property (strong, nonatomic) IBOutlet UIImageView *myimage;

//@property (strong,nonatomic) imagetodatatransformer *obj;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) IBOutlet UIImageView *imageview;

- (IBAction)take:(UIButton *)sender;
- (IBAction)select:(UIButton *)sender;
-(IBAction)save:(id)sender;
- (IBAction)retrive:(id)sender;


//@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;


@end
