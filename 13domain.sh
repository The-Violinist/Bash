### VARIABLES ###
# Ask the user for a web address to lookup
read -p "Please enter a web address:"$'\n' addr

# Extract IP address from dig output using regex
dig_out=$(dig $addr | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
dig_addr=$(echo $dig_out | head -n1 | awk '{print $1;}')

# Array of commands names
commands=("Expiration" "IP" "Reverse" "NS")

# Array of functions
funcs=(expiry ip_address rev_lu ns)

### FUNCTIONS ###
# Print the expiration date of a domain
expiry (){
echo "The expiration date of $addr is: "
whois $addr | grep 'Expiration' | awk '{print $5}'
}

# Print IP address extracted using dig
ip_address (){
echo "The IP address of $addr is $dig_addr"
}

# Reverse lookup of IP address
rev_lu (){
echo "Reverse lookup:"
host $dig_addr
}

# Lookup the Name Server for the supplied web address
ns (){
echo "Name Server info:"
nslookup $addr
}

yes_no (){
    i=0
    for item in ${commands[@]}
    do
    read -p "Would you like to view $item information?"$'\n' answer
        if [[ $answer == y || $answer == yes ]]
        then
            ${funcs[i]}
            #echo ${arr[0]}
            ((i++))
        fi
    done
}
yes_no