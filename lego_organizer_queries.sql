-- 1. Find sets that have a word or phrase in their description

SELECT *
FROM Lego_Sets
WHERE set_name LIKE '%[search_term]%';



-- 2. Sort by sets with the highest piece count
SELECT ls.set_id, ls.set_name, sp.quantity AS piece_count
FROM Lego_Sets ls
JOIN Set_Pieces sp ON ls.set_id = sp.set_id
GROUP BY ls.set_id, ls.set_name
ORDER BY piece_count DESC;

-- 3. Show only sets that belong to a specific theme
SELECT ls.set_id, ls.set_name, t.theme_name
FROM Lego_Sets ls
JOIN Themes t ON ls.theme_id = t.theme_id
WHERE t.theme_name = '[specific_theme]';



-- 4. Paginate the list, giving 4 at a time and not repeating
-- For MySQL, use LIMIT and OFFSET to handle pagination
SELECT *
FROM Lego_Sets
ORDER BY set_id
LIMIT 4 OFFSET [offset_value];


