use guvi_project;
select * from agritables;
DESC agritables;
ALTER TABLE agritables
CHANGE COLUMN `Dist Code` `Dist_Code` BIGINT,
CHANGE COLUMN `Year` `Year` BIGINT,
CHANGE COLUMN `State Code` `State_Code` BIGINT,
CHANGE COLUMN `State Name` `State_Name` TEXT,
CHANGE COLUMN `Dist Name` `Dist_Name` TEXT,
CHANGE COLUMN `RICE AREA (1000 ha)` `Rice_Area_1000ha` BIGINT,
CHANGE COLUMN `RICE PRODUCTION (1000 tons)` `Rice_Production_1000tons` BIGINT,
CHANGE COLUMN `RICE YIELD (Kg per ha)` `Rice_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `WHEAT AREA (1000 ha)` `Wheat_Area_1000ha` BIGINT,
CHANGE COLUMN `WHEAT PRODUCTION (1000 tons)` `Wheat_Production_1000tons` BIGINT,
CHANGE COLUMN `WHEAT YIELD (Kg per ha)` `Wheat_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `KHARIF SORGHUM AREA (1000 ha)` `Kharif_Sorghum_Area_1000ha` BIGINT,
CHANGE COLUMN `KHARIF SORGHUM PRODUCTION (1000 tons)` `Kharif_Sorghum_Production_1000tons` BIGINT,
CHANGE COLUMN `KHARIF SORGHUM YIELD (Kg per ha)` `Kharif_Sorghum_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `SORGHUM AREA (1000 ha)` `Sorghum_Area_1000ha` BIGINT,
CHANGE COLUMN `SORGHUM PRODUCTION (1000 tons)` `Sorghum_Production_1000tons` BIGINT,
CHANGE COLUMN `SORGHUM YIELD (Kg per ha)` `Sorghum_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `PEARL MILLET AREA (1000 ha)` `Pearl_Millet_Area_1000ha` BIGINT,
CHANGE COLUMN `PEARL MILLET PRODUCTION (1000 tons)` `Pearl_Millet_Production_1000tons` BIGINT,
CHANGE COLUMN `PEARL MILLET YIELD (Kg per ha)` `Pearl_Millet_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `MAIZE AREA (1000 ha)` `Maize_Area_1000ha` BIGINT,
CHANGE COLUMN `MAIZE PRODUCTION (1000 tons)` `Maize_Production_1000tons` BIGINT,
CHANGE COLUMN `MAIZE YIELD (Kg per ha)` `Maize_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `CHICKPEA AREA (1000 ha)` `Chickpea_Area_1000ha` BIGINT,
CHANGE COLUMN `CHICKPEA PRODUCTION (1000 tons)` `Chickpea_Production_1000tons` BIGINT,
CHANGE COLUMN `CHICKPEA YIELD (Kg per ha)` `Chickpea_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `PIGEONPEA AREA (1000 ha)` `Pigeonpea_Area_1000ha` BIGINT,
CHANGE COLUMN `PIGEONPEA PRODUCTION (1000 tons)` `Pigeonpea_Production_1000tons` BIGINT,
CHANGE COLUMN `PIGEONPEA YIELD (Kg per ha)` `Pigeonpea_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `MINOR PULSES AREA (1000 ha)` `Minor_Pulses_Area_1000ha` BIGINT,
CHANGE COLUMN `MINOR PULSES PRODUCTION (1000 tons)` `Minor_Pulses_Production_1000tons` BIGINT,
CHANGE COLUMN `MINOR PULSES YIELD (Kg per ha)` `Minor_Pulses_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `GROUNDNUT AREA (1000 ha)` `Groundnut_Area_1000ha` BIGINT,
CHANGE COLUMN `GROUNDNUT PRODUCTION (1000 tons)` `Groundnut_Production_1000tons` BIGINT,
CHANGE COLUMN `GROUNDNUT YIELD (Kg per ha)` `Groundnut_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `SESAMUM AREA (1000 ha)` `Sesamum_Area_1000ha` BIGINT,
CHANGE COLUMN `SESAMUM PRODUCTION (1000 tons)` `Sesamum_Production_1000tons` BIGINT,
CHANGE COLUMN `SESAMUM YIELD (Kg per ha)` `Sesamum_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `RAPESEED AND MUSTARD AREA (1000 ha)` `Rapeseed_Mustard_Area_1000ha` BIGINT,
CHANGE COLUMN `RAPESEED AND MUSTARD PRODUCTION (1000 tons)` `Rapeseed_Mustard_Production_1000tons` BIGINT,
CHANGE COLUMN `RAPESEED AND MUSTARD YIELD (Kg per ha)` `Rapeseed_Mustard_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `OILSEEDS AREA (1000 ha)` `Oilseeds_Area_1000ha` BIGINT,
CHANGE COLUMN `OILSEEDS PRODUCTION (1000 tons)` `Oilseeds_Production_1000tons` BIGINT,
CHANGE COLUMN `OILSEEDS YIELD (Kg per ha)` `Oilseeds_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `SUGARCANE AREA (1000 ha)` `Sugarcane_Area_1000ha` BIGINT,
CHANGE COLUMN `SUGARCANE PRODUCTION (1000 tons)` `Sugarcane_Production_1000tons` BIGINT,
CHANGE COLUMN `SUGARCANE YIELD (Kg per ha)` `Sugarcane_Yield_KgPerHa` BIGINT,
CHANGE COLUMN `COTTON AREA (1000 ha)` `Cotton_Area_1000ha` BIGINT,
CHANGE COLUMN `FRUITS AREA (1000 ha)` `Fruits_Area_1000ha` BIGINT,
CHANGE COLUMN `VEGETABLES AREA (1000 ha)` `Vegetables_Area_1000ha` BIGINT,
CHANGE COLUMN `FRUITS AND VEGETABLES AREA (1000 ha)` `Fruits_Vegetables_Area_1000ha` BIGINT,
CHANGE COLUMN `POTATOES AREA (1000 ha)` `Potatoes_Area_1000ha` BIGINT,
CHANGE COLUMN `ONION AREA (1000 ha)` `Onion_Area_1000ha` BIGINT,
CHANGE COLUMN `FODDER AREA (1000 ha)` `Fodder_Area_1000ha` BIGINT;
DESC agritables;
select sum(Sugarcane_Yield_KgPerHa) from agritables;
select * from agritables limit 5;

-- 1.Year-wise Trend of Rice Production Across States (Top 3)
WITH TopStates AS (
    SELECT State_Name
    FROM agritables
    GROUP BY State_Name
    ORDER BY SUM(Rice_Production_1000tons) DESC
    LIMIT 3
)
SELECT Year, State_Name, Rice_Production_1000tons
FROM agritables
WHERE State_Name IN (SELECT State_Name FROM TopStates)
ORDER BY Year, Rice_Production_1000tons DESC;

-- 2.Top 5 Districts by Wheat Yield Increase Over the Last 5 Years
select max(Year) from agritables;
select Dist_Name, 
       (max(Wheat_Yield_KgPerHa) - min(Wheat_Yield_KgPerHa)) as Yield_Increase
from agritables
where Year between 2013 and 2017
group by Dist_Name
order by Yield_Increase desc
limit 5;

-- 3. States with the Highest Growth in Oilseed Production (5-Year Growth Rate)
select * from agritables limit 10;
select State_Name, round(((max(Oilseeds_Production_1000tons) - min(Oilseeds_Production_1000tons)) / min(Oilseeds_Production_1000tons)) * 100,2) as Oil_Seed_Growth from agritables
where year between 2013 and 2017 group by State_Name order by Oil_Seed_Growth;

-- 4. District-wise Correlation Between Area and Production for Major Crops (Rice, Wheat, and Maize)
SELECT
    Dist_Name,
    Year,

    -- Rice Correlation
    (
        (COUNT(*) * SUM(Rice_Area_1000ha * Rice_Production_1000tons) - SUM(Rice_Area_1000ha) * SUM(Rice_Production_1000tons)) /
        (SQRT(
            (COUNT(*) * SUM(POW(Rice_Area_1000ha, 2)) - POW(SUM(Rice_Area_1000ha), 2)) *
            (COUNT(*) * SUM(POW(Rice_Production_1000tons, 2)) - POW(SUM(Rice_Production_1000tons), 2))
        ))
    ) AS rice_corr,

    -- Wheat Correlation
    (
        (COUNT(*) * SUM(Wheat_Area_1000ha * Wheat_Production_1000tons) - SUM(Wheat_Area_1000ha) * SUM(Wheat_Production_1000tons)) /
        (SQRT(
            (COUNT(*) * SUM(POW(Wheat_Area_1000ha, 2)) - POW(SUM(Wheat_Area_1000ha), 2)) *
            (COUNT(*) * SUM(POW(Wheat_Production_1000tons, 2)) - POW(SUM(Wheat_Production_1000tons), 2))
        ))
    ) AS wheat_corr,

    -- Maize Correlation
    (
        (COUNT(*) * SUM(Maize_Area_1000ha * Maize_Production_1000tons) - SUM(Maize_Area_1000ha) * SUM(Maize_Production_1000tons)) /
        (SQRT(
            (COUNT(*) * SUM(POW(Maize_Area_1000ha, 2)) - POW(SUM(Maize_Area_1000ha), 2)) *
            (COUNT(*) * SUM(POW(Maize_Production_1000tons, 2)) - POW(SUM(Maize_Production_1000tons), 2))
        ))
    ) AS maize_corr

FROM
    agritables
WHERE
    Rice_Area_1000ha IS NOT NULL AND Rice_Production_1000tons IS NOT NULL AND
    Wheat_Area_1000ha IS NOT NULL AND Wheat_Production_1000tons IS NOT NULL AND
    Maize_Area_1000ha IS NOT NULL AND Maize_Production_1000tons IS NOT NULL
GROUP BY
    Dist_Name, Year
    HAVING
    COUNT(*) >= 1;



-- 5. Yearly Production Growth of Cotton in Top 5 Cotton Producing States 
-- No cotton in the dataset because it contains lot of zeros

-- 6.Districts with the Highest Groundnut Production in 2020
select Year,Groundnut_Production_1000tons from agritables order by Year desc;
-- no data on year 2020

-- 7.Annual Average Maize Yield Across All States
select * from agritables limit 5;
select State_Name,round(avg(Maize_Yield_KgPerHa),2) as Avg_Maize_Yield from agritables group by State_Name;

-- 8. Total Area Cultivated for Oilseeds in Each State
select State_Name,sum(Oilseeds_Area_1000ha) as Total_Area_Cultivated_OilSeeds from agritables group by State_Name order by Total_Area_Cultivated_OilSeeds desc;

-- 9.Districts with the Highest Rice Yield
-- select Dist_Code,max(Rice_Yield_KgPerHa) as Max_Rice_Yield from agritables group by Dist_Code order by Max_Rice_Yield desc;
select Dist_Name, Rice_Yield_KgPerHa from agritables order by Rice_Yield_KgPerHa desc limit 1;

-- 10.Compare the Production of Wheat and Rice for the Top 5 States Over 10 Years
WITH TopStates AS (
    SELECT State_Name
    FROM agritables
    WHERE Year >= YEAR(CURDATE()) - 10
    GROUP BY State_Name
    ORDER BY SUM(Wheat_Production_1000tons) + SUM(Rice_Production_1000tons) DESC
    LIMIT 5
)
SELECT a.Year, a.State_Name, 
       SUM(a.Wheat_Production_1000tons) AS Total_Wheat_Production,
       SUM(a.Rice_Production_1000tons) AS Total_Rice_Production
FROM agritables a
JOIN TopStates t ON a.State_Name = t.State_Name
WHERE a.Year >= YEAR(CURDATE()) - 10
GROUP BY a.Year, a.State_Name
ORDER BY a.Year DESC, Total_Wheat_Production DESC, Total_Rice_Production DESC;
