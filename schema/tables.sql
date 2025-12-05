CREATE TABLE Festivals (
	FestivalId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	City VARCHAR(30) NOT NULL,
	FestivalCapacity BIGINT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	Status FestivalStatus DEFAULT 'Planned'
);

CREATE TABLE Stages (
	StageId SERIAL PRIMARY KEY,
	FestivalId INT REFERENCES Festivals(FestivalId),
	Location StageLocation,
	StageCapacity BIGINT NOT NULL,
	IsCovered BOOLEAN DEFAULT FALSE
);

CREATE TABLE Performers (
	PerformerId SERIAL PRIMARY KEY,
	Name VARCHAR(60) NOT NULL,
	Country VARCHAR(30) NOT NULL,
	Genre MusicGenre,
	MembersCount SMALLINT NOT NULL,
	IsActive BOOLEAN DEFAULT FALSE
)

CREATE TABLE Performances (
	PerformanceId SERIAL PRIMARY KEY,
	FestivalId INT REFERENCES Festivals(FestivalId) NOT NULL,
	StageId INT REFERENCES Stages(StageId) NOT NULL,
	PerformerId INT REFERENCES Performers(PerformerId) NOT NULL,
	StartTime TIMESTAMP NOT NULL,
	EndTime TIMESTAMP NOT NULL,
	ExpectedVisitorsCount SMALLINT NOT NULL
);

CREATE TABLE Visitors (
	VisitorId SERIAL PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	DateOfBirth DATE NOT NULL,
	City VARCHAR(30) NOT NULL,
	Country VARCHAR(30) NOT NULL,
	EmailAddress VARCHAR(60) NOT NULL
);

CREATE TABLE Tickets (
	TicketId SERIAL PRIMARY KEY,
	VisitorId INT REFERENCES Visitors(VisitorId),
	FestivalId INT REFERENCES Festivals(FestivalId),
	Type TicketType NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	Description TEXT,
	Validity ValidityType NOT NULL
);

CREATE TABLE Purchases (
	PurchaseId SERIAL PRIMARY KEY,
	VisitorId INT REFERENCES Visitors(VisitorId),
	FestivalId INT REFERENCES Festivals(FestivalId),
	TicketId INT REFERENCES Tickets(TicketId),
	Quantity SMALLINT NOT NULL
);

CREATE TABLE Workshops (
	WorkshopId SERIAL PRIMARY KEY,
	FestivalId INT REFERENCES Festivals(FestivalId),
	Name VARCHAR(30) NOT NULL,
	MaximumCapacity SMALLINT NOT NULL,
	DurationHours SMALLINT NOT NULL,
	Difficulty WorkshopDifficulty NOT NULL,
	RequiresPriorKnowledge BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE WorkshopsVisitors (
	RegistrationId SERIAL PRIMARY KEY,
	WorkshopId INT REFERENCES Workshops(WorkshopId),
	VisitorId INT REFERENCES Visitors(VisitorId),
	Status RegistrationStatus NOT NULL,
	RegistrationTime TIMESTAMP NOT NULL
);

CREATE TABLE Mentors (
	MentorId SERIAL PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	BirthYear SMALLINT NOT NULL,
	Expertise MentorExpertise NOT NULL,
	YearsOfExperience SMALLINT NOT NULL
);

CREATE TABLE WorkshopsMentors (
	WorkshopId INT REFERENCES Workshops(WorkshopId),
	MentorId INT REFERENCES Mentors(MentorId)
);

CREATE TABLE Staff (
	StaffId SERIAL PRIMARY KEY,
	FestivalId INT REFERENCES Festivals(FestivalId),
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	DateOfBirth DATE NOT NULL,
	Role StaffRole NOT NULL,
	Contact TEXT NOT NULL,
	IsSecurityTrained BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE Memberships (
	MembershipId SERIAL PRIMARY KEY,
	VisitorId INT REFERENCES Visitors(VisitorId),
	ActivationDate DATE NOT NULL,
	Status MembershipStatus NOT NULL
);