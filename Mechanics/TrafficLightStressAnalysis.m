
%Normal Stress of Horizontal Pole

    light_dist1 = 15.5 + 2.5/12; %feet
    light_dist2 = light_dist1 + 15;
    light_dist3 = light_dist2 + 15;
    poleH_dist = (15 + 15+ 15.5 + 2.5/12)/2;
    poleV_dist = 2.5/12;
    sign_dist = light_dist1 + 7.5;
    
    densitySteel = 483.8167; %lbm/ft^3
    volH = pi * light_dist3 * (radiusOuterH^2 - radiusInnerH^2); %ft^3
    massH = densitySteel * volH;
    forcePoleH = massH * 32.2;
    
    heightV = 265 / 12;
    volV = pi * heightV * (radiusOuterV^2 - radiusInnerV^2);
    massV = densitySteel * volV;
    forcePoleV = massV * 32.2;
    
    volSign = 5 * 10 * .1;
    densityAl = 168.555; %lbm/ft^3
    massSign = volSign * densityAl;
    forceSign = massSign * 32.2;
    
    forceLight = 45; %pounds
    
    radiusOuterH = 0.5;%feet
    radiusInnerH = 5/12;%feet
    momentOfInertia_Horiz = pi/4 * (radiusOuterH^4 - radiusInnerH^4);
    
    Mx = forceLight*light_dist1 + forceLight*light_dist2 + forceLight*light_dist3 + forcePoleH*poleH_dist + forceSign*sign_dist - forcePoleV*poleV_dist;
    %{
    Above calculates the moment about the shear axis, used in bending moment
    calculation
    %}

    bendingStressHorizontal = Mx * radiusOuterH / momentOfInertia_Horiz / 12^2 / 1000 %ksi

%Shear Stress of Horizontal Pole

    Vz = 3 * forceLight + forcePoleH + forceSign;
    %{
    Above calculates the shear force about the face of the cross section, used
    in the shear flow calculation
    %}
    
    Q_Horiz = 2/3 * (radiusOuterH^3 - radiusInnerH^3);
    t = 2 * (radiusOuterH - radiusInnerH);
    %{
    Above calculates the max first moment of area
    %}
    
    shearFlowHorizontal = Vz * Q_Horiz / (momentOfInertia_Horiz * t) / 12^2 / 1000 %ksi


%Normal Stress of Vertical Pole
    
    radiusOuterV = 9/12; %feet
    radiusInnerV = 7/12;
    momentofInertiaV = pi/4 * (radiusOuterV^4 - radiusInnerV^4);
    
    axialStressVert = Vz / (pi * (radiusOuterV^2 - radiusInnerV^2)) / 12^2 / 1000 %ksi
    
    bendingStressVert = Mx * radiusOuterV / momentofInertiaV / 12^2 / 1000 %ksi

%Shear Stress of Vertical Pole is zero

%Deformation Analysis
    E = 29000 * 1000 * 144; %ksi ---> lb/ft^2
    
    def_pole = 5 * forcePoleH * poleH_dist^3 / (48 * E * momentOfInertia_Horiz); %feet
    
    def_sign = forceSign * sign_dist^3 / (E * momentOfInertia_Horiz);
    
    def_light1 = forceLight * light_dist1^3 / (E * momentOfInertia_Horiz);
    
    def_light2 = forceLight * light_dist2^3 / (E * momentOfInertia_Horiz);
    
    def_light3 = forceLight * light_dist3^3 / (E * momentOfInertia_Horiz);
    
    def_total = (def_pole + def_sign + def_light1 + def_light2 + def_light3) / 12