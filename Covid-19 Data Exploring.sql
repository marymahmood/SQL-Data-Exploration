--SELECT * FROM ResumeProjectsDB..CovidDeaths
--WHERE continent is NOT NULL
--order by 3,4

--Select Data we are going to be using
SELECT location,date,total_cases,new_cases,total_deaths,population
FROM ResumeProjectsDB..CovidDeaths

--Looking at Total Cases vs Total Deaths
--Likelihood of dying if you contract covid in your country
SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
FROM ResumeProjectsDB..CovidDeaths
where location like '%india'
order by 1,2

-- Total Cases vs Population
SELECT location,date,population,total_cases,(total_cases/population)*100 as InfectedPopulation
FROM ResumeProjectsDB..CovidDeaths
--where location like '%india'
order by 1,2

--Looking at Countries with Highest Infection Rate compared to Population
SELECT location,date,population,MAX(total_cases) as HighestInfectionCount,MAX((total_cases/population))*100 as HighestInfectedPopulation
FROM ResumeProjectsDB..CovidDeaths
--where location like '%india'
Group by location,population,date
order by HighestInfectedPopulation desc

--Countries with the highest Death count per Population
SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM ResumeProjectsDB..CovidDeaths
--where location like '%india'
WHERE continent is NOT NULL
Group by location,population
order by TotalDeathCount desc

--by Continent
SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM ResumeProjectsDB..CovidDeaths
--where location like '%india'
WHERE continent is NOT NULL
Group by continent
order by TotalDeathCount desc

--showing continents with highest death rate per population
SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM ResumeProjectsDB..CovidDeaths
--where location like '%india'
WHERE continent is NOT NULL
Group by continent
order by TotalDeathCount desc

-- Global Numbers
SELECT sum(new_cases) as total_cases,sum(cast(new_deaths as int)) as total_deaths,sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage--(total_deaths/total_cases)*100 as DeathPercentage
FROM ResumeProjectsDB..CovidDeaths
--where location like '%india'
where continent is not null
--group by date
order by 1,2




