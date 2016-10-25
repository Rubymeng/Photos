//
//  ViewController.m
//  Photos
//
//  Created by tyhmeng on 16/10/25.
//  Copyright © 2016年 tyhmeng. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong) NSIndexPath *indexPath;

//图片数组
@property (nonatomic,strong) NSArray *photos;


@end

@implementation ViewController

- (NSArray *)photos {
    if (_photos == nil) {
        NSMutableArray *arr = [NSMutableArray array];
        
        for (int i = 0; i < 20; i ++ ) {
            NSString *imageName = [NSString stringWithFormat:@"%d",i + 1];
            [arr addObject:imageName];
            
        }
        
        _photos = arr;
    }

    return _photos;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    

}

#pragma datasource 

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.photos.count;
    
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //设置内边距         终点的位置减去cell的一半宽度
    self.collectionView.contentInset = UIEdgeInsetsMake(0, self.collectionView.frame.size.width  * 0.5 - 90 , 0, self.collectionView.frame.size.width  * 0.5 - 90);
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.imageName = self.photos[indexPath.row];
    cell.indexPath = indexPath;

    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
