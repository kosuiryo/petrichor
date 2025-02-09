set(prefix "${CMAKE_BINARY_DIR}/deps")
set(PAIRING_LIBRARY "${prefix}/${CMAKE_INSTALL_LIBDIR}/${CMAKE_STATIC_LIBRARY_PREFIX}pairing${CMAKE_STATIC_LIBRARY_SUFFIX}")
set(PAIRING_INCLUDE_DIR "${prefix}/include")
set(LIBRARY_DIR "${prefix}/${CMAKE_INSTALL_LIBDIR}/")

ExternalProject_Add(pairing
    PREFIX "${prefix}"
    URL https://github.com/petrichor-dev/pairing-ariel/archive/ef052cf4fde9f6bb3a53a2114f7f8f76c13ba218.tar.gz
		URL_HASH SHA256=18c02869af73a3269c71b4bd96dc13391c5ecd1a218e08f17bd6845d926aea86
    BUILD_BYPRODUCTS "${PAIRING_LIBRARY}"
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR> -DCMAKE_INSTALL_DIR=<INSTALL_DIR>
    -DCMAKE_LIB_TARGET_LOCATION=${LIBRARY_DIR}
)

add_library(Pairing STATIC IMPORTED)
set_property(TARGET Pairing PROPERTY IMPORTED_CONFIGURATIONS Release)
set_property(TARGET Pairing PROPERTY IMPORTED_LOCATION_RELEASE ${PAIRING_LIBRARY})
set_property(TARGET Pairing PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${PAIRING_INCLUDE_DIR})
add_dependencies(Pairing pairing)
