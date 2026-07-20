# creating df to analyze punk pre and post covid

tempo_n_loudness = classic_punk_rock[['Artist', 'Year','Duration','Loudness','Tempo','Popularity']].copy()

pre_covid_punk = tempo_n_loudness[classic_punk_rock['Year'] < 2020]
post_covid_punk = tempo_n_loudness[classic_punk_rock['Year'] >= 2020]

pre_covid_stats = pre_covid_punk.describe()
post_covid_stats = post_covid_punk.describe()
print("Pre-COVID Punk Statistics:")
print(pre_covid_stats)
print("\nPost-COVID Punk Statistics:")
print(post_covid_stats)

#since there's only 5 rows post covid, it isn't enough for an analysis. pivoting based on the 1994 count