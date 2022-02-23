/*
    INPUT: A word to search for in route_ratings.comment

    OUTPUT: User id, name and comment.
*/

CREATE FUNCTION [dbo].[find_word]
(
    @word as VARCHAR

)
Returns @Route_Ratings_search TABLE
(
    [user_id] INT,
    [name] VARCHAR,
    [description] as VARCHAR
)
AS
    BEGIN
        INSERT INTO @Route_Ratings_search
        SELECT [comment]
        FROM [Route_Rating]
        INNER JOIN [dbo].[User]
        ON [Route_Rating].[user_id] = [User].[user_id]
        WHERE [comment] LIKE '*' + @word + '*';


        RETURN;
    END
GO