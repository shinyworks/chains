# vrv_fct() sets value to default when invalid

    Code
      signalCondition(error)
    Condition
      Error in `validation_fn()`:
      ! Each value of `.vrv()` must be in the expected levels.
      i Allowed levels: "B1".
      x Unexpected values: "A1".

# vrv_fct_scalar() sets value to default when invalid (levels)

    Code
      signalCondition(error)
    Condition
      Error in `validation_fn()`:
      ! Each value of `.vrv()` must be in the expected levels.
      i Allowed levels: "B1".
      x Unexpected values: "A1".

# vrv_fct_scalar() sets value to default when invalid (size)

    Code
      signalCondition(error)
    Condition
      Error in `validation_fn()`:
      ! `.vrv()` must be a single <factor>.
      x `.vrv()` has 2 values.

