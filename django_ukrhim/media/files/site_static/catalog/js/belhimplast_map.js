ymaps.ready(init);


function init () {
    
    
    
    var myMap = new ymaps.Map(
        'YMapsID',
        // Параметры карты.
        {
            center: [53.956298,27.545275],
            zoom: 11,
            behaviors:['default', 'scrollZoom', 'multiTouch']

        }
    );
	
    var getState = function (point) {
                    return clusterer.getObjectState(point);
                }
    
    var openBalloon = function (point) {
                    var state = getState(point),
                        cluster = state.isClustered && state.cluster;

                    if(cluster) {
                        cluster.state.set('activeObject', point);
                        cluster.balloon.open();
                    }
                    else {
                        point.balloon.open();
                    }
                };
                
                
    var Pan = function (point) {
    
                    myMap.panTo(point.geometry.getCoordinates(), {
                        callback: function () {
                            var state = getState(point),
                                cluster = state.cluster;

                            if(state.isShown && (point.getMap() || (cluster && cluster.getMap()))) {
                                openBalloon(point);
                            }
                            else {
                                clusterer.events.once('objectsaddtomap', function () {
                                    openBalloon(point);
                                });
                                /*
                                clusterer.events.add('objectsaddtomap', function onObjectsAddToMap() {
                                    clusterer.events.remove('objectsaddtomap', onObjectsAddToMap);
                                    openBalloon(point);
                                });
                                */
                            }
                        }
                    });
                }
    
	myMap.controls.add('zoomControl', { right: 5, top: 5 })
    var clusterer = new ymaps.Clusterer({preset: 'twirl#invertedLightblueClusterIcons'}) // 'twirl#lightblueClusterIcons'
	
    // Добавляем кластеризатор на карту.
    myMap.geoObjects.add(clusterer);
    
       var warehouse={
            iconImageHref: '/media/files/site_static/catalog/img/point_ware.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
        }
    
    var shop={
            iconImageHref: '/media/files/site_static/catalog/img/point_shop.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
            zIndex: 690,
        }
        
    var ishop={
            iconImageHref: '/media/files/site_static/catalog/img/point_ishop.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
        }
		
	var office={
            iconImageHref: '/media/files/site_static/catalog/img/point_office.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
        }	
	var epicenter={
            iconImageHref: '/media/files/site_static/catalog/img/point_epic.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
        }	
        
        
    var placemarks = [];
    
    
    
    
    
    
    
    
    
    

//	office, ishop, shop, warehouse

    var myPlacemark = new ymaps.Placemark([53.937854,27.542508],  {   
			balloonContentHeader: 'Минский офис ООО "БелХимПласт"',
            balloonContentBody: 'г.Минск, ул.Долгиновский  тракт 39, тел.: +375 (017) 395-72-06, +375 (44) 788-10-25',
            hintContent: 'Минский офис ООО "БелХимПласт, г.Минск, ул.Долгиновский  тракт 39, тел.: +375 (017) 395-72-06, +375 (44) 788-10-25',
        }, office);
    placemarks.push(['#minsk_belhim_office',myPlacemark]);
    
    var myPlacemark = new ymaps.Placemark([53.996152,27.575809],  {   
			balloonContentHeader: 'Минский склад ООО "БелХимПласт"',
            balloonContentBody: 'Минская обл, Минский р-н, Н9037, 3-й км, 15/2, Производственно-складское здание №2 ЧУП «Ремэкострой», тел.: +375 (44) 779 77 31',
            hintContent: 'Минская обл, Минский р-н, Н9037, 3-й км, 15/2, Производственно-складское здание №2 ЧУП «Ремэкострой», тел.: +375 (44) 779 77 31',
        }, warehouse);
    placemarks.push(['#minsk_belhim_warehouse',myPlacemark]);
    
	
	
  
    clusterer.add(placemarks.map(function (item){return item[1]}));
	
    $('#ancor').click(
				function (e) {
					e.preventDefault();
					$.scrollTo('#shops_and',{duration:300});
                    myMap.setZoom(12 , { callback: function() {Pan(myPlacemark3);} } )
                    }
                    )
    
    
    
	
	placemarks.forEach(function (item) {  $(item[0]).click(
				function (e) {
					e.preventDefault();
					$.scrollTo('#shops_and',{duration:300});
                    //myMap.setZoom(12 , { callback: function() { Pan(item[1]) } } )
                    myMap.setZoom(12)
                    Pan(item[1])
                    }
                    )
                    }
                    )

    var myPolyline = new ymaps.Polyline([
            [53.978755, 27.577319],
            [53.991655, 27.581782],
            [53.992413, 27.577834],
            [53.993425, 27.576632],
            [53.994740, 27.576203],
            [53.996105, 27.576117]
        ], {
            balloonContent: "Дорога к складу. Поворот на Забалоцце"
        }, {
            strokeColor: "#000000",
            strokeWidth: 4,
            strokeOpacity: 0.5
        });

    // Добавляем линии на карту.
    myMap.geoObjects.add(myPolyline);
}

