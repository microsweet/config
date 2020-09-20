#!/usr/bin/env python
# encoding: utf-
import RPi.GPIO
import time
import subprocess
import datetime
import sys
# import commands

ifStart = sys.argv[1]
RPi.GPIO.setwarnings(False)
RPi.GPIO.setmode(RPi.GPIO.BCM)
#我用的gpio7对应的bcm是4，这里根据自己的接法修改
RPi.GPIO.setup(4, RPi.GPIO.OUT)
pwm = RPi.GPIO.PWM(4, 100)
pwm.ChangeFrequency(100)
RPi.GPIO.setwarnings(False)

pwmStatus = True
speed = 100

prv_temp = 0
try:
    logPath = '/home/microsweet/fan.log'
    # startTime = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    # with open(logPath, 'w') as fobj:
    # fobj.write('start time: ' + startTime + '\n')

    while True:
        if ifStart=='true':
            pwm.start(0)
            ifStart = 'false'
        nowtime = int(time.strftime('%H',time.localtime(time.time())))
        if pwmStatus and (nowtime > 21 or nowtime < 7):
            pwm.stop()
            pwmStatus = False
            # print('false')
        elif not pwmStatus and nowtime >7 and nowtime <21:
            pwm.start(0)
            pwmStatus = True
            # print('true')
        tmpFile = open('/sys/class/thermal/thermal_zone0/temp')
        cpu_temp = int(tmpFile.read())
        cpu_temp_print = round(cpu_temp / 1000, 2)
        tmpFile.close()
        # logFile = open(logPath, 'a')
        logFile = open(logPath, 'w')
        # print(cpu_temp)
        if cpu_temp >= 34500:
            if prv_temp < 34500:
                #启动时防止风扇卡死先全功率转0.1秒
                # pwm.start(0)
                pwm.ChangeDutyCycle(speed)
                time.sleep(1)
                # speed = min(cpu_temp / 125 - 257, 100)
            # speed = round(max(min(cpu_temp / 125 - 257, 100), 1), 2)
            speed = round(max(min(cpu_temp / 125 - 307, 100), 1), 20)
            # speed = round(max(min(cpu_temp / 125 - 357, 100), 1), 2)
            pwm.ChangeDutyCycle(speed)
            log_line = datetime.datetime.now().strftime(
                '%Y-%m-%d %H:%M:%S') + ': temp:' + str(
                    cpu_temp_print) + '℃ , speed:' + str(speed) + '% \n'
            logFile.write(log_line)
            # pwm.stop()
            logFile.close()
            prv_temp = cpu_temp
            time.sleep(5)
        else:
            pwm.stop()
except KeyboardInterrupt:
    pass
pwm.stop()
