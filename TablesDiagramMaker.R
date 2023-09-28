
library(readr)
library(dplyr)
library(ggplot2)

# Reading csv in
df <- read_csv("csv/CB_Plants_Amount.csv")

# Splitting into Time Periods
EBA <- filter(df, Time_Period %in% c("EBA", "EBA (3000 BC)", "Phase 1 (EBA)", "EBA-MBA"))
MBA <- filter(df, Time_Period %in% c("MBA", "MBA (1600 BC)", "Phase 11 (MBA)", "eMBA","MBA B", "MBA A"))
LBA <- filter(df, Time_Period %in% c("LBA", "LBA (3000 BC)", "LBA – IA", "LBA–EIA"))

# Making new csv files
write_csv(EBA, "csv/CB_Plants_Amount_EBA.csv")
write_csv(MBA, "csv/CB_Plants_Amount_MBA.csv")
write_csv(LBA, "csv/CB_Plants_Amount_LBA.csv")


# The same for frequencies
df <- read_csv("csv/CB_Plants_Frequencies.csv")

EBA <- filter(df, Time_Period %in% c("EBA", "EBA (3000 BC)", "Phase 1 (EBA)", "EBA-MBA"))
MBA <- filter(df, Time_Period %in% c("MBA", "MBA (1600 BC)", "Phase 11 (MBA)", "eMBA","MBA B", "MBA A"))
LBA <- filter(df, Time_Period %in% c("LBA", "LBA (3000 BC)", "LBA – IA", "LBA–EIA"))

write_csv(EBA, "csv/CB_Plants_Frequencies_EBA.csv")
write_csv(MBA, "csv/CB_Plants_Frequencies_MBA.csv")
write_csv(LBA, "csv/CB_Plants_Frequencies_LBA.csv")


# Animals

df <- read_csv("csv/CB_Animals.csv")

EBA <- filter(df, Time_Period %in% c("EBA"))
MBA <- filter(df, Time_Period %in% c("MBA",  "eMBA"))
LBA <- filter(df, Time_Period %in% c("LBA"))

write_csv(EBA, "csv/CB_Animals_EBA.csv")
write_csv(MBA, "csv/CB_Animals_MBA.csv")
write_csv(LBA, "csv/CB_Animals_LBA.csv")


###############################################################

# North-Europe



df <- read_csv("csv/NE_Plants_Amount.csv")
EBA <- filter(df, Time_Period %in% c("EBA", "EBA (3000 BC)", "Phase 1 (EBA)", "EBA-MBA"))
MBA <- filter(df, Time_Period %in% c("MBA", "MBA (1600 BC)", "Phase 11 (MBA)", "eMBA","MBA B", "MBA A"))
LBA <- filter(df, Time_Period %in% c("LBA", "LBA (3000 BC)", "LBA – IA", "LBA–EIA"))

write_csv(EBA, "csv2/NE_Plants_Amount_EBA.csv")
write_csv(MBA, "csv2/NE_Plants_Amount_MBA.csv")
write_csv(LBA, "csv2/NE_Plants_Amount_LBA.csv")

# Same for Frequencies

df <- read_csv("csv/NE_Plants_Frequencies.csv")

EBA <- filter(df, Time_Period %in% c("EBA", "EBA (3000 BC)", "Phase 1 (EBA)", "EBA-MBA"))
MBA <- filter(df, Time_Period %in% c("MBA", "MBA (1600 BC)", "Phase 11 (MBA)", "eMBA","MBA B", "MBA A"))
LBA <- filter(df, Time_Period %in% c("LBA", "LBA (3000 BC)", "LBA – IA", "LBA–EIA"))

write_csv(EBA, "csv/NE_Plants_Frequencies_EBA.csv")
write_csv(MBA, "csv/NE_Plants_Frequencies_MBA.csv")
write_csv(LBA, "csv/NE_Plants_Frequencies_LBA.csv")

# Animals
df <- read_csv("csv/NE_Animals.csv")

EBA <- filter(df, Time_Period %in% c("EBA", "LN"))
MBA <- filter(df, Time_Period %in% c("MBA","MBA (1600 BC)", "Phase 11 (MBA)", "eMBA","MBA B", "MBA A"))
LBA <- filter(df, Time_Period %in% c("LBA", "MBA-LBA"))
BA <- filter(df, Time_Period %in% c("BA"))

write_csv(EBA, "csv2/NE_Animals_EBA.csv")
write_csv(MBA, "csv2/NE_Animals_MBA.csv")
write_csv(LBA, "csv2/NE_Animals_LBA.csv")
write_csv(BA, "csv/NE_Animals_BA.csv")


################################################################
# Diagram-Maker Animals
################################################################
# Carpathian Animals
################################################################


carp_EBA <- read_csv("csv/CB_Animals_EBA.csv")
carp_MBA <- read_csv("csv/CB_Animals_MBA.csv")
carp_LBA <- read_csv("csv/CB_Animals_LBA.csv")

ggplot(carp_EBA, aes(x = Site, y = Combined, fill = Species)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = scales::percent_format(scale = 1), limits = c(0, 100))+
  labs(y = "Percentage", title = "Carpathian Basin - EBA") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.title = element_text(hjust = 0.5)) 



ggplot(carp_MBA, aes(x = Site, y = Combined, fill = Species)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = scales::percent_format(scale = 1), limits = c(0, 100))+
  labs(y = "Percentage", title = "Carpathian Basin - MBA") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.title = element_text(hjust = 0.5)) 


ggplot(carp_LBA, aes(x = Site, y = Combined, fill = Species)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = scales::percent_format(scale = 1), limits = c(0, 100))+
  labs(y = "Percentage", title = "Carpathian Basin - LBA") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.title = element_text(hjust = 0.5)) 

##################################################################
# North-European Animals
################################################################

carpPlants_BA <- read_csv("csv/NE_Animals_BA.csv")
carpPlants_EBA <- read_csv("csv/NE_Animals_EBA.csv")
carpPlants_MBA <- read_csv("csv/NE_Animals_MBA.csv")
carpPlants_LBA <- read_csv("csv/NE_Animals_LBA.csv")

# Removals of double entries and empty sites
carpPlants_EBA <- filter(carpPlants_EBA, Species_Sum != "livestock")
carpPlants_MBA <- filter(carpPlants_MBA, Site != "Andijk")
carpPlants_LBA <- filter(carpPlants_LBA, Site %in% c("Bovenkarspel", "Niederlande"))
carpPlants_BA <- filter(carpPlants_BA, Site %in% c("Kratzeburg", "Wüste Kunersdorf", "Zitz"))


ggplot(carpPlants_EBA, aes(x = Site, y = Percentage, fill = Species_Sum)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = scales::percent_format(scale = 1), limits = c(0, 100))+
  labs(x = "Species", title = "North-European Plain - EBA") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.title = element_text(hjust = 0.5)) 

ggplot(carpPlants_MBA, aes(x = Site, y = Percentage, fill = Species_Sum)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = scales::percent_format(scale = 1), limits = c(0, 100))+
  labs(x = "Species", title = "North-European Plain - MBA") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.title = element_text(hjust = 0.5)) 

ggplot(carpPlants_LBA, aes(x = Site, y = Percentage, fill = Species_Sum)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = scales::percent_format(scale = 1), limits = c(0, 100))+
  labs(x = "Species", title = "North-European Plain - LBA") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.title = element_text(hjust = 0.5)) 

ggplot(carpPlants_BA, aes(x = Site, y = Percentage, fill = Species_Sum)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = scales::percent_format(scale = 1), limits = c(0, 100))+
  labs(x = "Species", title = "North-European Plain - BA") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.title = element_text(hjust = 0.5)) 
