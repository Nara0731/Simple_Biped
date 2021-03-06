function C = packConstraints(Cst,Phase)

%This function takes a struct of constraints (Cst) and packs it into a matrix to
%be exported to GPOPS. The constraints are different for each phase of
%motion and for the discrete events.

switch Phase
    case 'D'
        C = [...
            Cst.footOneContactAngle,...  %=atan2(H1,V1);
            Cst.footTwoContactAngle,...  %=atan2(H2,V2);
            Cst.legOneLength,...
            Cst.legTwoLength,...
            ];
    case 'S1'
        C = [...
            Cst.footOneContactAngle,...  %=atan2(H1,V1);
            Cst.legOneLength,...
            Cst.legTwoLength,...
            ];
    case 'S2'
        C = [...
            Cst.footTwoContactAngle,...  %=atan2(H2,V2);
            Cst.legOneLength,...
            Cst.legTwoLength,...
            ];
    case 'event_walking'
        %All of these should be constrained to be zero
        C(1).event = Cst.defect_12;  %[1 x 8]
        C(2).event = Cst.periodic;   %[1 x 8];
        C(3).event = Cst.time;       %[1 x 1]

    otherwise
        error('Invalid mode string!')
end

end