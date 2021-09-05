#include "gmock/gmock.h"
#include "gtest/gtest.h"

namespace {

class Value {
 public:
  // Basic constructor to get something with dummy values.
  Value() : value_(42) {}

  // Fails with the non-default constructor, which is basically just a default
  Value(const Value& sz) : value_(sz.value_) {}
  // Passes if we use the default constructor
  // Value(const Value& sz) = default;

  // Matcher needs a comparison.
  friend bool operator==(const Value& a, const Value& b) {
    return a.value_ == b.value_;
  }

 private:
  int value_;
};

class TestInterface {
 public:
  virtual void open(Value value) = 0;
};

class MockTestInterface : public TestInterface {
 public:
  MOCK_METHOD(void, open, (Value value), (override));
};

TEST(SplitWriterTest, MultipleWriteSplitsFilesWithOpenCalledFirst) {
  MockTestInterface mock;

  // Same result with both
  // EXPECT_CALL(mock, open(Value())).Times(0);
  EXPECT_CALL(mock, open(::testing::Eq(Value()))).Times(0);
}

}  // namespace
