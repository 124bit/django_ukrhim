ymaps.ready(init);


function init () {
    
    
    
    var myMap = new ymaps.Map(
        'YMapsID',
        // Параметры карты.
        {
            center: [45.899305,37.0049632],
            zoom: 6.5,
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



    var myPlacemark = new ymaps.Placemark([45.044472,33.996927],  {   
			balloonContentHeader: 'Завод ООО "КрымХимПласт"',
            balloonContentBody: 'Крым, Симферопольский район, село Укромное, переулок Кадровый 14А, тел.: +7 (978) 809 77 70',
            hintContent: 'Офис ООО "БелХимПластик", Крым, Симферопольский район, село Укромное, переулок Кадровый 14А, тел.: +7 (978) 809 77 70',
        }, office);
    placemarks.push(['#rus_belhimpl_office',myPlacemark]);
    
	
	
  
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

