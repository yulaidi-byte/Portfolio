# import relevant library and move csv to dataframe

import pandas as pd

classic_punk_rock = pd.read_csv("ClassicPunkRock.csv")
preview = classic_punk_rock.head() 
print(preview)