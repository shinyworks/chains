# vrv_int() sets value to default when invalid (size)

    Code
      signalCondition(error)
    Condition
      Error:
      ! `.vrv()` must have size <= 1.
      x 2 is too big.

# vrv_int() sets value to default when invalid (min_value)

    Code
      signalCondition(error)
    Condition
      Error:
      ! `.vrv()` must be >= 5.
      x 4 is too low.

# vrv_int() sets value to default when invalid (max_value)

    Code
      signalCondition(error)
    Condition
      Error:
      ! `.vrv()` must be <= 15.
      x 16 is too high.

# vrv_int() handles NULL initialization

    Code
      signalCondition(error)
    Condition
      Error:
      ! `.vrv()` must not be <NULL>.

# vrv_int() handles being set to NULL

    Code
      signalCondition(error)
    Condition
      Error:
      ! `.vrv()` must not be <NULL>.

# vrv_int_scalar() sets value to default when invalid (size)

    Code
      signalCondition(error)
    Condition
      Error:
      ! `.vrv()` must be a single <integer>.
      x `.vrv()` has 2 values.

# vrv_int_scalar() sets value to default when invalid (max_value)

    Code
      signalCondition(error)
    Condition
      Error:
      ! `.vrv()` must be <= 15.
      x 16 is too high.

# vrv_int_scalar() handles NULL initialization

    Code
      signalCondition(error)
    Condition
      Error:
      ! `.vrv()` must not be <NULL>.

# vrv_int_scalar() handles zero-length integer vector

    Code
      signalCondition(error)
    Condition
      Error:
      ! `.vrv()` must be a single <integer (non-empty)>.
      x `.vrv()` has no values.

