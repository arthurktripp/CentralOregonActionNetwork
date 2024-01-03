SELECT
	Services.serviceID,
	Services.name,
	Services.description,
	Services.donateURL,
	Services.websiteURL,
	Services.getServicesURL,
	ServicesCities.cityID,
	Cities.cityName
FROM Services
JOIN ServicesCities on ServicesCities.serviceID = Services.serviceID
JOIN Cities on Cities.cityID = ServicesCities.cityID;

SELECT
    Cities.cityName
FROM Cities
JOIN ServicesCities ON Cities.cityID = ServicesCities.cityID
JOIN Services ON Services.serviceID = ServicesCities.serviceID
WHERE Services.serviceID = 1;
