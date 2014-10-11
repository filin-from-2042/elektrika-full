/**
 * Created by Set on 11.10.14.
 */

    // Создает обработчик события window.onLoad
YMaps.jQuery(function () {
    // Создает экземпляр карты и привязывает его к созданному контейнеру
    var map = new YMaps.Map(YMaps.jQuery("#ya_map")[0]);


    // Устанавливает начальные параметры отображения карты
    map.setCenter(new YMaps.GeoPoint(38.275313,54.02085), 13, YMaps.MapType.PMAP);

    // Создает метки магазинов
    var oStore34 = new YMaps.Placemark(new YMaps.GeoPoint(38.298307,54.016104));
    var oStore36 = new YMaps.Placemark(new YMaps.GeoPoint(38.299142,54.016104));
    var oStoreUrv = new YMaps.Placemark(new YMaps.GeoPoint(38.262266,54.023478));

    // Добавляем имена меткам
    oStore34.name = '"Электрика", ул. Садовского д.34';
    oStore36.name = '"Мир Профи", ул. Садовского д.36';
    oStoreUrv.name = '"Электрика", Новомосковск, ул. Мира д.34б';

    // Добавляет метку на карту
    map.addOverlay(oStore34);
    map.addOverlay(oStore36);
    map.addOverlay(oStoreUrv);

    // Добавляем элекменты управления
    map.addControl(new YMaps.Zoom());
    map.addControl(new YMaps.TypeControl([YMaps.MapType.PMAP, YMaps.MapType.PHYBRID]));
})
