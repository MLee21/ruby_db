This is a system that takes an input of two formats within a file: comma-delimited or pipe-delimited. It will then output data in 3 different formats: 
* Output 1 – sorted by gender (females before males) then by last name ascending.
* Output 2 – sorted by birth date, ascending.
* Output 3 – sorted by last name, descending.

After cloning down the repo:

* run 'bundle'

To run the tests:

* run 'rspec'

To "populate the fake db":

* ruby lib/data_retriever.rb customer_data_test.csv
(COMMA DELIMITED)
OR
* ruby lib/data_retriever.rb customer_data_pd_test.csv
(PIPE DELIMITED)
