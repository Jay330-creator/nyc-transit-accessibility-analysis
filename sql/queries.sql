-- =========================
-- 1. STATION ACCESSIBILITY BY BOROUGH
-- =========================
SELECT 
    Borough,
    COUNT(*) AS total_stations,
    SUM(ADA) AS accessible_stations,
    ROUND(SUM(ADA) * 1.0 / COUNT(*) * 100, 2) AS accessibility_percent
FROM stations_clean
GROUP BY Borough
ORDER BY accessibility_percent DESC;


-- =========================
-- 2. ADA ASSET COMPLIANCE (ELEVATORS/ESCALATORS)
-- =========================
SELECT 
    Borough,
    COUNT(*) AS total_assets,
    SUM(ada_asset_flag) AS ada_compliant_assets,
    ROUND(SUM(ada_asset_flag) * 1.0 / COUNT(*) * 100, 2) AS ada_asset_percent
FROM elevators_clean
GROUP BY Borough
ORDER BY ada_asset_percent DESC;


-- =========================
-- 3. JOINED ANALYSIS (ACCESSIBILITY vs ADA)
-- =========================
SELECT 
    s.Borough,
    COUNT(s."Station ID") AS total_stations,
    SUM(s.ADA) AS accessible_stations,
    ROUND(SUM(s.ADA) * 1.0 / COUNT(s."Station ID") * 100, 2) AS accessibility_percent,
    
    COUNT(e."Equipment Code") AS total_assets,
    SUM(e.ada_asset_flag) AS ada_compliant_assets,
    ROUND(SUM(e.ada_asset_flag) * 1.0 / COUNT(e."Equipment Code") * 100, 2) AS ada_asset_percent

FROM stations_clean s
LEFT JOIN elevators_clean e
    ON s.Borough = e.Borough

GROUP BY s.Borough
ORDER BY accessibility_percent DESC;


-- =========================
-- 4. ACCESSIBILITY GAP ANALYSIS
-- =========================
SELECT 
    s.Borough,
    ROUND(SUM(s.ADA) * 1.0 / COUNT(s."Station ID") * 100, 2) AS accessibility_percent,
    ROUND(SUM(e.ada_asset_flag) * 1.0 / COUNT(e."Equipment Code") * 100, 2) AS ada_asset_percent,
    
    ROUND(
        (SUM(e.ada_asset_flag) * 1.0 / COUNT(e."Equipment Code") * 100) -
        (SUM(s.ADA) * 1.0 / COUNT(s."Station ID") * 100),
    2) AS accessibility_gap

FROM stations_clean s
LEFT JOIN elevators_clean e
    ON s.Borough = e.Borough

GROUP BY s.Borough
ORDER BY accessibility_gap DESC;
