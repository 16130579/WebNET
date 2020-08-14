create table "user"(
	user_id varchar(100) not null primary key,
	user_firstName varchar(40),
	user_lastName varchar(40),
	user_fullName varchar(80),
	user_email varchar(100) not null,
	user_password varchar(40) not null,
	user_phone varchar(20)
	);

create table review(
		review_id varchar(100) not null  primary key,
		review_createBy varchar(100),
		review_createAt timestamp,
		review_ratingStar int,
		review_content varchar(max),
		review_productId varchar(100)
	);
		
create table provice(
	province_id varchar(100) not null  primary key,
	province_title varchar(30)
	);
	
create table product(
	product_id varchar(100) not null  primary key,
	product_name varchar(30),
	product_image varchar(255),
	product_price int,
	product_salePrice int,
	product_categoryId varchar(100),
	product_createBy varchar(100),
	product_createAt timestamp,
	product_quantity int,
	product_description varchar(max));
	
create table paragraph(
	paragraph_id varchar(100) not null  primary key,
	paragraph_title varchar(max),
	paragraph_content varchar(max),
	paragraph_blogsId varchar(100)
	);
	
create table orders(
	orders_id varchar(100) not null  primary key,
	orders_userId varchar(100),
	orders_shippingAddress varchar(100),
	orders_status tinyint,
	orders_register tinyint);
	
create table orderitem(
	orderItem_id varchar(100) not null  primary key,
	orderItem_ordersId varchar(100),
	orderItem_productId varchar(100),
	orderItem_quantity int);
	
create table district(
	district_id varchar(100) not null  primary key,
	district_title varchar(30),
	district_provinceId varchar(100));
	
create table category(
	category_id varchar(100) not null  primary key,
	category_title varchar(100),
	category_createBy varchar(100));
	
create table blogs(
	blogs_id varchar(100) not null  primary key,
	blogs_createBy varchar(100),
	blogs_title varchar(200),
	blogs_image varchar(200),
	blogs_createAt timestamp,
	blog_content varchar(max));
	
create table admin(
	admin_id varchar(100) not null  primary key,
	admin_name varchar(20),
	admin_password varchar(20));
	
create table addressdetail(
	addressDetail_id varchar(100),
	addressDetail_address varchar(10),
	addressDetail_userId varchar(100),
	addressDetail_postCode int);
	
	alter table review add constraint fk01_review foreign key (review_createBy) references "user" (user_id);
	alter table review add constraint fk02_review foreign key (review_productId) references product(product_id);
	
	alter table product add constraint fk01_product foreign key (product_createBy) references admin (admin_id);
	alter table product add constraint fk02_product foreign key (product_categoryId) references category(category_id);
	
	alter table paragraph add constraint fk_paragrap foreign key (paragraph_blogsId) references blogs(blogs_id);
	
	alter table orders add constraint fk_orders foreign key (orders_userId) references "user"(user_id);
	
	alter table orderItem add constraint fk01_orderItem foreign key (orderItem_ordersId) references orders(orders_id);
	alter table orderItem add constraint fk02_orderItem foreign key (orderItem_productId) references product(product_id);
	
	alter table category add constraint fk_category foreign key (category_createBy) references admin(admin_id);
	
	alter table blogs add constraint fk_blog foreign key (blogs_createBy) references admin(admin_id);
	
	alter table addressdetail add constraint fk_addressDetail foreign key (addressDetail_userId) references "user"(user_id);
	
	alter table district add constraint fk_district foreign key (district_provinceId) references district(district_id);
	ALTER TABLE product
ADD product_status int;
	
INSERT INTO admin(admin_id, admin_name, admin_password) VALUES ('AD01', 'TrongNhat', 'admin');
INSERT INTO admin(admin_id, admin_name, admin_password) VALUES ('AD02', 'TuanThanh', 'admin');
INSERT INTO admin(admin_id, admin_name, admin_password) VALUES ('AD03', 'DucTai', 'admin');

INSERT INTO blogs(blogs_id, blogs_createBy, blogs_title, blogs_image, blogs_createAt, blog_content) VALUES ('BL001', 'AD03', 'Necessitatibus Saepe', 'img/blog-6-890x620.jpg', '2019-08-28 16:53:18', 'The standard Lorem Ipsum passage, used since the 1500s\"Lorem...');
INSERT INTO blogs(blogs_id, blogs_createBy, blogs_title, blogs_image, blogs_createAt, blog_content) VALUES ('BL002', 'AD02', 'Urna Curabitur', 'img/blog-5-890x620.jpg', '2019-08-13 16:54:23', '1914 translation by H. Rackham\"But I must explain to you how...');
INSERT INTO blogs(blogs_id, blogs_createBy, blogs_title, blogs_image, blogs_createAt, blog_content) VALUES ('BL003', 'AD03', 'Nullam Ullamcorper', 'img/blog-4-890x620.jpg', '2019-07-22 16:55:34', 'If you are going to use a passage of Lorem Ipsum, you need t...');
INSERT INTO blogs(blogs_id, blogs_createBy, blogs_title, blogs_image, blogs_createAt, blog_content) VALUES ('BL004', 'AD01', 'Turpis Eleifend', 'img/blog-3-890x620.jpg', '2019-08-27 17:00:14', 'Contrary to popular belief, Lorem Ipsum is not simply random...');
INSERT INTO blogs(blogs_id, blogs_createBy, blogs_title, blogs_image, blogs_createAt, blog_content) VALUES ('BL005', 'AD02', 'Morbi Condimentum', 'img/blog-2-890x620.jpg', '2019-10-22 17:01:22', 'It is a long established fact that a reader will be distract...');
INSERT INTO blogs(blogs_id, blogs_createBy, blogs_title, blogs_image, blogs_createAt, blog_content) VALUES ('BL006', 'AD03', 'Umauris Curabitur', 'img/blog-1-890x620.jpg', '2019-08-27 17:02:19', 'Suspendisse posuere, diam in bibendum lobortis, turpis ipsum...');


INSERT INTO category(category_id, category_title, category_createBy) VALUES ('C101', 'Healthful Food', 'AD02');
INSERT INTO category(category_id, category_title, category_createBy) VALUES ('C102', 'Lite Food', 'AD01');
INSERT INTO category(category_id, category_title, category_createBy) VALUES ('C103', 'Super Food', 'AD03');
INSERT INTO category(category_id, category_title, category_createBy) VALUES ('C200', 'Chemical Free', 'AD02');
INSERT INTO category(category_id, category_title, category_createBy) VALUES ('C301', 'Skinny Food', 'AD01');
INSERT INTO category(category_id, category_title, category_createBy) VALUES ('C302', 'Low-Calorie', 'AD03');
INSERT INTO category(category_id, category_title, category_createBy) VALUES ('C304', 'Non-Fat', 'AD01');
INSERT INTO category(category_id, category_title, category_createBy) VALUES ('C305', 'Peanut', 'AD03');
INSERT INTO category(category_id, category_title, category_createBy) VALUES ('C400', 'Nursery', 'AD03');
INSERT INTO category(category_id, category_title, category_createBy) VALUES ('C500', 'Vegetables', 'AD02');


INSERT INTO paragraph(paragraph_id, paragraph_title, paragraph_content, paragraph_blogsId) VALUES ('PR001', 'The standard Lorem Ipsum passage, used since the 1500s', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', 'BL001');
INSERT INTO paragraph(paragraph_id, paragraph_title, paragraph_content, paragraph_blogsId) VALUES ('PR003', 'Section 1.10.33 of \"de Finibus Bonorum et Malorum\"', '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.\"', 'BL002');
INSERT INTO paragraph(paragraph_id, paragraph_title, paragraph_content, paragraph_blogsId) VALUES ('PR004', '  ', 'If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. ', 'BL003');
INSERT INTO paragraph(paragraph_id, paragraph_title, paragraph_content, paragraph_blogsId) VALUES ('PR005', '  ', 'It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'BL003');
INSERT INTO paragraph(paragraph_id, paragraph_title, paragraph_content, paragraph_blogsId) VALUES ('PR006', 'Contrary to popular belief, Lorem Ipsum is not simply random text.', 'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.', 'BL004');
INSERT INTO paragraph(paragraph_id, paragraph_title, paragraph_content, paragraph_blogsId) VALUES ('PR007', ' ', 'Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', 'BL004');
INSERT INTO paragraph(paragraph_id, paragraph_title, paragraph_content, paragraph_blogsId) VALUES ('PR008', ' ', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', 'BL005');
INSERT INTO paragraph(paragraph_id, paragraph_title, paragraph_content, paragraph_blogsId) VALUES ('PR009', ' ', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'BL005');
INSERT INTO paragraph(paragraph_id, paragraph_title, paragraph_content, paragraph_blogsId) VALUES ('PR010', ' ', 'Suspendisse posuere, diam in bibendum lobortis, turpis ipsum aliquam risus, sit amet dictum ligula lorem non nisl. Ut vitae nibh id massa vulputate euismod ut quis justo. Ut bibendum sem at massa lacinia, eget elementum ante consectetur. Nulla id pharetra dui, at rhoncus urna. Maecenas non porttitor purus. Nullam ullamcorper nisl quis ornare molestie.\r\n\r\nSuspendisse posuere, diam in bibendum lobortis, turpis ipsum aliquam risus, sit amet dictum ligula lorem non nisl. Ut vitae nibh id massa vulputate euismod ut quis justo. Ut bibendum sem at massa lacinia, eget elementum ante consectetur. Nulla id pharetra dui, at rhoncus urna. Maecenas non porttitor purus. Nullam ullamcorper nisl quis ornare molestie.\r\n\r\nSuspendisse posuere, diam in bibendum lobortis, turpis ipsum aliquam risus, sit amet dictum ligula lorem non nisl. Ut vitae nibh id massa vulputate euismod ut quis justo. Ut bibendum sem at massa lacinia, eget elementum ante consectetur. Nulla id pharetra dui, at rhoncus urna. Maecenas non porttitor purus. Nullam ullamcorper nisl quis ornare molestie.\r\n\r\nSuspendisse posuere, diam in bibendum lobortis, turpis ipsum aliquam risus, sit amet dictum ligula lorem non nisl. Ut vitae nibh id massa vulputate euismod ut quis justo. Ut bibendum sem at massa lacinia, eget elementum ante consectetur. Nulla id pharetra dui, at rhoncus urna. Maecenas non porttitor purus. Nullam ullamcorper nisl quis ornare molestie.\r\n\r\nSuspendisse posuere, diam in bibendum lobortis, turpis ipsum aliquam risus, sit amet dictum ligula lorem non nisl. Ut vitae nibh id massa vulputate euismod ut quis justo. Ut bibendum sem at massa lacinia, eget elementum ante consectetur. Nulla id pharetra dui, at rhoncus urna. Maecenas non porttitor purus. Nullam ullamcorper nisl quis ornare molestie.\r\n\r\nSuspendisse posuere, diam in bibendum lobortis, turpis ipsum aliquam risus, sit amet dictum ligula lorem non nisl. Ut vitae nibh id massa vulputate euismod ut quis justo. Ut bibendum sem at massa lacinia, eget elementum ante consectetur. Nulla id pharetra dui, at rhoncus urna. Maecenas non porttitor purus. Nullam ullamcorper nisl quis ornare molestie.\r\n\r\nSuspendisse posuere, diam in bibendum lobortis, turpis ipsum aliquam risus, sit amet dictum ligula lorem non nisl. Ut vitae nibh id massa vulputate euismod ut quis justo. Ut bibendum sem at massa lacinia, eget elementum ante consectetur. Nulla id pharetra dui, at rhoncus urna. Maecenas non porttitor purus. Nullam ullamcorper nisl quis ornare molestie.\r\n\r\nSuspendisse posuere, diam in bibendum lobortis, turpis ipsum aliquam risus, sit amet dictum ligula lorem non nisl. Ut vitae nibh id massa vulputate euismod ut quis justo. Ut bibendum sem at massa lacinia, eget elementum ante consectetur. Nulla id pharetra dui, at rhoncus urna. Maecenas non porttitor purus. Nullam ullamcorper nisl quis ornare molestie.', 'BL006');
INSERT INTO paragraph(paragraph_id, paragraph_title, paragraph_content, paragraph_blogsId) VALUES ('PR011', '  ', 'Etiam eget erat est. Phasellus elit justo, mattis non lorem non, aliquam aliquam ps. Sed fermentum consectetur magna, eget semper ante. Aliquam scelerisque justo velit. Fusce cursus blandit dolor, in sodales urna vulputate lobortis. Nulla ut tellus turpis. Nullam lacus sem, volutpat id odio sed, cursus tristique eros. Duis at pellentesque magna. Donec magna nisi, vulputate ac nulla eu, ultricies tincidunt tellus. Nunc tincidunt sem urna, nec venenatis libero vehicula ut.', 'BL006');


INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0001', 'Apple', 'img/apple.jpg', 150, NULL, 'C400', 'AD03', '2019-12-04 00:08:54', 50, 'Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you’re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.\r\n\r\n', 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0002', 'Grape', 'img/grape.jpg', 120, 98, 'C103', 'AD02', '2019-11-29 11:57:12', 60, 'More room to move: With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.\r\nCover Flow: Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.\r\nEnhanced interface: Experience a whole new way to browse and view your music and video.\r\nSleeker design: Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.', 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0003', 'Lemon', 'img/lemon.jpg', 160, 90, 'C304', 'AD03', '2019-12-02 20:03:11', 70, 'Video in your pocket: Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.\r\nCover Flow: Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list. \r\nEnhanced interface: Experience a whole new way to browse and view your music and video.\r\nSleek and colorful: With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.\r\niTunes: Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.', 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0004', 'Peach', 'img/peach.jpg', 100, 80, 'C400', 'AD01', '2019-12-02 21:33:41', 56, 'Born to be worn: Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.\r\nRandom meets rhythm: With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.\r\nEverything is easy: Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.\r\n\r\n', 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0005', 'Guava', 'img/guava.jpg', 120, 85, 'C101', 'AD03', '2019-12-02 20:07:34', 48, 'Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you’re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.\r\n\r\n', 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0006', 'Papaya', 'img/papaya.jpg', 180, 170, 'C200', 'AD02', '2019-12-02 20:09:34', 58, 'The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)\r\nThe D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon\s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.', 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0007', 'Strawberry', 'img/strawberry.png', 200, NULL, 'C102', 'AD02', '2019-12-04 00:08:59', 22, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0008', 'Orange', 'img/orange.jpg', 130, 110, 'C304', 'AD03', '2019-11-28 16:41:54', 45, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0009', 'Basil', 'img/basil.jpg', 120, 100, 'C500', 'AD01', '2019-11-29 14:46:14', 100, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0010', 'Cherries', 'img/cherries.jpg', 201, 180, 'C102', 'AD03', '2019-12-02 20:06:20', 80, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0011', 'Pear', 'img/pear.jpg', 109, 80, 'C101', 'AD02', '2019-12-02 20:07:17', 90, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0012', '\r\nPomegrenade', 'img/pomegrenade.png', 108, 70, 'C101', 'AD01', '2019-12-02 20:08:26', 85, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0013', 'Banana', 'img/banana.jpg', 100, 70, 'C101', 'AD03', '2019-12-02 20:08:33', 96, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0014', 'Mango', 'img/mango.jpg', 150, 120, 'C304', 'AD02', '2019-12-02 20:05:06', 75, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0015', 'Coconut', 'img/coconut.jpg', 150, 130, 'C103', 'AD02', '2019-11-28 16:42:07', 64, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0016', 'Pomelo', 'img/pomelo.jpg', 110, 100, 'C103', 'AD03', '2019-12-02 20:01:20', 82, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0017', 'Watermelon', 'img/watermelon.jpg', 160, 140, 'C103', 'AD01', '2019-12-02 20:02:17', 63, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0018', 'Sapodilla', 'img/sapodilla.jpg', 120, 110, 'C301', 'AD02', '2019-11-28 16:42:14', 84, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0019', 'Kiwi', 'img/kiwi.jpg', 140, 130, 'C400', 'AD03', '2019-12-02 21:31:04', 75, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0020', 'Mangosteen', 'img/mangosteen.jpg', 140, 120, 'C302', 'AD03', '2019-11-28 16:42:17', 72, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0021', 'Avocado', 'img/avocado.jpg', 170, NULL, 'C400', 'AD01', '2019-12-04 00:09:02', 94, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0022', 'Rambutan', 'img/rambutan.jpg', 110, 90, 'C102', 'AD02', '2019-12-02 20:13:53', 78, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0023', 'Durian', 'img/durian.jpg', 110, 80, 'C103', 'AD01', '2019-12-02 20:00:12', 53, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0024', 'Longan', 'img/longan.jpg', 130, 110, 'C102', 'AD03', '2019-12-02 20:13:19', 46, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0025', 'Lychee', 'img/lychee.jpg', 150, 130, 'C102', 'AD01', '2019-11-28 16:42:29', 60, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0026', 'Dragon Fruit', 'img/dragon-fruits.jpg', 120, 120, 'C200', 'AD03', '2019-11-28 16:42:30', 76, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0027', 'Startfruit', 'img/startfruit.jpg', 100, 90, 'C304', 'AD02', '2019-12-02 20:04:34', 98, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0028', '\r\nPistachio', 'img/pistachio.jpg', 180, 150, 'C103', 'AD03', '2019-11-28 16:42:33', 100, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0029', 'Tomato', 'img/tomato.png', 90, 70, 'C500', 'AD02', '2019-11-28 16:42:34', 89, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0030', 'Carrot', 'img/carrot.png', 100, 80, 'C500', 'AD03', '2019-12-02 15:45:42', 95, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0031', 'Pumpkin', 'img/pumpkin.png', 150, 140, 'C500', 'AD01', '2019-12-02 15:45:48', 75, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0032', 'Melon Fruit', 'img/melon-fruit.jpg', 120, 110, 'C500', 'AD03', '2019-11-28 16:42:37', 65, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0033', 'Cabbage', 'img/cabbage.jpg', 110, 100, 'C500', 'AD02', '2019-11-28 16:42:40', 83, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0034', 'Scallion', 'img/scallion.jpg', 80, 60, 'C500', 'AD02', '2019-11-28 16:42:41', 4, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0035', 'Cucumber', 'img/cucumber.jpg', 90, 80, 'C500', 'AD01', '2019-11-28 16:42:42', 86, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0036', 'Okra', 'img/okra.jpg', 80, 70, 'C500', 'AD03', '2019-11-28 16:42:44', 76, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0037', 'Fish Lettuce', 'img/fish-lettuce.jpg', 90, 80, 'C500', 'AD02', '2019-11-28 16:42:45', 78, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0038', 'Melon', 'img/melon.png', 180, 150, 'C103', 'AD01', '2019-12-02 20:02:47', 77, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0039', 'Plum', 'img/plum.jpg', 150, 120, 'C304', 'AD03', '2019-11-28 16:42:47', 67, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0040', 'Blueberry', 'img/blueberry.png', 210, 190, 'C102', 'AD02', '2019-12-02 20:05:41', 68, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0041', 'Breastmilk', 'img/breastmilk.png', 190, 180, 'C400', 'AD01', '2019-11-28 16:42:50', 64, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0042', 'Soursop', 'img/soursop.jpg', 180, 170, 'C103', 'AD03', '2019-12-02 20:01:51', 85, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0043', 'Sprouts', 'img/sprouts.jpg', 90, 80, 'C500', 'AD03', '2019-11-28 16:42:54', 89, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0044', 'Small Apple', 'img/small-apple.jpg', 150, 130, 'C500', 'AD02', '2019-11-28 16:42:55', 87, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0045', 'Potato', 'img/potato.jpg', 120, 110, 'C500', 'AD01', '2019-11-28 16:42:58', 59, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0046', 'Discharge', 'img/discharge.jpg', 100, 70, 'C500', 'AD02', '2019-11-28 16:42:59', 60, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0047', 'Kohlrabi', 'img/Kohlrabi.jpg', 100, 90, 'C500', 'AD01', '2019-11-28 16:43:01', 63, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0048', 'Taro', 'img/taro.jpg', 90, 90, 'C500', 'AD03', '2019-11-28 16:43:02', 53, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0049', 'Broccoli', 'img/broccoli.jpg', 90, 80, 'C500', 'AD02', '2019-12-02 12:41:11', 47, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0050', 'Jackfruit', 'img/jackfruit.jpg', 180, 170, 'C103', 'AD02', '2019-12-02 20:00:41', 62, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0051', 'Chili', 'img/chili.jpg', 90, 80, 'C500', 'AD01', '2019-11-28 16:43:09', 87, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0052', 'Passion', 'img/passion.jpeg', 130, 120, 'C304', 'AD01', '2019-11-28 16:43:10', 88, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0053', 'Otaheite Apple', 'img/otaheite-apple.jpg', 120, 110, 'C302', 'AD02', '2019-11-28 16:43:12', 94, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0054', 'Pear Shaped Melon', 'img/pear-shaped-melon.jpg', 180, 160, 'C301', 'AD03', '2019-11-28 16:43:13', 93, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0055', 'Nipa', 'img/nipa.jpg', 160, 150, 'C103', 'AD03', '2019-12-02 21:16:11', 91, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0056', 'Persimmon', 'img/presimmon.jpg', 170, 140, 'C304', 'AD01', '2019-12-02 12:48:26', 90, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0057', 'Tamarind', 'img/tamarind.jpg', 140, 130, 'C302', 'AD02', '2019-11-28 16:43:25', 85, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0058', 'Corn', 'img/corn.jpg', 120, 110, 'C500', 'AD01', '2019-11-28 16:43:26', 83, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0059', 'Sake', 'img/sake.jpg', 140, 120, 'C103', 'AD03', '2019-12-02 22:31:41', 73, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0060', 'Xoay', 'img/xoay.jpg', 120, 110, 'C304', 'AD02', '2019-11-28 16:43:29', 72, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0061', 'Sea Buckthorn', 'img/sea-buckthorn.jpg', 110, 100, 'C304', 'AD01', '2019-12-02 22:47:19', 71, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0062', 'Acerola', 'img/acerola.jpg', 150, 140, 'C102', 'AD02', '2019-12-02 20:06:00', 89, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0064', 'Citrus', 'img/citrus.jpg', 130, 100, 'C102', 'AD01', '2019-12-02 20:06:45', 81, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0065', 'Almond', 'img/almond.jpg', 190, 180, 'C305', 'AD03', '2019-11-28 16:43:35', 80, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0066', 'Cashew', 'img/cashew.jpeg', 190, 170, 'C305', 'AD02', '2019-11-28 16:43:38', 58, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0067', 'Chestnut', 'img/chestnut.jpg', 180, 160, 'C305', 'AD02', '2019-11-28 16:43:41', 61, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0068', 'Walnut', 'img/walnut.jpg', 180, 170, 'C305', 'AD01', '2019-11-28 16:43:42', 63, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0069', 'Peanut', 'img/peanut.jpg', 150, 120, 'C305', 'AD03', '2019-11-28 16:43:45', 65, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0070', 'Water Spinach', 'img/water-spinach.png', 100, 90, 'C500', 'AD02', '2019-11-28 16:43:52', 67, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0071', 'Celery', 'img/celery.jpg', 90, 70, 'C500', 'AD01', '2019-12-02 21:21:59', 69, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0072', 'Spinach', 'img/spinach.jpg', 120, 110, 'C500', 'AD03', '2019-11-28 16:43:58', 78, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0073', 'Wili Chili', 'img/wili-chili.jpg', 80, 70, 'C102', 'AD03', '2019-12-02 22:23:57', 23, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0074', 'Peper', 'img/peper.jpg', 120, 110, 'C500', 'AD01', '2019-12-02 22:40:29', 25, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0076', 'Radish', 'img/radish.jpg', 120, 100, 'C500', 'AD03', '2019-12-02 22:22:45', 40, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0077', 'Asparagus', 'img/asbaragus.jpeg', 100, 80, 'C500', 'AD02', '2019-12-08 22:43:26', 65, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0078', 'Garlic', 'img/garlic.jpg', 90, 80, 'C500', 'AD02', '2019-12-02 22:25:04', 70, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0079', 'Kiwano', 'img/kiwano.jpg', 150, 130, 'C200', 'AD03', '2019-12-02 22:26:21', 60, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0080', 'Tamarillo', 'img/tamarillo.jpg', 160, 150, 'C200', 'AD01', '2019-12-02 22:27:18', 54, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0081', 'Phisalis Angulata', 'img/physalis-angulata.jpg', 180, 170, 'C200', 'AD02', '2019-12-02 22:43:17', 26, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0082', 'Bon Bon', 'img/bonbon.jpg', 120, 110, 'C200', 'AD03', '2019-12-02 22:29:27', 29, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0083', 'Cupuacu', 'img/cupuacu.jpg', 110, 100, 'C200', 'AD01', '2019-12-02 22:30:20', 50, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0084', 'Pumpkin Seed', 'img/pumpkin-seed.png', 180, 170, 'C305', 'AD02', '2019-12-02 22:42:22', 90, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0085', 'Pine Nut', 'img/pine-nut.jpg', 170, 160, 'C305', 'AD02', '2019-12-02 22:33:24', 85, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0086', 'Macadamia', 'img/macadamia.png', 190, 180, 'C305', 'AD01', '2019-12-02 22:34:23', 98, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0087', 'Coffee', 'img/coffee-nut.jpg', 160, 150, 'C305', 'AD03', '2019-12-02 22:35:09', 97, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0088', 'Black Beans', 'img/black-bean.jpg', 180, 170, 'C305', 'AD03', '2019-12-02 22:36:01', 87, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0089', 'Mung Beans', 'img/mung-bean.jpg', 190, 180, 'C305', 'AD01', '2019-12-02 22:36:48', 89, NULL, 1);
INSERT INTO product(product_id, product_name, product_image, product_price, product_salePrice, product_categoryId, product_createBy, product_createAt, product_quantity, product_description, product_status) VALUES ('P0090', 'Pepino', 'img/pepino.png', 180, 170, 'C305', 'AD01', '2019-12-02 22:41:48', 79, NULL, 1);


INSERT INTO provice(province_id, province_title) VALUES ('PV60', 'Dong Nai');
INSERT INTO provice(province_id, province_title) VALUES ('PV61', 'Binh Duong');
INSERT INTO provice(province_id, province_title) VALUES ('PV62', 'Long An');
INSERT INTO provice(province_id, province_title) VALUES ('PV63', 'Tien Giang');
INSERT INTO provice(province_id, province_title) VALUES ('PV64', 'Vinh Long');
INSERT INTO provice(province_id, province_title) VALUES ('PV65', 'Can Tho');
INSERT INTO provice(province_id, province_title) VALUES ('PV66', 'An Giang');
INSERT INTO provice(province_id, province_title) VALUES ('PV67', 'Dong Thap');
INSERT INTO provice(province_id, province_title) VALUES ('PV68', 'Kien Giang');
INSERT INTO provice(province_id, province_title) VALUES ('PV69', 'Ca Mau');
INSERT INTO provice(province_id, province_title) VALUES ('PV70', 'Tay  Ninh');
INSERT INTO provice(province_id, province_title) VALUES ('PV71', 'Ben Tre');
INSERT INTO provice(province_id, province_title) VALUES ('PV72', 'Vung Tau');
INSERT INTO provice(province_id, province_title) VALUES ('PV75', 'Thua Thien Hue');
INSERT INTO provice(province_id, province_title) VALUES ('PV76', 'Quang Ngai');
INSERT INTO provice(province_id, province_title) VALUES ('PV77', 'Binh Dinh');
INSERT INTO provice(province_id, province_title) VALUES ('PV78', 'Phu Yen');
INSERT INTO provice(province_id, province_title) VALUES ('PV79', 'Khanh Hoa');
INSERT INTO provice(province_id, province_title) VALUES ('PV85', 'Binh Thuan');
INSERT INTO provice(province_id, province_title) VALUES ('PV89', 'Hung  Yen');
INSERT INTO provice(province_id, province_title) VALUES ('PV93', 'Binh Phuoc');
INSERT INTO provice(province_id, province_title) VALUES ('PV94', 'Bac Lieu');
INSERT INTO provice(province_id, province_title) VALUES ('PV95', 'Hau Giang');


INSERT INTO review(review_id, review_createBy, review_createAt, review_ratingStar, review_content, review_productId) VALUES ('RV0001', 'U01', '2019-11-05 11:04:31', 4, 'The good product', 'P0001');
INSERT INTO review(review_id, review_createBy, review_createAt, review_ratingStar, review_content, review_productId) VALUES ('RV0002', 'U02', '2019-12-03 17:14:28', 5, 'Contrary to popular belief, Lorem Ipsum is not simply random text.', 'P0001');
INSERT INTO review(review_id, review_createBy, review_createAt, review_ratingStar, review_content, review_productId) VALUES ('RV0003', 'U03', '2019-11-29 14:43:31', 5, 'Contrary to popular belief, Lorem Ipsum is not simply random text.', 'P0003');
INSERT INTO review(review_id, review_createBy, review_createAt, review_ratingStar, review_content, review_productId) VALUES ('RV0004', 'U02', '2019-11-29 14:43:34', 3, 'The so-so product', 'P0004');
INSERT INTO review(review_id, review_createBy, review_createAt, review_ratingStar, review_content, review_productId) VALUES ('RV0005', 'U03', '2019-11-29 14:43:39', 5, 'I love it ', 'P0005');
INSERT INTO review(review_id, review_createBy, review_createAt, review_ratingStar, review_content, review_productId) VALUES ('RV0062', 'U03', '2019-11-29 14:38:24', 5, 'The brand offers feminine designs delivering stylish separates and statement dresses which has since evolved into', 'P0072');

INSERT INTO "user"(user_id, user_firstName, user_lastName, user_fullName, user_email, user_password, user_phone) VALUES ('ca92c135-f1b2-4aba-8e4b-5c7034557ff1', 'Nhat Huynh', 'Trong', 'Nhat Huynh Trong', '25798@gmail.com', 'huynh@#1?', '0346112737');
INSERT INTO "user"(user_id, user_firstName, user_lastName, user_fullName, user_email, user_password, user_phone) VALUES ('U01', 'Pham  Duc', 'Tai', 'Pham Duc Tai', 'phamductai@gmail.com', '789', '0984533131');
INSERT INTO "user"(user_id, user_firstName, user_lastName, user_fullName, user_email, user_password, user_phone) VALUES ('U02', 'Nguyen Huy', 'Cuong', 'Nguyen Huy Cuong', 'huycuong10081996@gmail.com', '456', '0132335333');
INSERT INTO "user"(user_id, user_firstName, user_lastName, user_fullName, user_email, user_password, user_phone) VALUES ('U03', 'Huynh Trong', 'Nhat', 'Huynh Trong Nhat', '1huynhtrongnhat@gmail.com', '123', '0343661688');
