Creating a MySQL table:
CREATE TABLE Tree (
    id int NOT NULL AUTO_INCREMENT,
    label varchar(255),
    parent int
);

Query to show all nodes in tree:
SELECT * FROM Tree;

Query to insert dolphin with parent id 7:
INSERT INTO Tree (label,parent)
VALUES ('dolphin',7);

