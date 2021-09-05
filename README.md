# Failures Under Clang-Tidy

Commit c13c27a513ecd1cbf5700a45fe590e85e8ae6770 for googletest (cl/350580998),
started causing issues for us under clang-tidy.  The problem only appears under
C++17, and with a struct that has non-trivial copy-construction.

> error: Potential leak of memory pointed to by field 'shared'
> [clang-analyzer-cplusplus.NewDeleteLeaks,-warnings-as-errors]

The run_tidy.sh script runs clang-tidy with the appropriate flags to see it pass
in on c++14 and fail on 17.  Googletest is imported as a submodule at the
failing commit c13c27a5.

I've included a dockerfile to run this in an environment that matches mine.
Clang-tidy-12 is used here just to try and grab a modern-ish version of
clang-tidy.  I was also seeing that on clang-tidy-9.
