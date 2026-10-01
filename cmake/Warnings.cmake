# Strict warnings for our own targets only; third-party code is left alone.
function(venue_set_warnings target)
  set(warnings
    -Wall
    -Wextra
    -Wpedantic
    -Wshadow
    -Wconversion
    -Wsign-conversion
    -Wold-style-cast
    -Wnon-virtual-dtor
    -Woverloaded-virtual
    -Wnull-dereference
    -Wdouble-promotion
    -Wimplicit-fallthrough
  )
  if(VENUE_WARNINGS_AS_ERRORS)
    list(APPEND warnings -Werror)
  endif()

  get_target_property(type ${target} TYPE)
  if(type STREQUAL "INTERFACE_LIBRARY")
    target_compile_options(${target} INTERFACE ${warnings})
  else()
    target_compile_options(${target} PRIVATE ${warnings})
  endif()
endfunction()
