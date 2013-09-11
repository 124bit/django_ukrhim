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
            iconImageHref: '/static/catalog/img/point_ware.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
        }
    
    var shop={
            iconImageHref: '/static/catalog/img/point_shop.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
        }
        
    var ishop={
            iconImageHref: '/static/catalog/img/point_ishop.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
        }
		
	var office={
            iconImageHref: '/static/catalog/img/point_office.png',
            iconImageSize: [47, 57],
            iconImageOffset: [-14, -52],
			hideIconOnBalloonOpen: false,
            balloonOffset: [0,-26],
            balloonShadow: false,
            balloonMaxWidth: 300,
        }	
        
    var placemarks = [];
    
    
    
    
    
    
    
    
    
    

//	office, ishop, shop, warehouse

	var myPlacemark = new ymaps.Placemark([50.413035,30.449487],  {   
			balloonContentHeader: 'Киевский офис ООО "Укрхимпласт"',
            balloonContentBody: 'г. Киев, ул. Народного Ополчения, 26-А (въезд с Воздухофлотского проспекта)',
            hintContent: 'Киевский офис ООО "Укрхимпласт", г. Киев, ул. Народного Ополчения, 26-А (въезд с Воздухофлотского проспекта)',
        }, office);
    placemarks.push(['#kiev_ukrhim_office',myPlacemark]);
 
    var myPlacemark = new ymaps.Placemark([50.557067,30.703007],  {   
			balloonContentHeader: 'Киевский склад ООО "Укрхимпласт"',
            balloonContentBody: 'Киевская обл., Броварской р-н, с. Зазимье, ул. Радгоспная, 3-А',
            hintContent: 'Киевский склад ООО "Укрхимпласт", Киевская обл., Броварской р-н, с. Зазимье, ул. Радгоспная, 3-А',
        }, warehouse);
    placemarks.push(['#kiev_ukrhim_warehouse',myPlacemark]);
    
    var myPlacemark = new ymaps.Placemark([53.937854,27.542508],  {   
			balloonContentHeader: 'Минский офис ООО "БелХимПласт"',
            balloonContentBody: 'г.Минск, ул.Долгиновский  тракт 39',
            hintContent: 'Минский офис ООО "БелХимПласт, г.Минск, ул.Долгиновский  тракт 39',
        }, office);
    placemarks.push(['#minsk_belhim_office',myPlacemark]);
    
    var myPlacemark = new ymaps.Placemark([53.963993,27.543341],  {   
			balloonContentHeader: 'Минский склад ООО "БелХимПласт"',
            balloonContentBody: 'г.Минск, ул.Автомобилистов 8а',
            hintContent: 'Минский склад ООО "БелХимПласт", г.Минск, ул.Автомобилистов 8-А',
        }, warehouse);
    placemarks.push(['#minsk_belhim_warehouse',myPlacemark]);
    
    
    var myPlacemark = new ymaps.Placemark([47.833061,35.226683],  {   
			balloonContentHeader: 'Магазин "Б.Н.В."',
            balloonContentBody: 'г. Запорожье, ул. Производственная 10',
            hintContent: 'Магазин "Б.Н.В.", г. Запорожье, ул. Производственная 10',
        }, shop);
    placemarks.push(['#zapor_bnv_shop',myPlacemark]);
    
    var myPlacemark = new ymaps.Placemark([50.476179,30.500858],  {   
			balloonContentHeader: 'Офис магазина "Б.Н.В."',
            balloonContentBody: 'г. Киев, ул. Межигорская 82',
            hintContent: 'Офис магазина "Б.Н.В.", г.Минск, г. Киев, ул. Межигорская 82',
        }, office);
    placemarks.push(['#kiev_bnv_office',myPlacemark]);

    var myPlacemark = new ymaps.Placemark([50.582975,36.576423],  {   
			balloonContentHeader: 'Магазина "Белгород-Бочка"',
            balloonContentBody: 'г. Белгород',
            hintContent: 'Магазина "Белгород-Бочка", г. Белгород',
        }, shop);
    placemarks.push(['#belgorod_bochka',myPlacemark]);
    
    var myPlacemark = new ymaps.Placemark([48.012563,37.799169],  {   
			balloonContentHeader: 'Региональный склад Укрхимпласт: ЧП «Тихомиров В.П.»',
            balloonContentBody: 'г. Донецк',
            hintContent: 'Региональный склад Укрхимпласт: ЧП «Тихомиров В.П.», г. Донецк',
        }, warehouse);
    placemarks.push(['#doneck_tihomirov',myPlacemark]);
    
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

