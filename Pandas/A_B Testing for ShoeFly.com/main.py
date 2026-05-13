import pandas as pd
import pathlib

data_path = pathlib.Path('Pandas') / 'A_B Testing for ShoeFly.com' / 'ad_clicks.csv'

ad_clicks = pd.read_csv(data_path)

print(ad_clicks.head())

how_many_views = ad_clicks.groupby('utm_source').user_id.count()

ad_clicks['is_click'] = ~ ad_clicks.ad_click_timestamp.isnull()

clicks_by_source = ad_clicks.groupby(['utm_source', 'is_click']).user_id.count().reset_index()

clicks_pivot = clicks_by_source.pivot(
    columns='is_click',
    index='utm_source',
    values='user_id'
)

clicks_pivot['percent_clicked'] = (clicks_pivot[True]) / (clicks_pivot[True] + clicks_pivot[False]) * 100

how_many_views = ad_clicks.groupby(['is_click', 'experimental_group']).user_id.count().reset_index()

a_clicks = ad_clicks[ad_clicks.experimental_group == 'A']

b_clicks = ad_clicks[ad_clicks.experimental_group == 'B']

a_clicks_daily = a_clicks.groupby('day').user_id.count().reset_index()

b_clicks_daily = b_clicks.groupby('day').user_id.count().reset_index()

print(a_clicks_daily)