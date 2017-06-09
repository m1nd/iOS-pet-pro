//
//  BCData.m
//  Ex3
//
//  Created by m1nd on 29.12.13.
//  Copyright (c) 2013 m1nd. All rights reserved.
//


#import "NCData.h"


@implementation NCData

+ (NSArray *)fetchData
{
	NSMutableArray *result = [NSMutableArray array];

	NCData *item;

	item = [[NCData alloc] init];
	item.category = @"Новости";
	item.title = @"Вице-президент Apple раскритиковал Android";
	item.author = @"";
	item.createdOn = @"15 марта 2013";
	item.text = @"Обычно молчаливая Apple в последнее время явно позволяет себе гораздо больше, чем мы привыкли. Вот и вице-президент компании Фил Шиллер разошёлся не на шутку, дав интервью агентству Reuters, в котором заявил, что большинство пользователей Android в буквальном смысле «застряли» на старых версиях системы.";
	item.imageName = @"01_shiller.jpg";
	[result addObject:item];

	item = [[NCData alloc] init];
	item.category = @"Аналитика";
	item.title = @"Windows Phone 8 — самая комфортная ОС?";
	item.author = @"Антон Оборин";
	item.createdOn = @"15 марта 2013";
	item.text = @"Редакция PC Magazine провела опрос, целью которого было выявить удовлетворенность юзеров мобильными операционными системами. Результат оказался крайне неожиданным, потому что Windows Phone 8 удовлетворяет людей больше айоси и зеленого робота.";
	item.imageName = @"02_winphone.jpg";
	[result addObject:item];

	item = [[NCData alloc] init];
	item.category = @"Новости";
	item.title = @"Facebook проведёт конференцию для разработчиков";
	item.author = @"Антон Оборин";
	item.createdOn = @"15 марта 2013";
	item.text = @"Если вы подумали, что Facebook совсем забыл про разработчиков, то в какой-то мере вы правы, однако на днях соцсеть анонсировала масштабную конференцию Mobile DevCons, которая пройдёт в Нью-Йорке (18 апреля), Лондоне (2 мая) и Сеуле (7 мая).";
	item.imageName = @"03_fb.jpg";
	[result addObject:item];

	item = [[NCData alloc] init];
	item.category = @"Аналитика";
	item.title = @"65% прибыли рынка мобильных приложений уйдёт в карман Apple";
	item.author = @"Антон Оборин";
	item.createdOn = @"14 марта 2013";
	item.text = @"Как заявляет ABI Research, в 2013 году компания Apple получит 65% прибыли от рынка мобильных приложений, а это порядка 16 миллиардов долларов. На долю Android придется 27%, а оставшиеся 8% поделят между собой BlackBerry и Windows Phone.";
	item.imageName = @"04_apple.jpg";
	[result addObject:item];

	item = [[NCData alloc] init];
	item.category = @"Аналитика";
	item.title = @"Эксперты рассказали, почему растёт мобильный рынок";
	item.author = @"Антон Оборин";
	item.createdOn = @"14 марта 2013";
	item.text = @"Аналитики J’son & Partners Consulting провели исследование мобильного рынка России и мира, чтобы придти к выводу, что он растёт. Этим они не удивили ни себя, ни нас. Зато экспертам удалось проследить некоторые тенденции индустрии, касающиеся нашей страны.";
	item.imageName = @"05_mobile.jpg";
	[result addObject:item];

	item = [[NCData alloc] init];
	item.category = @"Есть мнение";
	item.title = @"Как себя чувствует российский мобайл в рейтинге Forbes";
	item.author = @"Сергей Болисов";
	item.createdOn = @"13 марта 2013";
	item.text = @"В последний день зимы российский Forbes порадовал нас рейтингом крупнейших компаний Рунета. Всё бы ничего, но в него вошли сразу три разработчика мобильных приложений, что, безусловно, не могло нас не заинтересовать.";
	item.imageName = @"06_gi-forbes.jpg";
	[result addObject:item];

	item = [[NCData alloc] init];
	item.category = @"Аналитика";
	item.title = @"40% пользователей «Моего Мира» платят за любимые игры";
	item.author = @"";
	item.createdOn = @"12 марта 2013";
	item.text = @"Mail.ru Group опубликовала инфографику, из которой следует, что суточная аудитория соцсети «Мой Мир» составляет 9,6 миллиона пользователей. Порядка трёх миллионов из них ежедневно играют в игры, представленные на ресурсе.";
	item.imageName = @"07_moikrug.jpg";
	[result addObject:item];

	item = [[NCData alloc] init];
	item.category = @"Новости";
	item.title = @"LinkedIn вот-вот купит разработчика Pulse";
	item.author = @"";
	item.createdOn = @"12 марта 2013";
	item.text = @"«Самая большая в мире социальная сеть для делового общения» LinkedIn вот-вот станет полноправным обладателем новостного мобильного агрегатора Pulse. А точнее — компании Alphonso Labs из Сан-Франциско, занимающейся разработкой этого приложения.";
	item.imageName = @"08_pulse.jpg";
	[result addObject:item];

	item = [[NCData alloc] init];
	item.category = @"Новости";
	item.title = @"Apple разрешит перепродавать контент из iTunes";
	item.author = @"";
	item.createdOn = @"11 марта 2013";
	item.text = @"Вполне возможно, совсем скоро мы сможем перепродавать приложения, которые нам больше не нужны. Такая функция может появиться в крупнейшем онлайн-магазине приложений AppStore, об этом сообщил AppleInsider.com.";
	item.imageName = @"09_angry.jpg";
	[result addObject:item];

	item = [[NCData alloc] init];
	item.category = @"Новости";
	item.title = @"Google представил модуль авторизации через G+";
	item.author = @"";
	item.createdOn = @"4 марта 2013";
	item.text = @"Разработчики социальной сети G+ давно не напоминали о себе, но в конце прошлой недели у них появился веский повод явить себя миру. Они анонсировали давно предсказанный и ожидаемый многими функционал авторизации пользователей в мобильных и веб-приложениях Google+ Sign-In.";
	item.imageName = @"10_gplus.jpg";
	[result addObject:item];

	return result;
}

@end
