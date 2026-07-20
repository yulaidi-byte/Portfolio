# import libraries for plotting
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# tag each dataframe
pre_kc_punk['Year'] = 'Pre-1994'
post_kc_punk['Year'] = 'Post-1994'

# combine
combined = pd.concat([pre_kc_punk, post_kc_punk])

# box plot
plt.figure(figsize=(8, 6))
sns.boxplot(data=combined, x='Year', y='Popularity')
plt.title('Punk Rock Popularity: Pre-1994 vs Post-1994')
plt.xlabel('Periods')
plt.ylabel('Popularity Score')
plt.show()


# plot showcases that punk is more popular post 1994 - this is spotify data so suggests that today post 1994 punk is more popular. 