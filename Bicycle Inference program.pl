components( saddle ).
components( seatclamp ).
components( seatpost ).
components( seatpostclamp ).
components( caliperbrake ).
components( gearcable ).
components( rearsprockets ).
components( rearderaileur ).
components( rim ).
components( tyre ).
components( brakecable ).
components( frame ).
components( headset ).
components( stem ).
components( drophandlebar ).
components( brakehood ).
components( brakeshiftlever ).
components( discbrake ).
components( quickreleaseskewer ).
components( wheelhub ).
components( spoke ).
components( spokeripple ).
components( valvestem ).
components( chainrings ).
components( chain ).
components( frontderaileur ).
components( pedal ).
components( pedalcrankarm ).
components( front_wheel ).
components( back_wheel ).
components( frame ).
components( front_set ).
components( saddle_area ).


substructure( bicycle, [quant( front_wheel, 1 ),quant( back_wheel, 1 ), quant( frame, 1 ), quant(saddle_area,1),
                  quant(front_set,1), quant(driving_set,1)] ).

substructure( saddle_area, [quant( saddle, 1 ), quant( seatclamp, 1 ),
                       quant(seatpost,1), quant(seatpostclamp,1) ] ).

substructure( front_set, [quant( headset, 1 ), quant( stem, 1 ),
                     quant(drophandlebar, 1), quant(brakehood,1), quant(brakeshiftlever,1)]).

substructure( front_wheel, [quant( spoke, 20 ), quant( rim, 1 ), quant( tyre, 1)
							, quant( discbrake, 1), quant( quickreleaseskewer, 1), quant( wheelhub, 1)
							, quant( spokeripple, 1), quant( valvestem, 1)] ).

substructure( back_wheel, [quant( spoke, 20 ), quant( rim, 1 ), quant( tyre, 1)
							, quant( spokeripple, 1), quant( valvestem, 1), quant(caliperbrake,1)] ).

substructure( driving_set, [quant( pedal, 1), quant( pedalcrankarm, 1 ), quant( chainrings, 1 ), quant( chain, 1 )
			, quant( pedalcrankarm, 1 ), quant( gearcable, 1 )] ).

substructure( frame, [quant( frontderaileur, 1 ), quant( rearderaileur, 1 ), quant( rearsprockets, 1 ), quant( driving_set, 1 )] ).

substructureof( Y, [Y] ) :- components( Y ).
substructureof( Y, Z ) :- substructure( Y, Subparts ),
                   substructureoflist( Subparts, Z ).

substructureoflist( [], [] ).
substructureoflist( [quant( Y,N ) | Tail ], Total ) :-
             substructureof( Y, Headparts ),
             substructureoflist( Tail, Tailparts ),
             append( Headparts, Tailparts, Total ).

append( [], L, L ).
append( [Y|L1], L2, [Y|L3] ) :- append( L1, L2, L3 ).
