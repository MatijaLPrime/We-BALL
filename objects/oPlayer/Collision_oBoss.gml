if(bossAttackCount == 0){
    bossAttackCount = 120;
}

bossAttackCount -= 1

playerHP -= 1;
oBounderies.bump();
oBounderies.knockBack(oBoss);