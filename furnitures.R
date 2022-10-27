House
h <- data.frame(House)
h
View(h)
## checking if there is any null values in r

is.null(h)

##there is no null values in the data sets... so we move on to the next stage which is data manipulation
## First we have to call in the library 'dplyr' 

library('dplyr')
View(h)
price <- h %>% select(bedrooms,bathrooms,furnishingstatus,price)
price
View(price)

## now to bring o the highest price of furnished housing
fur <- h %>% select( furnishingstatus, price) %>% arrange(desc(price)) 
View(fur)

### Getting the total and average mean of the different furnishing status to help us determine which type of housing is mostly affordable
## first get the sum of the total price

Total_price <- h%>% summarise(price_total = sum(price))
Total_price

price_avg <- h%>% summarise(price_avg = mean(price))
price_avg

## First the sum of furnished, semi-furnished and unfurnished

table <- h%>% select(furnishingstatus, price) %>% filter(furnishingstatus =='semi-furnished') %>% arrange(desc(price))
table
View(table)

## sum of furnished house
f <- h %>%  filter(furnishingstatus =='furnished') %>% summarise(furnished_sum =sum(price))
f

## then to get the average price of furnished
avgg_f<- h %>%  filter(furnishingstatus =='furnished') %>% summarise(furnished_average =mean(price))
avgg_f


## sum and average of unfurnished
u <- h %>%  filter(furnishingstatus =='unfurnished') %>% summarise(unfurnished_sum =sum(price))
u

avg_u <- h %>%  filter(furnishingstatus =='unfurnished') %>% summarise(unfurnished_average =mean(price))
avg_u


## Sum and average for semifurnished
s <- h%>% filter(furnishingstatus == 'semi-furnished') %>% summarise(sfurnished_sum =sum(price))
s

avg_s <- h %>%  filter(furnishingstatus =='semi-furnished') %>% summarise(sfurnished_avg =mean(price))
avg_s


## From the analysis performed i have identified that unfurnished house is more affordable than both furnished and semi-furnished and 
the number of semi-furnished house is higher than that of furnished and unfurnished.

## highest bathroom number

bed_room <-  h%>% filter(bedrooms == max(bedrooms))
bed_room
View(bed_room)

