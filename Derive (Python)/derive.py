#Name: David (Reeves) Trott

#Date: February 20,2018
#Class: CS 312
#Assignment 4

#Description of Code: This code reads in a grammar file and generates all 
#terminal strings up to a specified length from the command line. In the file, 
#the grammar rules appear one rule per line, with each symbol
#separated from the next symbol by white space.


##############################################################################

### Comments with three Hashtags are lines from the algorithm in the specs ###

##############################################################################

import sys
import string


worklist = [] 
my_dict = {} 
grammar_file = sys.argv[1]    
str_len = 3 

###read length N from the command line argument###

if len(sys.argv) == 3:
    grammar_file = sys.argv[2] 
    str_len = int(sys.argv[1][2:])

###read the grammar file and store all productions###   
    
index = 0
for line in open(grammar_file, 'r'):
    
  if index == 0:
    productions = line.strip().split()
    #print(productions)
    metasymbol = (' ') + productions[1] + (' ')
    #print(metasymbol)
        
###push the start symbol onto the worklist###
        
    worklist.append(productions[0])    
            
  key, value = line.strip().split(metasymbol)
  if key in my_dict:
    my_dict[key].append(value)
    #print(my_dict)          
  else:
    my_dict[key] = [value]
        #print(my_dict)

  index += 1   
    
    
###while the worklist is not empty:###
###get and delete one potential sentence s from the worklist###
###if | s | > N, continue###
    
while len(worklist) > 0:
    sentence_list = []
    sentence_list = worklist.pop(0).split()
    if len(sentence_list) > str_len:
        continue
    
    
    

###choose the leftmost nonterminal NT###      
###for all productions NT -> rhs:###
###replace NT in s with rhs and store in tmp###
###push tmp onto the worklist###        
    index = 0
    output_str = ('')
    while len(sentence_list) > index:        
        
        
        if sentence_list[index] in my_dict:                      
            for i in my_dict[sentence_list[index]]:
                tmp = output_str + i + (' ')                  
                for i in range(index + 1, len(sentence_list)):
                    tmp += sentence_list[i] + (' ')                    
                worklist.append(tmp)
                #print(worklist)               
            break
                

###if s has no nonterminals, print s and continue###                
        elif sentence_list[index] not in my_dict:
            output_str += sentence_list[index] + (' ')
            index += 1           
           
            if index == len(sentence_list):
                print(output_str)

#print('*********************************************************')
#print('dictionary: ' + str(my_dict))
#print('*********************************************************')
#print('productions: ' + str(productions))
#print('*********************************************************')
#print('metasymbol: ' + str(metasymbol))
#print('*********************************************************')
#print('sentence list: ' + str(sentence_list))
#print('*********************************************************')