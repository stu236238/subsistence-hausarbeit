

#############
#### Semi-Quantitative Method : Abundances
#############

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

# Replace '.csv' with the actual path to your CSV file
# This code was generated with the help of ChatGPT.


file_path = 'csv/NE_Animals_EBA.csv'


# Read the CSV file into a DataFrame
df = pd.read_csv(file_path)

# Assign numbers to classes
quantity_mapping = {"0": 0, "x": 1, "xx": 2, "xxx": 3, "xxxx": 4}
df["Quantity"] = df["Semi_Quantitative"].map(quantity_mapping)


# Pivot the DataFrame to create a matrix for visualization
df = df.groupby(['Site', 'Species_Sum']).agg({'Quantity': 'sum'}).reset_index()
# Aggregates values in each site on species basis

pivot_df = df.pivot(index="Site", columns="Species_Sum", values="Quantity").fillna(0)


distinct_values = np.array([0,1,2,3,4])

# Create a custom color map with the same number of colors as distinct values
cmap = sns.color_palette("YlGnBu", n_colors=len(distinct_values))

plt.figure(figsize=(10,18))
heatmap = sns.heatmap(
    pivot_df, annot=False, cmap=cmap, linewidths=0.5, cbar=True,
    vmin=distinct_values.min(), vmax=distinct_values.max(),
)

# Adjust the x and y tick label font size
heatmap.set_xticklabels(heatmap.get_xticklabels(), fontsize=5)
heatmap.set_yticklabels(heatmap.get_yticklabels(), fontsize=5)

# Set the color bar ticks to the distinct values
colorbar = heatmap.collections[0].colorbar
colorbar.set_ticks(distinct_values)

plt.title("Species Distribution Across Sites - LBA")
plt.xlabel("Species")
plt.ylabel("Site")
plt.show()



