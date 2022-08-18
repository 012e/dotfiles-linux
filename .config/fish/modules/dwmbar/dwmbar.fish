function mydate
    echo  (date "+%a %d/%m %T")
end

function volume
    set -f volume (pamixer --get-volume)
    set -f muted (pamixer --get-mute)
    if $muted = true
        echo muted
        return 0
    end
    if [ $volume -le 33 ]
        echo 奄 $volume
    else if [ $volume -le 66 ]
        echo 奔 $volume
    else
        echo 墳 $volume
    end
end

function ram_usage
    echo (free -m | grep '^Mem' | awk '{print $3"MB"}')
end

function cpu_temp
    echo (sensors -u | rg temp1_input | awk -c 'NR==1{sub(/\..*/,""); print$2}')C
end

function cpu_usage
    echo (top -bn1 | rg "Cpu" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1"%"}')
end

function update_dwmbar
    xsetroot -name "|  \
"(cpu_usage)" \
"(cpu_temp)" \
"(ram_usage)" | \
"(volume)" | \
"(mydate)" |"
end
