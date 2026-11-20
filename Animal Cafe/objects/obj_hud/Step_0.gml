// ----------------------------
//		   MONEY UPDATE
// ----------------------------
var money = instance_exists(strategic_layer_manager) ? strategic_layer_manager.money: 0;

if  (money > last_money){
	money_pop = 10;
}

last_money = money;

if(shown_money < money) {
	shown_money = min(shown_money + 1, money);
}	else {
	shown_money = money;
}

if(money_pop > 0){
	money_pop -= 1;
}