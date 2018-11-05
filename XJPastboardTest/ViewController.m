//
//  ViewController.m
//  XJPastboardTest
//
//  Created by Hincat on 2018/10/30.
//  Copyright © 2018 Hincat. All rights reserved.
//

#import "ViewController.h"
#import "CopyLab.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *viewLab;
@property (nonatomic,strong) CopyLab *lab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewLab.text = @"需要先从外面复制个内容";
    self.lab.text = @"这是默认的字";
}

- (CopyLab *)lab {
    if (!_lab) {
        _lab = [[CopyLab alloc] initWithFrame:CGRectMake(0, 0, 150, 20)];
        _lab.center = self.view.center;
        [self.view addSubview:_lab];
    }
    return _lab;
}


@end
