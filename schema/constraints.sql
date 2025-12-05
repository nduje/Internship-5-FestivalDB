ALTER TABLE Festivals
ADD CONSTRAINT CheckFestivalDates CHECK (EndDate >= StartDate),
ADD CONSTRAINT CheckFestivalCapacity CHECK (FestivalCapacity > 0);

ALTER TABLE Stages
ADD CONSTRAINT CheckStageCapacity CHECK (StageCapacity > 0);

ALTER TABLE Performers
ADD CONSTRAINT CheckPerformerMembers CHECK (MembersCount > 0);

ALTER TABLE Performances
ADD CONSTRAINT CheckPerformanceTimes CHECK (EndTime >= StartTime),
ADD CONSTRAINT CheckExpectedVisitorsCount CHECK (ExpectedVisitorsCount >= 0);

ALTER TABLE Visitors
ADD CONSTRAINT CheckVisitorEmail CHECK (EmailAddress LIKE '%_@_%._%');

ALTER TABLE Tickets
ADD CONSTRAINT CheckTicketPrice CHECK (Price >= 0);

ALTER TABLE Purchases
ADD CONSTRAINT CheckQuantity CHECK (Quantity > 0);

ALTER TABLE Workshops
ADD CONSTRAINT CheckMaximumCapacity CHECK (MaximumCapacity > 0),
ADD CONSTRAINT CheckDurationHours CHECK (DurationHours > 0);

ALTER TABLE Mentors
ADD CONSTRAINT CheckMentorAge CHECK (EXTRACT(YEAR FROM CURRENT_DATE) - BirthYear >= 18),
ADD CONSTRAINT CheckMentorExperience CHECK (YearsOfExperience >= 2);

ALTER TABLE Staff
ADD CONSTRAINT CheckStaffAge CHECK (DateOfBirth <= CURRENT_DATE - INTERVAL '18 years'),
ADD CONSTRAINT CheckSecurityGuardAge CHECK (Role <> 'SecurityGuard' OR DateOfBirth <= CURRENT_DATE - INTERVAL '21 years');