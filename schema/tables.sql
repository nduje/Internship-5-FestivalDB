CREATE TABLE Festivals (
	FestivalId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	CityId INT REFERENCES Cities(CityId) NOT NULL,
	Capacity BIGINT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	Status ENUM
)

CREATE TABLE Cities (
	CityId SERIAL PRIMARY KEY,
)

CREATE TABLE Stages (

)

CREATE TABLE Performers (

)

CREATE TABLE Performances (

)

CREATE TABLE Visitors (

)

CREATE TABLE Tickets (

)