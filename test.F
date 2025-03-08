!phys/module_mp_morr_two_moment.F

SUBROUTINE MORR_TWO_MOMENT_MICRO ( )

! Add by zy for CCN exponentially decreased with height 2022/04/12
if (ZQ(k).lt.2000) then
   NDCNST=250
else if (ZQ(k).gt.10000) then
     NDCNST=0.0001
else
   NDCNST=real(nint(9940*exp(-1.84*zq(k)/1000.0)*10000))/10000
end if

END SUBROUTINE MORR_TWO_MOMENT_MICRO
