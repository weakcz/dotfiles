#####################################################################
#																	#
#	Script for checking your Monero balance in xmr.nanopool.com		#
#																	#
#####################################################################

# Your Monero Wallet
wallet="46BAYFmSziKYpTfKdnrM6veackYRBd65B4dNmKwfjMeRhjWRDX9knsAhZNPbHJBWYnBuGc6hT9HVwLvVLj3NEFRuRyp5gpQ"

# Your Currency
# Enter in format like usd, eur, czk 
currency="czk"

# Your currency label
# Put in whatever you like. Mind that this is showed after your actual balance
currency_label=" Korun"

# What is showing in polybar
# Options are:
# 	xmr: shows your monero balance
#	currency: shows your monero balance in your chosen currency
output="currency"

# SCRIPT
# Do not change if you dont know what you are doing

# get your balance from nanopool.org 
xmr="curl -s 'https://api.nanopool.org/v1/xmr/balance/'$wallet | jq -r '.data'"
# process data
xmr_balance=$(eval "$xmr")

# get price in your chosen currency for xmr
curr=$(eval "curl -s "https://api.coingecko.com/api/v3/coins/monero" | jq -r '.market_data.current_price.$currency'")

# trim output of your currency from something like 12.333333333 to 12.33 
curr_balance=$(LC_NUMERIC="en_US.UTF-8" printf "%.2f\n" $(echo "$curr*$xmr_balance" | bc -l))

# output datafile
output_file="/home/weak/xmr-data.md"


function output()
{
	file=$output_file

	if [ ! -e "$file" ]; then
    	touch $file
		printf "|        Datum           |    Čas   |        Monero       |   Kč  |\n" >> $file
		printf "| ---------------------- | -------- | ------------------- | ----- |\n" >> $file
		printf "| $(date '+%A %d. %B %Y | %H:%M.%S') | $xmr_balance | $curr_balance |\n" >> $file

	else 
    	printf "| $(date '+%A %d. %B %Y | %H:%M.%S') | $xmr_balance | $curr_balance |\n" >> $file
	fi 	
}

if [ $xmr_balance == "null" ]
	then
		echo "Wrong Wallet"
	else
		case $output in
			currency)
				echo $curr_balance $currency_label
			;;
			xmr)
				echo $xmr_balance
			;;
		esac
		output
fi

