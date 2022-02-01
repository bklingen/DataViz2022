# Read in file from github:
library(readr)
mypath = 'https://raw.githubusercontent.com/bklingen/DataViz2022/main/Data/NCAlumnIndustriesFilled.csv'
NCdata = read_csv(mypath)
NCdata

library(dplyr)
library(forcats)

NCdata1 = NCdata %>% 
  mutate(Industry1 = fct_collapse(Industry,
    'Arts and Media' = c('Art','Arts','Antiques','Arts & Entertainment','Online Media','Performing Arts','Communications',
                         'Entertainment','Film','Journalism','Media','Music','Photography','Publishing'),
    
    'Health and Medicine' = c('Dentistry','Health & Fitness','Healthcare','Healthcare Services','Medical','Medical Equipment',
                              'Medical Research','Medicine','Pharmaceutical','Psychotherapy','Public Health'),
    
    'Government and Social Services' = c('Attorney','City/County/State','Community Services','Defense & Space','Development',
                                         'Economic Development','Environmental Law','Government','International Relations',
                                         'Law','Military','Non Profit','Nonprofit','Philanthropy','Public Relations','Religion'),
    
    'Education' = c('Education','Education / Training','Educational Services','Higher education','Library','Museums and Institutions'),
    
    'STEM' = c('Agriculture','Archaeology','Architecture','Computer Software','Construction','Data Science','Electronics',
               'Engineering','Environmental','Environmental Science','Environmental Services','Farming','Imaging',
               'Information Technology','IT Communications','Manufacturing','Marine','Research','Software','Software Design',
               'Technology','Textiles'),
    
    'Business, Finance, and Retail' = c('Accounting','Advertising','Banking','Business','Business Consulting','Consulting',
                                        'Financial Services','Food','Food and Lodging','Food Franchise','Food Service',
                                        'Health Care Consulting','Home Improvement','Hospitality','Human Resources','Insurance',
                                        'International Economic Development Consulting','Investment banking','Investments',
                                        'Marketing','Non-profit consulting','Pet Food','Real Estate','Restaurant','Retail',
                                        'Services','Shipping','Sports Management','Transportation')
                    )
  
  ) %>%
  mutate(Industry1 = fct_explicit_na(Industry1),  
         Industry2 = fct_other(Industry1, 
                               keep = c('Arts and Media',
                                        'Business, Finance, and Retail',
                                        'STEM',
                                        'Education',
                                        'Health and Medicine',
                                        'Government and Social Services'
                               )
         )
  )

