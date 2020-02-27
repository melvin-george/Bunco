rolldie()
{
   local result=$1
   rolled=$(( ( $RANDOM % 6 ) + 1 ))
   eval $result=$rolled
}

BuncoRound()
{
 
   local score=0 ; local round=$1 ; local hidescore=0

   rolldie die1 ; rolldie die2 ; rolldie die3
   echo Round $round. You rolled: $die1 $die2 $die3

   if [ $die1 -eq $die2 ] && [ $die2 -eq $die3 ] ; then
     if [ $die1 -eq $round ] ; then
       echo -e "\t BUNCO!"
       score=25
       hidescore=1
     else
       echo -e "\t MINI BUNCO!"
       score=5
       hidescore=1
     fi
   else
     if [ $die1 -eq $round ] ; then
       score=1
     fi
     if [ $die2 -eq $round ] ; then
       score=$(( $score + 1 ))
     fi
     if [ $die3 -eq $round ] ; then
       score=$(( $score + 1 ))
     fi
   fi

   if [ $hidescore -eq 0 ] ; then
     echo -e "\t Score this round: $score"
   fi

   totalscore=$(( $totalscore + $score ))
   
}


for round in {1..6} ; do
  BuncoRound $round
done

echo "Total Score = $totalscore"
