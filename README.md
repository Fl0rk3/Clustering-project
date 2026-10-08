# Football League Clustering Analysis

### Identifying Structural and Economic Patterns Across Global Football Leagues

**Technologies:** R · dplyr · ggplot2 · cluster · factoextra · fpc  
**Methods:** Unsupervised Learning · K-Means · PAM · Hierarchical Clustering · Cluster Validation

[**View Full Analysis on RPubs →**](https://rpubs.com/Fluorek/1389847)

---

## Project Overview

This project explores structural and economic differences between **187 football leagues worldwide** using unsupervised machine learning techniques.

The objective is to identify groups of leagues with similar characteristics based on financial strength, player composition, squad size, and scoring intensity.

Four clustering approaches are applied and compared to evaluate the consistency of the identified patterns and determine which method provides the most meaningful segmentation.

## Dataset

The dataset consists of **187 football leagues worldwide**, including first- and second-tier competitions.

**Data source:** Transfermarkt  
**Data collection:** December 2025

Four numerical features were selected for clustering:

- **Goals per Match:** Average number of goals scored per match, representing scoring intensity.
- **Foreign Player Share:** Proportion of international players within a league.
- **Players per Club:** Average registered squad size.
- **Value per Club:** Average market value of players per club, representing economic strength.

The variables were standardized prior to clustering to ensure comparability across different measurement scales.

## Methodology

**1. Data Preparation & Clusterability Assessment**

- Selected and standardized four numerical features using Z-score normalization.
- Examined descriptive statistics and differences in feature distributions.
- Evaluated clustering tendency using the Hopkins statistic.

**2. K-Means Clustering**

- Identified candidate cluster counts using the Elbow Method and Silhouette Analysis.
- Compared three- and four-cluster solutions.
- Selected **4 clusters** based on internal validation metrics.

**3. Partitioning Around Medoids (PAM)**

- Applied medoid-based clustering to investigate alternative league groupings.
- Compared five- and eight-cluster solutions.
- Selected **5 clusters** based on the Calinski–Harabasz Index and cluster interpretability.

**4. Hierarchical Clustering**

- Applied agglomerative clustering using Ward linkage.
- Implemented divisive hierarchical clustering using DIANA.
- Examined dendrograms and compared four- and five-cluster solutions.

**5. Model Evaluation**

- Compared clustering quality using average Silhouette Width and the Calinski–Harabasz Index.
- Visualized cluster assignments across all four approaches.
- Interpreted economic and structural differences between the resulting league groups.

## Key Findings

- The **Hopkins statistic of 0.9888** indicated a strong tendency toward cluster formation.
- **K-Means with 4 clusters** achieved the highest average Silhouette Width (0.29), making it the preferred clustering approach.
- PAM achieved the highest Calinski–Harabasz Index (68.74), although K-Means provided slightly better cluster separation.
- The five major European leagues — Premier League, La Liga, Serie A, Bundesliga, and Ligue 1 — consistently formed a distinct group in K-Means, PAM, and agglomerative hierarchical clustering.
- Divisive hierarchical clustering isolated the **Premier League** into its own cluster, reflecting its exceptional economic characteristics.
- The analysis identified substantial structural differences between financially dominant leagues and smaller competitions with more domestically concentrated player populations.

### Clustering Performance Comparison

| Algorithm | Clusters | Silhouette Score | Calinski–Harabasz Index |
|---|---:|---:|---:|
| **K-Means** | **4** | **0.29** | **68.00** |
| PAM | 5 | 0.26 | 68.74 |
| Agglomerative Hierarchical | 5 | 0.27 | 61.45 |
| Divisive Hierarchical | 5 | 0.27 | 40.38 |

Although cluster separation was moderate, the identified patterns were broadly consistent across methods, suggesting meaningful structural differences between football leagues.

## Tools & Libraries

| Technology | Purpose |
|---|---|
| R | Statistical analysis and unsupervised learning |
| dplyr / tidyverse | Data transformation and manipulation |
| cluster | PAM and hierarchical clustering |
| factoextra | Cluster visualization and evaluation |
| fpc | Clustering validation metrics |
| ggplot2 | Data visualization |
| dendextend | Hierarchical clustering visualization |

## Full Report

The complete analysis, including clustering diagnostics, dendrograms, model comparisons, and detailed interpretations, is available on RPubs.

**[Read the Full Project Report →](https://rpubs.com/Fluorek/1389847)**

---

*This project demonstrates the application of unsupervised machine learning to real-world sports data, focusing on clustering algorithms, model validation, comparative analysis, and the interpretation of economic and structural patterns.*
