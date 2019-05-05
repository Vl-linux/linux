#! /bin/bash
DF1=`df | grep /dev/sdb5 | awk '{print $(NF-1)}'`;
if [[ $DF1 =~ ^[189][0-9][0]?[%]$ ]];
  then
  find /home/motion/cam* -mtime +30 -exec rm -rf {} \;
  DF1=`df | grep /dev/sdb5 | awk '{print $(NF-1)}'`;
  echo $(date +%d-%m-%Y\ %H:%M:%S) "заполнение тома после очистки $DF1" >> /var/log/motiondf.log
  exit 0;
else
echo $(date +%d-%m-%Y\ %H:%M:%S) "текущее заполнение тома $DF1" >> /var/log/motiondf.log
fi
exit 0;
