#import "MMData.h"

@interface MMData ()

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) NSData *data;

@end

@implementation MMData

- (instancetype)initWithPeerID:(MCPeerID *)peerID data:(NSData *)data {
    self = [super init];
    if (self) {
        _peerID = peerID;
        _data = data;
    }
    return self;
}

@end
