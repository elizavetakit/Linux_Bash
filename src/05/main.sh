#!/bin/bash
if ! [[ $# -eq 1 ]]
    then
        printf "The number of arguments must be exactly 1 and should contain relative or absolute path to directory\n"
        exit 1
    elif ! [[ $1 =~ /$ ]]
    then
        printf "The path must end with an '/' symbol\n"
        exit 1
    elif ! [[ -d $1 ]]
    then
        printf "Invalid path\n"
        exit 1
fi

total="$(find $1 -type d 2>/dev/null | wc -l)"
echo "Total number of folders (including all nested ones) = $total"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
TOP_1="$(du -a $1 | sort -n -r | head -n 5 | awk '{print $2}' | sed -n '1p')"
mem_top1="$(du -a $1 | sort -n -r | head -n 5 | awk '{print $1}' | sed -n '1p')"
TOP_2="$(du -a $1 | sort -n -r | head -n 5 | awk '{print $2}' | sed -n '2p')"
mem_top2="$(du -a $1 | sort -n -r | head -n 5 | awk '{print $1}' | sed -n '2p')"
TOP_3="$(du -a $1 | sort -n -r | head -n 5 | awk '{print $2}' | sed -n '3p')"
mem_top3="$(du -a $1 | sort -n -r | head -n 5 | awk '{print $1}' | sed -n '3p')"
TOP_4="$(du -a $1 | sort -n -r | head -n 5 | awk '{print $2}' | sed -n '4p')"
mem_top4="$(du -a $1 | sort -n -r | head -n 5 | awk '{print $1}' | sed -n '4p')"
TOP_5="$(du -a $1 | sort -n -r | head -n 5 | awk '{print $2}' | sed -n '5p')"
mem_top5="$(du -a $1 | sort -n -r | head -n 5 | awk '{print $1}' | sed -n '5p')"
echo "  1 - $TOP_1, $mem_top1 Mb"
echo "  2 - $TOP_2, $mem_top2 Mb"
echo "  3 - $TOP_3, $mem_top3 Mb"
echo "  4 - $TOP_4, $mem_top4 Mb"
echo "  5 - $TOP_5, $mem_top5 Mb"
total_files="$(ls -l $1 | sed -n '1p' | awk '{print $2}' )"
echo "Total number of files = "$total_files
echo "Number of:"
conf_file="$(find $1 -name '*.conf' 2>/dev/null | wc -l)"
echo "Configuration files (with the .conf extension) = "$conf_file
txt_file="$(find $1 -name '*.txt' 2>/dev/null | wc -l)"
echo "Text files = "$txt_file
exec_file="$(find $1 -type f -executable 2>/dev/null | wc -l)"
echo "Executable files = "$exec_file
log_file="$(find $1 -name '*.log' 2>/dev/null | wc -l)"
echo "Log files (with the extension .log) = "$log_file
arch_file="$(find $1 -name "*.zip" -o name "*.rar" -o name "*.bz2" -o -name "*.7z" -o -name "*.gz" -o -name "*.tar" 2> /dev/null | wc -l)"
echo "Archive files = "$arch_file
symb_file="$(find $1 -type l 2>/dev/null | wc -l)"
echo "Symbolic links = "$symb_file
TOP_10="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | head -n 10 | awk -F'\t' '{ split($2, a, "."); print "- "$2", "$1", "a[2]}' | nl)"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$TOP_10"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
top_1_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '1p' | awk '{print $2}')"
mem_1_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '1p' | awk '{print $1}')"
hesh_1_exec="$(md5sum $top_1_exec | awk '{print $1}')"
echo "  1 - $top_1_exec, $mem_1_exec, $hesh_1_exec"
top_2_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '2p' | awk '{print $2}')"
mem_2_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '2p' | awk '{print $1}')"
hesh_2_exec="$(md5sum $top_2_exec | awk '{print $1}')"
echo "  2 - $top_2_exec, $mem_2_exec, $hesh_2_exec"
top_3_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '3p' | awk '{print $2}')"
mem_3_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '3p' | awk '{print $1}')"
hesh_3_exec="$(md5sum $top_3_exec | awk '{print $1}')"
echo "  3 - $top_3_exec, $mem_3_exec, $hesh_3_exec"
top_4_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '4p' | awk '{print $2}')"
mem_4_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '4p' | awk '{print $1}')"
hesh_4_exec="$(md5sum $top_4_exec | awk '{print $1}')"
echo "  4 - $top_4_exec, $mem_4_exec, $hesh_4_exec"
top_5_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '5p' | awk '{print $2}')"
mem_5_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '5p' | awk '{print $1}')"
hesh_5_exec="$(md5sum $top_5_exec | awk '{print $1}')"
echo "  5 - $top_5_exec, $mem_5_exec, $hesh_5_exec"
top_6_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '6p' | awk '{print $2}')"
mem_6_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '6p' | awk '{print $1}')"
hesh_6_exec="$(md5sum $top_6_exec | awk '{print $1}')"
echo "  6 - $top_6_exec, $mem_6_exec, $hesh_6_exec"
top_7_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '7p' | awk '{print $2}')"
mem_7_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '7p' | awk '{print $1}')"
hesh_7_exec="$(md5sum $top_7_exec | awk '{print $1}')"
echo "  7 - $top_7_exec, $mem_7_exec, $hesh_7_exec"
top_8_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '8p' | awk '{print $2}')"
mem_8_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '8p' | awk '{print $1}')"
hesh_8_exec="$(md5sum $top_8_exec | awk '{print $1}')"
echo "  8 - $top_8_exec, $mem_8_exec, $hesh_8_exec"
top_9_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '9p' | awk '{print $2}')"
mem_9_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '9p' | awk '{print $1}')"
hesh_9_exec="$(md5sum $top_9_exec | awk '{print $1}')"
echo "  9 - $top_9_exec, $mem_9_exec, $hesh_9_exec"
top_10_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '10p' | awk '{print $2}')"
mem_10_exec="$(find $1 -type f -not -path '*/\.*' -exec du -Sh {} + 2> /dev/null | sort -rh | sed -n '10p' | awk '{print $1}')"
hesh_10_exec="$(md5sum $top_10_exec | awk '{print $1}')"
echo "  10 - $top_10_exec, $mem_10_exec, $hesh_10_exec"
exec_time="$(cat /proc/uptime | awk '{print$1}') - $exec_time"
exec_time=$(echo $exec_time | bc)
printf "Script execution time (in seconds): %.2f\n "$exec_time