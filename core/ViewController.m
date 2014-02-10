//
//  ViewController.m
//  core
//
//  Created by BSA univ 9 on 29/01/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
{
    UIImage *image;
    NSData *imageData;
  
}

@end

@implementation ViewController
@synthesize imageview;

//@synthesize obj;

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

    
   //  myimage= [myimage initWithImage:[UIImage imageNamed:@"IMG_1676.jpg"]];
    
    
    //image    = [UIImage imageNamed:@"IMG_1676.JPG"];
    
//imageData = UIImageJPEGRepresentation(image, 1.0);
    
    //[super viewDidLoad];
    /*if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }*/
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   /* NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity1 = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity1];
    
    NSError *error;
    
    NSArray * array = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (array == nil) {
        
        NSLog(@"Testing: No results found");
        
    }else {
        
        NSLog(@"Testing: %lu Results found.", (unsigned long)[array count]);
    }
    
    NSData * dataBytes = [[array objectAtIndex:0] data];
    
    image = [UIImage imageWithData:dataBytes];*/
    
}

- (IBAction)take:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
    }
    else
    {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    [self presentViewController:picker animated:YES completion:NULL];

    
    
}

- (IBAction)select:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;


[self presentViewController:picker animated:YES completion:NULL];



}
#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageview.image = chosenImage;
   //NSData *imagData= UIImageJPEGRepresentation(imageview.image, 1.0);
   [picker dismissViewControllerAnimated:YES completion:NULL];
    /*AppDelegate *delegateObj = [[UIApplication sharedApplication]delegate];
    
    _managedObjectContext = [delegateObj managedObjectContext];
    
    
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Image" inManagedObjectContext:_managedObjectContext];
    
    NSManagedObject *mangedObj = [[NSManagedObject alloc]initWithEntity:entityDesc insertIntoManagedObjectContext:_managedObjectContext];
    
    [mangedObj setValue:imageData forKey:@"imageattribute"];
    
    NSError *error;
    
    [_managedObjectContext save:&error];
    
    NSLog(@"Image added into Coredata..");
    
    UIImageWriteToSavedPhotosAlbum(imageview.image,self,nil,nil);*/
    //[picker dismissViewControllerAnimated:YES completion:NULL];


    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    
}




-(IBAction)save:(id)sender
{
    
    NSData *imagData= UIImageJPEGRepresentation(imageview.image, 1.0);

    AppDelegate *delegateObj = [[UIApplication sharedApplication]delegate];
    
    _managedObjectContext = [delegateObj managedObjectContext];
    
    
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Image" inManagedObjectContext:_managedObjectContext];
  
    NSManagedObject *mangedObj = [[NSManagedObject alloc]initWithEntity:entityDesc insertIntoManagedObjectContext:_managedObjectContext];
    
    [mangedObj setValue:imageData forKey:@"imageattribute"];
    
    NSError *error;
    
    [_managedObjectContext save:&error];

    NSLog(@"Image added into Coredata..");
    
    UIImageWriteToSavedPhotosAlbum(imageview.image,self,nil,nil);
    
    
}

- (IBAction)retrive:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity1=[NSEntityDescription entityForName:@"Image" inManagedObjectContext:context];
    
  //  NSEntityDescription *entity1 = [NSEntityDescription entityForName:@"Image" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity1];
    
    NSError *error;
    
    NSArray * array = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (array == nil) {
        
        NSLog(@"Testing: No results found");
        
    }else {
        
        NSLog(@"Testing: %lu Results found.", (unsigned long)[array count]);
    }
    NSData * dataBytes = [[ array objectAtIndex:0]data];
   // NSData * dataBytes = [[array objectAtIndex:1] data];
    
   image = [UIImage imageWithData:dataBytes];
    NSLog(@"====> %@", image);
}




@end
