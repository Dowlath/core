//
//  imagetodatatransformer.m
//  core
//
//  Created by BSA univ 9 on 06/02/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "imagetodatatransformer.h"

@implementation imagetodatatransformer
+ (BOOL)allowsReverseTransformation {
	return YES;
}

+ (Class)transformedValueClass {
	return [NSData class];
}

- (id)transformedValue:(id)value {
	NSData *data = UIImagePNGRepresentation(value);
	return data;
}

- (id)reverseTransformedValue:(id)value {
    
	UIImage *storedImage = [[UIImage alloc] initWithData:value];
    UIImage *img = vcObj.imageview.image;
    NSData *imagData=UIImageJPEGRepresentation(img, 1.0);
    // NSData *imgData = [UIImageJPEGRepresentation(img, 1.0)];
    
    [NSManagedObject  setValue:imagData forKey:@"imageview"];
    
    
    return storedImage;
}


@end
