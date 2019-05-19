//
//  ImageSearchService.m
//  FlickrImageSearchApp
//
//  Created by Raunak Talwar on 19/05/19.
//  Copyright © 2019 Raunak Talwar. All rights reserved.
//

#import "ImageSearchService.h"



@implementation ImageSearchService
    
static NSString const *baseURL = @"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=9945b6b6c0746ab326edd066f793228b&%20format=json&nojsoncallback=1&safe_search=1&text=";

- (NSDictionary *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"APIResponse" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}
    
-(void)searchImagesWithText:(NSString *)searchText
             withCompletion:(nullable onComplete)completion {
    NSString *urlString = [NSString stringWithFormat:@"%@%@", baseURL, searchText];
    NSURL *url=[NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url
            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if(data!=nil) {
                    NSLog(@"DATA = %@", data);
                    NSError *error=nil;
                    NSDictionary *json = /*[self JSONFromFile];//*/[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                    if(error==nil) {
                        NSMutableArray<ImageModel *> *result = [NSMutableArray array];
                        NSDictionary *photosData = json[@"photos"];
                        NSArray *photosDataArray = photosData[@"photo"];
                        for (NSDictionary *photoDict in photosDataArray) {
                            NSString *farm = photoDict[@"farm"];
                            NSString *server = photoDict[@"server"];
                            NSString *imageID = photoDict[@"id"];
                            NSString *secret = photoDict[@"secret"];
                            ImageModel *model = [[ImageModel alloc] initWithFarm:farm
                                                                       server:server
                                                                      imageID:imageID
                                                                       secret:secret];
                            [result addObject:model];
                        }
                        NSLog(@"RES=%@",result);
                        completion(result, nil);
                    } else {
                        completion(nil, error);
                    }
                }
    }] resume];
}

-(UIImage *)getImageForImageModel:(ImageModel *)model {
    NSString *urlString = [NSString stringWithFormat:@"https://farm%@.static.flickr.com/%@/%@_%@.jpg", model.farm, model.server, model.imageID, model.secret];
    NSURL *url=[NSURL URLWithString: urlString];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
    return [UIImage imageWithData: imageData];
}

@end
