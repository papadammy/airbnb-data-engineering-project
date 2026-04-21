import pandas as pd

file_path_listings = "data/raw/listings.csv"
file_path_rates = "data/raw/past_rates.csv"

listings = pd.read_csv(file_path_listings, on_bad_lines='skip')
rates = pd.read_csv(file_path_rates, on_bad_lines='skip')

print(listings.shape)
print(rates.shape)

print(listings.columns)
print(rates.columns)

# Fix data types
listings["listing_id"] = listings["listing_id"].astype(str)
rates["listing_id"] = rates["listing_id"].astype(str)

# Optional: sample to avoid huge merge
rates_sample = rates.sample(10000, random_state=42)

# Merge
df = listings.merge(
    rates_sample,
    on="listing_id",
    how="inner"
)

# Drop duplicate location columns from rates
df = df.drop(columns=["city_y", "state_y", "country_y"])

# Rename listing columns back to clean names
df = df.rename(columns={
    "city_x": "city",
    "state_x": "state",
    "country_x": "country"
})


print(df.shape)
print(df.head())

print(df[["listing_id", "city", "date", "revenue"]].head())