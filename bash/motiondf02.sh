#! /bin/bash
DF=`df | grep sda | awk '{print $(NF-1)}' | sed 's/[%]//g'`;
case $DF in
  [19][0-9][0]?$ )
    find /opt/video/cam* -mtime +10 -exec rm -rf {} \;
    DF1=`df | grep sd | awk '{print $(NF-1)}'`;
    echo $(date +%d-%m-%Y\ %H:%M:%S) "заполнение диска после очистки $DF1" >> /home/motion/disk-free.log
    ;;
  [8][0-9] ) 
    find /opt/video/cam* -mtime +20 -exec rm -rf {} \;
    DF1=`df | grep sd | awk '{print $(NF-1)}'`;
    echo $(date +%d-%m-%Y\ %H:%M:%S) "заполнение диска после очистки $DF1" >> /home/motion/disk-free.log
    ;;
  [7][0-9] ) 
    find /opt/video/cam* -mtime +30 -exec rm -rf {} \;
    DF1=`df | grep sd | awk '{print $(NF-1)}'`;
    echo $(date +%d-%m-%Y\ %H:%M:%S) "заполнение диска после очистки $DF1" >> /home/motion/disk-free.log
    ;;
  * )
    echo $(date +%d-%m-%Y\ %H:%M:%S) "текущее заполнение диска $DF" >> /home/motion/disk-free.log
    ;;
esac
exit 0;
