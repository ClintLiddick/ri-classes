function ee_pose = fk(q)
if ~isvector(q) or length(q) ~= 7
    error('Input must be a vector of length 7')
else
    %disp(q)
    % raw translations
    base_S   = makehgtform('translate', [.75, .5, 1.0])
    link_0_b = makehgtform('translate', [.22,.24,.346])
    link_1_0 = makehgtform('translate', [0,0,0])
    link_2_1 = makehgtform('translate', [0,0,0])
    link_3_2 = makehgtform('translate', [.045, 0, .55])
    link_4_3 = makehgtform('translate', [0,0,0])
    link_5_4 = makehgtform('translate', [-0.045, 0, .3])
    link_6_5 = makehgtform('translate', [0,0,0])
    link_7_6 = makehgtform('translate', [0,0,.06])
    tool_7   = makehgtform('translate', [0,0,.12])

    % add rotational transforms
    link_1_0 = link_1_0*makehgtform('xrotate', -pi/2)
    link_2_1 = link_2_1*makehgtform('xrotate',  pi/2)
    link_3_2 = link_3_2*makehgtform('xrotate', -pi/2)
    link_4_3 = link_4_3*makehgtform('xrotate',  pi/2)
    link_5_4 = link_5_4*makehgtform('xrotate', -pi/2)
    link_6_5 = link_6_5*makehgtform('xrotate',  pi/2)

    % joint rotations are all about their own frame's z-axis
    link_0_b = link_0_b*makehgtform('zrotate', q(1))
    link_1_0 = link_1_0*makehgtform('zrotate', q(2))
    link_2_1 = link_2_1*makehgtform('zrotate', q(3))
    link_3_2 = link_3_2*makehgtform('zrotate', q(4))
    link_4_3 = link_4_3*makehgtform('zrotate', q(5))
    link_5_4 = link_5_4*makehgtform('zrotate', q(6))
    link_6_5 = link_6_5*makehgtform('zrotate', q(7))
    
    tool_base = base_S*link_0_b*link_1_0*link_2_1*link_3_2*link_4_3*link_5_4*link_6_5*tool_7
    ee_pose = tool_base
end
