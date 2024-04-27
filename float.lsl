float radius = 3.0;

float tau = 6.0;

vector vv;
float extraHeight = 0;

default

{

    state_entry()
    {
        vv = llGetPos();
        if (extraHeight > 0) vv.z = extraHeight;
        llSetStatus( STATUS_ROTATE_X | STATUS_ROTATE_Y, FALSE);
        llSetStatus( STATUS_ROTATE_Z | STATUS_PHYSICS, TRUE);
        llSetBuoyancy( 1.0);
        if ( llFabs( vv.z - llWater( vv )) < 5.0) vv.z = llWater( vv );
        llMoveToTarget( vv, tau);
        llSetTimerEvent( 1.0 );
    }

    timer()
    {
        llMoveToTarget( vv + radius*< llFrand( 2.0)-1.0, llFrand( 2.0)-1.0, 0.0>, tau);
        llSetTimerEvent( 2.0 + llFrand( 4.0));
    }

    on_rez(integer param) { llResetScript(); }
}
