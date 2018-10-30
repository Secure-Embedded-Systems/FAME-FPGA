set module [lindex $quartus(args) 0] 
if [string match "quartus_asm" $module] {# Generating .jic file based on .cof file 
set cmd "quartus_cpf -c convertsoftojic.cof" 
post_message "Generated .jic file with date and time" 
# If the command can't be run, return an error. 
if { [catch {open "|$cmd"} input] } { 
return -code error $input 
} 
}
