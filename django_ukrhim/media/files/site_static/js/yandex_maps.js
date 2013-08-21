ymaps.ready(init);


function init () {
    
    var geolocation = ymaps.geolocation

    var coords = [geolocation.latitude, geolocation.longitude]

    var myMap = new ymaps.Map(
        'YMapsID',
        // Параметры карты.
        {
            center: coords,
            zoom: 5,
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
    
	myMap.controls.add('zoomControl', { left: 5, top: 5 }).add('mapTools', { left: 35, top: 5 })
    var clusterer = new ymaps.Clusterer({preset: 'twirl#invertedLightblueClusterIcons'}) // 'twirl#lightblueClusterIcons'
	
    // Добавляем кластеризатор на карту.
    myMap.geoObjects.add(clusterer);
    
    var warehouse={
            iconImageHref: '/static/img/point_ware.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
        }
    
    var shop={
            iconImageHref: '/static/img/point_shop.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
        }
        
    var ishop={
            iconImageHref: '/static/img/point_ishop.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
        }
		
	var office={
            iconImageHref: '/static/img/point_office.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
        }	
        
    var placemarks = [];
    
    
    
    
    
    
    
    
    
    
    var myPlacemark = new ymaps.Placemark([50.52,30.708816],  {
            // Свойства.
   
			balloonContentHeader: 'заголовок',
            balloonContentBody: 'текст адресса',
			balloonContentFooter: '<b>футер</b>',
            hintContent: 'Собственный значок метки'
        }, shop);
    
    placemarks.push(['#ancor0',myPlacemark]);
    
	var myPlacemark1 = new ymaps.Placemark([50.535794,30.708816],  {
            // Свойства.
   
			balloonContentHeader: 'заголовок',
            balloonContentBody: 'текст адресса',
			balloonContentFooter: '<b>футер</b>',
            hintContent: 'Собственный значок метки'
        }, ishop);
	placemarks.push(['#ancor1',myPlacemark1]);
    
	var myPlacemark2 = new ymaps.Placemark([50.54,30.708816],  {
            // Свойства.
   
			balloonContentHeader: 'заголовок',
            balloonContentBody: 'текст адресса',
			balloonContentFooter: '<b>футер</b>',
            hintContent: 'Собственный значок метки'
        }, office);
    
    placemarks.push(['#ancor2',myPlacemark2]);
	
	var myPlacemark3 = new ymaps.Placemark([50.55,30.708816],  {
            // Свойства.
   
			balloonContentHeader: 'Киевский офис ООО "Укрхимпласт"',
            balloonContentBody: 'г. Киев, ул. Народного Ополчения, 26-А (въезд с Воздухофлотского проспекта)',
            hintContent: 'Киевский офис ООО "Укрхимпласт", г. Киев, ул. Народного Ополчения, 26-А (въезд с Воздухофлотского проспекта)',
        }, warehouse);
    
    placemarks.push(['#ancor3',myPlacemark3]);
 
    
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

    
}

