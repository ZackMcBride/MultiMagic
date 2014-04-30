#import "MMResource.h"

@interface MMResource ()

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) NSString *resourceName;
@property (nonatomic, strong) NSProgress *progress;
@property (nonatomic, strong) NSURL *localURL;

@end

@implementation MMResource

- (instancetype)initWithPeerID:(MCPeerID *)peerID resourceName:(NSString *)resourceName progress:(NSProgress *)progress {
    self = [super init];
    if (self) {
        _peerID = peerID;
        _resourceName = resourceName;
        _progress = progress;
    }
    return self;
}

- (instancetype)initWithPeerID:(MCPeerID *)peerID resourceName:(NSString *)resourceName localURL:(NSURL *)localURL {
    self = [super init];
    if (self) {
        _peerID = peerID;
        _resourceName = resourceName;
        _localURL = localURL;
    }
    return self;
}

@end
