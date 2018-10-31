cmake_minimum_required(VERSION 3.1)

project(PDFReader VERSION 0.1)

include(FeatureSummary)
find_package(ECM 5.27.0 CONFIG)
set_package_properties(ECM PROPERTIES TYPE REQUIRED DESCRIPTION "Extra CMake Modules." URL "https://projects.kde.org/projects/frameworks/extra-cmake-modules")
feature_summary(WHAT REQUIRED_PACKAGES_NOT_FOUND FATAL_ON_MISSING_REQUIRED_PACKAGES)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

include(KDEInstallDirs)

if (UNIX AND NOT APPLE)
    set(FALKON_INSTALL_PLUGINDIR "${KDE_INSTALL_PLUGINDIR}/falkon")
else()
    set(FALKON_INSTALL_PLUGINDIR "${KDE_INSTALL_PLUGINDIR}")
endif()

function(install_qml_script name)
    install(
        DIRECTORY ${name}
        DESTINATION "${FALKON_INSTALL_PLUGINDIR}/qml"
        FILES_MATCHING PATTERN "*" PATTERN "Messages.sh" EXCLUDE
    )
endfunction()

install_qml_script(pdfreader)
