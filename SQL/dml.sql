SELECT
	Services.serviceID,
	Services.name AS serviceName,
	Services.description AS serviceDescription,
	Services.donateURL AS donateURL,
	Services.websiteURL AS websiteURL,
	Services.getServicesURL AS getServicesURL,
	ServicesCities.cityID,
	GROUP_CONCAT(Cities.cityName) as Cities
FROM Services
LEFT JOIN ServicesCities on ServicesCities.serviceID = Services.serviceID
LEFT JOIN Cities on Cities.cityID = ServicesCities.cityID
GROUP BY Services.serviceID;


SELECT
    Cities.cityName
FROM Cities
JOIN ServicesCities ON Cities.cityID = ServicesCities.cityID
JOIN Services ON Services.serviceID = ServicesCities.serviceID
WHERE Services.serviceID = 1;

SELECT
	Categories.categoryName
FROM Categories
JOIN ServicesCategories ON ServicesCategories.categoryID = Categories.categoryID 
JOIN Services ON Services.serviceID = ServicesCategories.serviceID
WHERE Services.serviceID = 1;
