CREATE TABLE Festivals (
	FestivalId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	CityId INT REFERENCES Cities(CityId) NOT NULL,
	FestivalCapacity BIGINT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	Status FestivalStatus DEFAULT "Planned"
);

CREATE TABLE Cities (
	CityId SERIAL PRIMARY KEY,
	CountryId INT REFERENCES Countries(CountryId) NOT NULL,
	Name VARCHAR(30) NOT NULL
)

CREATE TABLE Countries (
	CountryId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL
)

CREATE TABLE Stages (
	StageId SERIAL PRIMARY KEY,
	Location StageLocation,
	StageCapacity BIGINT NOT NULL,
	IsCovered BOOLEAN DEFAULT FALSE
)

CREATE TABLE Performers (
	PerformerId SERIAL PRIMARY KEY,
	Name VARCHAR(60) NOT NULL,
	CountryId INT REFERENCES Countries(CountryId) NOT NULL,
	Genre MusicGenres,
	MembersCount SMALLINT NOT NULL,
	IsActive BOOLEAN DEFAULT FALSE
)

CREATE TABLE Performances (

)

CREATE TABLE Visitors (

)

CREATE TABLE Tickets (

)