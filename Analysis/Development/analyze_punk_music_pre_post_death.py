# 1994 has the highest count so analyzing popularing pre and post 1994
pre_1994_punk = tempo_n_loudness[classic_punk_rock['Year'] < 1994]
post_1994_punk = tempo_n_loudness[classic_punk_rock['Year'] >= 1994]

pre_1994_stats = pre_1994_punk.describe()
post_1994_stats = post_1994_punk.describe()
print("Pre-1994 Punk Statistics:")
print(pre_1994_stats)
print(pre_1994_punk.head())
print("\nPost-1994 Punk Statistics:")
print(post_1994_stats)
print(post_1994_punk.head())
