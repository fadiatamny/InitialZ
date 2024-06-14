const expect = @import("std").testing.expect;

const Suit = enum {
    var reds: usize = 0;

    clubs,
    spades,
    diamonds,
    hearts,

    pub fn isRed(self: Suit) bool {
        const val = self == .diamonds or self == .hearts;

        Suit.reds += if (val) 1 else 0;

        return val;
    }
};

test "Enum With Func" {
    const card: Suit = @enumFromInt(3); // Suit.hearts;
    try expect(card.isRed() == true);
    try expect(Suit.reds == 1);
}
