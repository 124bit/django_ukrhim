ymaps.ready(init);


function init () {
    
    var geolocation = ymaps.geolocation

    var coords = [geolocation.latitude, geolocation.longitude]

    var myMap = new ymaps.Map(
        'YMapsID',
        // Параметры карты.
        {
            // Географические координаты центра отображаемой карты.
            //center: [50.535794,30.708816],
            center: coords,
            // Масштаб.
            zoom: 5,
            behaviors:['default', 'scrollZoom', 'multiTouch','routeEditor']

        }
    );
	
	myMap.controls.add('zoomControl', { left: 5, top: 5 }).add('mapTools', { left: 35, top: 5 })
    var clusterer = new ymaps.Clusterer({preset: 'twirl#invertedLightblueClusterIcons'}) // 'twirl#lightblueClusterIcons'
	
    // Добавляем кластеризатор на карту.
    myMap.geoObjects.add(clusterer);
    
    var warehouse={
            // Опции.
            // Своё изображение иконки метки.
            iconImageHref: '/static/img/point_ware.png',
            // Размеры метки.
            iconImageSize: [47, 57],
            // Смещение левого верхнего угла иконки относительно
            // её "ножки" (точки привязки).
            iconImageOffset: [-3, -42],
			hideIconOnBalloonOpen: false
        }
    
    var shop={
            // Опции.
            // Своё изображение иконки метки.
            iconImageHref: '/static/img/point_shop.png',
            // Размеры метки.
            iconImageSize: [47, 57],
            // Смещение левого верхнего угла иконки относительно
            // её "ножки" (точки привязки).
            iconImageOffset: [-3, -42],
			hideIconOnBalloonOpen: false
        }
        
    var ishop={
            // Опции.
            // Своё изображение иконки метки.
            iconImageHref: '/static/img/point_ishop.png',
            // Размеры метки.
            iconImageSize: [47, 57],
            // Смещение левого верхнего угла иконки относительно
            // её "ножки" (точки привязки).
            iconImageOffset: [-3, -42],
			hideIconOnBalloonOpen: false
        }
		
	var office={
            // Опции.
            // Своё изображение иконки метки.
            iconImageHref: '/static/img/point_office.png',
            // Размеры метки.
            iconImageSize: [47, 57],
            // Смещение левого верхнего угла иконки относительно
            // её "ножки" (точки привязки).
            iconImageOffset: [-3, -42],
			hideIconOnBalloonOpen: false
        }	
        
    var placemarks = [];
    
    
    
    
    
    
    
    
    
    
    var myPlacemark = new ymaps.Placemark([50.52,30.708816],  {
            // Свойства.
   
			balloonContentHeader: 'заголовок',
            balloonContentBody: 'текст адресса',
			balloonContentFooter: '<b>футер</b>',
            hintContent: 'Собственный значок метки'
        }, shop);
    
    placemarks.push(['#ancor',myPlacemark]);
    
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
   
			balloonContentHeader: 'заголовок',
            balloonContentBody: 'текст адресса',
			balloonContentFooter: '<b>футер</b>',
            hintContent: 'Собственный значок метки'
        }, warehouse);
    
    placemarks.push(['#ancor3',myPlacemark3]);
 
    
    clusterer.add(placemarks.map(function (item){return item[1]}));
	
	$('#ancor').click(
				function (e) {
					e.preventDefault();
					$.scrollTo('#shops_and',{duration:300});
					if ( myPlacemark3.balloon.isOpen()) {
						 myPlacemark3.balloon.close();
					} else {
					// Плавно меняем центр карты на координаты метки.
							
							
							myMap.panTo( myPlacemark3.geometry.getCoordinates(), {
							delay: 300,
							callback: function () {myMap.setZoom(12, { callback: function() {myPlacemark3.balloon.open();
							}}) }});
							
					}})
	//placemarks.forEach(function (item) {  $(item[0]).toggle(
//			function () {
	//			item[1].balloon.open();
	//		},
	//		function () {
	//			item[1].balloon.close();
	//		}) });
//

    
}

