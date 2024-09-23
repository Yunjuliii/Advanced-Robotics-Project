function [F, M, trpy, drpy] = controller(qd, t, qn, params)
% CONTROLLER quadrotor controller
% The current states are:
% qd{qn}.pos, qd{qn}.vel, qd{qn}.euler = [roll;pitch;yaw], qd{qn}.omega
% The desired states are:
% qd{qn}.pos_des, qd{qn}.vel_des, qd{qn}.acc_des, qd{qn}.yaw_des, qd{qn}.yawdot_des
% Using these current and desired states, you have to compute the desired controls

% position controller params
Kp = [15;15;30];
Kd = [12;12;10];

% attitude controller params  pd的参数（角度）
KpM = ones(3,1)*3000;      % 比例常数
KdM = ones(3,1)*300;       % 微分常数

% Using pd to make the position to desired one, input is acceleration, it's
% positive when c=velocity and position is not enough
acc_des =  Kd.*(qd{qn}.vel_des - qd{qn}.vel) + Kp.*(qd{qn}.pos_des - qd{qn}.pos);

% Desired roll, pitch and yaw, it's decided by the desired acc
phi_des = 1/params.grav * (acc_des(1)*sin(qd{qn}.yaw_des) - acc_des(2)*cos(qd{qn}.yaw_des));
theta_des = 1/params.grav * (acc_des(1)*cos(qd{qn}.yaw_des) + acc_des(2)*sin(qd{qn}.yaw_des));
psi_des = qd{qn}.yaw_des;

euler_des = [phi_des;theta_des;psi_des];
pqr_des = [0;0; qd{qn}.yawdot_des];
% Thurst
qd{qn}.acc_des(3);
F  = params.mass*(params.grav + acc_des(3));
% Moment
M =  params.I*(KdM.*(pqr_des - qd{qn}.omega) + KpM.*(euler_des - qd{qn}.euler));
% =================== Your code ends here ===================

% Output trpy and drpy as in hardware
trpy = [F, phi_des, theta_des, psi_des];
drpy = [0, 0,       0,         0];

end