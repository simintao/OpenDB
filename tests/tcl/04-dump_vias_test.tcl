set tcl_dir [file dirname [file normalize [info script]]]
set tests_dir [file dirname $tcl_dir]
set data_dir [file join $tests_dir "data"]
source [file join $tcl_dir "test_helpers.tcl"]

set db [dbDatabase_create]
set lib [odb_read_lef $db $data_dir/gscl45nm.lef]
set tech [$lib getTech]
set vias [$tech getVias]
foreach via $vias {
    puts [$via getName]
}

exit [expr [llength $vias] != 14]
