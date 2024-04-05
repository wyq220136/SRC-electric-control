# 嵌入式代码阅读笔记

# robot.c：控制器主程序
控制器相关变量：
  mode（模式），freq（频率），angle（角度），num

重要函数：
do_power_monitor ；电池电压监控，返回1表示电池电压降到阈值1 返回2表示电池电压降到阈值2 返回0 电池电压正常。
do_run ：工作模式（mode）选择，无输入无输出。

变量mode：
BlUETOOTH_MODE：蓝牙模式，转化为其他模式  NORMAL_MODE：正常模式 JOYSTICK_MODE：游戏手柄模式 
SELFTEST_MODE：自检模式，检查平射挑射   DEBUG_MODE：和PC机交互，用于检查  PID_TUNE_MODE
SHOOT_POWER_CURVE_TUNE_MODE    ACTION_TUNE_MODE
  DEBUG_MODE包含SET_MOTOR_PID，GET_CONTROL_STATUS，GET_CPU_ID，SNET_ULOCK_FALSH_RDPROTECTION，GET_CAP_VOLATAGE，SET_ROBOT_DO_SHOOT等模式

# action.c
重要函数：
do_move：执行运动函数，设定小车的x,y,z的速度，形参为x,y,z速度，速度单位为国际单位
do_shoot：执行平射命令，形参shoot为1时,若嘴里有球才能平射,若嘴里没球,则不射门重新开启红外中断
do_chip：执行挑射命令，形参chip为1时,若嘴里有球才能挑射,若嘴里没球,则不射门重新开启红外中断
do_robot_command：执行控制器命令运动机器人 手柄模式下调用（与JOYSTICK_MODE模式有关）
do_test_move：移动测试

# MPU6050_driver
