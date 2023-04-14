-- Функция, которая по имени и фамилии человека возвращает его родителей

DROP FUNCTION IF EXISTS find_parents;

CREATE FUNCTION find_parents (name_param VARCHAR(255), surname_param VARCHAR(255))
    RETURNS TABLE (parent_name VARCHAR(255), parent_surname VARCHAR(255)) AS $$
BEGIN
    RETURN QUERY SELECT parent.name, parent.surname FROM person parent
        INNER JOIN parents ON (parent.id = parents.parent1_id OR parent.id = parents.parent2_id)
        INNER JOIN person child ON child.id = parents.child_id
        WHERE child.name = name_param
            AND child.surname = surname_param;
END;
$$ LANGUAGE plpgsql;

SELECT find_parents('Дэвид', 'Смирнов');