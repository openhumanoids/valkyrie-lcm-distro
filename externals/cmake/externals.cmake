set(lcm_proj lcm)
set(lcm_url https://github.com/lcm-proj/lcm/releases/download/v1.3.0/lcm-1.3.0.zip)
set(lcm_download_hash 5d46a902fe04608809af3dc526909f9b)
set(lcm_depends)
set(lcm_external_args
  CONFIGURE_COMMAND ${source_prefix}/lcm/configure --prefix=${CMAKE_INSTALL_PREFIX}
  BUILD_IN_SOURCE 1
  )

set(bot_core_lcmtypes_url https://github.com/openhumanoids/bot_core_lcmtypes.git)
set(bot_core_lcmtypes_revision 02a41c0a0b017d09c410d87343652c7e2cadf4c6)
set(bot_core_lcmtypes_depends ${lcm_proj})

set(libbot_url https://github.com/openhumanoids/libbot.git)
set(libbot_revision 5ca2e5f3ceff53e40b64da6b4fa84dbeecf35ace)
set(libbot_depends bot_core_lcmtypes ${lcm_proj})

set(externals
  ${lcm_proj}
  bot_core_lcmtypes
  libbot
)


macro(add_external proj)
  # depending on which variables are defined, the external project
  # might be mercurial, svn, git, or an archive download.
  if(DEFINED ${proj}_hg_tag)
    set(download_args
      HG_REPOSITORY ${${proj}_url}
      HG_TAG ${${proj}_hg_tag})
  elseif(DEFINED ${proj}_svn_revision)
    set(download_args
    SVN_REPOSITORY ${${proj}_url}
    SVN_REVISION -r ${${proj}_revision})
  elseif(DEFINED ${proj}_download_hash)
    set(download_args
    URL ${${proj}_url}
    URL_MD5 ${${proj}_download_hash})
  else()
    set(download_args
      GIT_REPOSITORY ${${proj}_url}
      GIT_TAG ${${proj}_revision})
  endif()

  # if this variable is not defined then this external will be treated as
  # a standard pod so we'll define the required configure and build commands
  if(NOT DEFINED ${proj}_external_args)
    set(pod_build_args
      CONFIGURE_COMMAND ${empty_command}
      INSTALL_COMMAND ${empty_command}
      BUILD_COMMAND $(MAKE) BUILD_PREFIX=${CMAKE_INSTALL_PREFIX} BUILD_TYPE=${CMAKE_BUILD_TYPE} ${${proj}_environment_args}
      BUILD_IN_SOURCE 1
    )
    set(${proj}_external_args ${pod_build_args})
    set(${proj}_is_pod TRUE)
  endif()

  # this supports non-standard download locations
  set(source_dir_arg)
  list(FIND ${proj}_external_args SOURCE_DIR res)
  if (res EQUAL -1)
    set(source_dir_arg SOURCE_DIR ${source_prefix}/${proj})
  endif()

  # workaround a cmake issue, we need to support empty strings as list elements
  # so replace the string NONE with empty string here right before arg conversion
  # and then the variable will be quoted in the following call to ExternalProject_Add.
  string(REGEX REPLACE "NONE" "" ${proj}_external_args "${${proj}_external_args}")

  ExternalProject_Add(${proj}
    DEPENDS ${${proj}_depends}
    ${download_args}
    ${source_dir_arg}
    "${${proj}_external_args}"
    )
endmacro()


foreach(external ${externals})
  add_external(${external})
endforeach()
