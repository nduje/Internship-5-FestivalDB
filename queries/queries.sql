SELECT *
FROM Workshops
JOIN Festivals
	ON Workshops.FestivalId = Festivals.FestivalId
WHERE Difficulty = 'Advanced'
	AND Festivals.StartDate >= '2025-01-01'
	AND Festivals.EndDate <= '2025-12-31';

SELECT
	Performers.Name,
	Festivals.Name,
	Stages.Location,
	Performances.StartTime,
	Performances.EndTime
FROM Performances
JOIN Performers
	ON Performances.PerformerId = Performers.PerformerId
JOIN Festivals
	ON Performances.FestivalId = Festivals.FestivalId
JOIN Stages
	ON Performances.StageId = Stages.StageId
WHERE ExpectedVisitorsCount > 10000;

SELECT *
FROM Festivals
WHERE StartDate >= '2025-01-01'
	AND EndDate <= '2025-12-31';

SELECT *
FROM Workshops
WHERE Difficulty = 'Advanced';

SELECT *
FROM Workshops
WHERE DurationHours > 4;

SELECT *
FROM Workshops
WHERE RequiresPriorKnowledge = TRUE;

SELECT *
FROM Mentors
WHERE YearsOfExperience > 10;

SELECT *
FROM Mentors
WHERE BirthYear < 1985;

SELECT *
FROM Visitors
WHERE City = 'Split';

SELECT *
FROM Visitors
WHERE EmailAddress LIKE '%@gmail.com';

SELECT *
FROM Visitors
WHERE DateOfBirth > CURRENT_DATE - INTERVAL '25 years';

SELECT *
FROM Tickets
WHERE Price > 120;

SELECT *
FROM Tickets
WHERE TicketType = 'VIP';

SELECT *
FROM Tickets
WHERE ValidityType = 'WholeFestival';

SELECT *
FROM Staff
WHERE IsSecurityTrained = TRUE;