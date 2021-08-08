#!/bin/bash

wait_for_result () {
    local result
    {
        ghdl $@ &&
        result="OK"
    } || {
        check_result="Failed"
    }
    echo "$result"

}

wait_for_build () {
    local result
    {
        ghdl -e $1 &&
        result="OK"
    } || {
        check_result="Failed"
    }
    echo "$result"
}

wait_for_dump () {
    local result
    {
        ghdl -r $1 --vcd=$2 &&
        result="OK"
    } || {
        check_result="Failed"
    }
    echo "$result"
}

for file in "$@"
do
    filename="$(basename -- $file)"
    filepath="${file%/$filename}/"
    
    syntax_check_result="$(wait_for_result -s $file)"
    echo "$file: Syntax-Check $syntax_check_result"
    if [ "$syntax_check_result" = "Failed" ]; then
        exit
    fi

     analyse_check_result="$(wait_for_result -a $file)"
    echo "$file: Analyse-Check $analyse_check_result"
    if [ "$analyse_check_result" = "Failed" ]; then
        exit
    fi
    
    entity="$(grep -o -P '(?<=entity ).*(?= is)' $file)"      
    build_result="$(wait_for_build $entity)"
    echo "$file $entity: Build $build_result"
    if [ "$build_result" = "Failed" ]; then
        exit
    fi
done

for file in "${!#}"
do
    filename="$(basename -- $file)"
    filepath="${file%/$filename}/"

    entity="$(grep -o -P '(?<=entity ).*(?= is)' $file)"      
    dump_result="$(wait_for_dump $entity $entity.vcd)"
    echo "$file $entity: VCD-Dump $dump_result"
    if [ "$dump_result" = "Failed" ]; then
        exit
    fi
    
    echo "Startet GTKWave"
    gtkwave "$entity.vcd"
    exit
done

