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


|\hzo{line 1588}|
|\textcolor{blue}{! Add by zy for CCN exponentially decreased with height 2022/12/08}|
|\textcolor{blue}{if(ZQ(k).lt.2000) then}|
    |\textcolor{blue}{NDCNST=250}|
|\textcolor{blue}{else if (ZQ(k).gt.10000) then}|
    |\textcolor{blue}{NDCNST=10}|
|\textcolor{blue}{else}|
    |\textcolor{blue}{NDCNST=real(nint(559*exp(-0.0004*zq(k))))}|
|\textcolor{blue}{end if}|                                          

|\hzo{line 1860}|
|\textcolor{zebraMLV}{[T>0,iinum]}|
!HM ADD, ALLOW FOR CONSTANT DROPLET NUMBER
! INUM = 0, PREDICT DROPLET NUMBER
! INUM = 1, SET CONSTANT DROPLET NUMBER

         IF (iinum.EQ.1) THEN
! CONVERT NDCNST FROM CM-3 TO KG-1
            NC3D(K)=NDCNST*1.E6/RHO(K)
         END IF

|\textcolor{blue}{         IF (iinum.EQ.-1) THEN }|
|\textcolor{blue}{! CONVERT NDCNST FROM CM-3 TO KG-1 }|
|\textcolor{blue}{            NC3D(K)=NDCNST*1.E6/RHO(K) }|
|\textcolor{blue}{         END IF }|

|\textcolor{blue}{         IF (iinum.EQ.0) THEN }|
|\textcolor{blue}{! CONVERT NDCNST FROM CM-3 TO KG-1 }|
|\textcolor{blue}{            NC3D(K)=NDCNST*1.E6/RHO(K) }|
|\textcolor{blue}{         END IF }|


|\hzo{line 2405}|
|\textcolor{zebraMLV}{[T<0,iinum]}|
!HM ADD, ALLOW FOR CONSTANT DROPLET NUMBER
! INUM = 0, PREDICT DROPLET NUMBER
! INUM = 1, SET CONSTANT DROPLET NUMBER

         IF (iinum.EQ.1) THEN
! CONVERT NDCNST FROM CM-3 TO KG-1
            NC3D(K)=NDCNST*1.E6/RHO(K)
         END IF

|\textcolor{blue}{         IF (iinum.EQ.-1) THEN}|
|\textcolor{blue}{! CONVERT NDCNST FROM CM-3 TO KG-1}|
|\textcolor{blue}{            NC3D(K)=NDCNST*1.E6/RHO(K)}|
|\textcolor{blue}{         END IF}|

|\textcolor{blue}{         IF (iinum.EQ.0) THEN}|
|\textcolor{blue}{! CONVERT NDCNST FROM CM-3 TO KG-1}|
|\textcolor{blue}{            NC3D(K)=NDCNST*1.E6/RHO(K)}|
|\textcolor{blue}{         END IF}|

|\hzo{line 3840}|
|\textcolor{zebraMLV}{[DUMI]}|
! SWITCH FOR CONSTANT DROPLET NUMBER
        IF (iinum.EQ.1) THEN
        DUMFNC(K) = NC3D(K)
        END IF

|\textcolor{blue}{IF (iinum.EQ.-1) THEN}|
|\textcolor{blue}{DUMFNC(K) = NC3D(K)}|
|\textcolor{blue}{END IF}|

|\textcolor{blue}{IF (iinum.EQ.0) THEN}|
|\textcolor{blue}{DUMFNC(K) = NC3D(K)}|
|\textcolor{blue}{END IF}|

|\hzo{line 4519}|
|\textcolor{zebraMLV}{[Bound]}|
! ADD BOUND ON DROPLET NUMBER - CANNOT EXCEED AEROSOL CONCENTRATION
          IF (iinum.EQ.0.AND.IACT.EQ.2) THEN
          NC3D(K) = MIN(NC3D(K),(NANEW1+NANEW2)/RHO(K))
          END IF
        |\hzo{!上面这个if永远进不来，因为ZhaoChun的代码设置了在iinum=0的时候，iact=3}|
! SWITCH FOR CONSTANT DROPLET NUMBER
          IF (iinum.EQ.1) THEN
! CHANGE NDCNST FROM CM-3 TO KG-1
             NC3D(K) = NDCNST*1.E6/RHO(K)
          END IF

|\textcolor{blue}{          IF (iinum.EQ.-1) THEN}|
|\textcolor{blue}{! CHANGE NDCNST FROM CM-3 TO KG-1}|
|\textcolor{blue}{             NC3D(K) = NDCNST*1.E6/RHO(K)}|
|\textcolor{blue}{          END IF}|

|\textcolor{blue}{          IF (iinum.EQ.0) THEN}|
|\textcolor{blue}{! CHANGE NDCNST FROM CM-3 TO KG-1}|
|\textcolor{blue}{             NC3D(K) = NDCNST*1.E6/RHO(K)}|
|\textcolor{blue}{          END IF}|

|\hzo{line 4753}|
END SUBROUTINE MORR_TWO_MOMENT_MICRO
