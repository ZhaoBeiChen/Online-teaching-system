
create database ots;

create table `ots`.offered
(
	id INT not null primary key,
	courseid INT not null,
	teacherid INT not null,
	datestart DATE not null,
	dateend DATE not null
	
);
insert into `ots`.offered values(0,0,0,'2017-06-01','2017-12-31');

create table `ots`.selected
(
	id INT not null primary key,
	offeredid INT not null,
	classid INT not null
);

insert into `ots`.selected values(0,0,0);

create table `ots`.class
(
	id INT not null primary key,
	name VARCHAR(50) not null
);

insert into `ots`.class values(0,'计算机科学与技术');
insert into `ots`.class values(1,'信息管理与信息系统');
insert into `ots`.class values(2,'电子商务');
insert into `ots`.class values(3,'软件工程');
insert into `ots`.class values(4,'网络工程');


create table `ots`.course
(
	id INT not null primary key,
	name VARCHAR(50) not null,
	content VARCHAR(1000) not null
);

INSERT INTO `ots`.course VALUES (0,'离散数学','离散数学(Discrete mathematics)是研究离散量的结构及其相互关系的数学学科，是现代数学的一个重要分支。离散的含义是指不同的连接在一起的元素，主要是研究基于离散量的结构和相互间的关系，其对象一般是有限个或可数个元素。离散数学在各学科领域，特别在计算机科学与技术领域有着广泛的应用，同时离散数学也是计算机专业的许多专业课程，如程序设计语言、数据结构、操作系统、编译技术、人工智能、数据库、算法设计与分析、理论计算机科学基础等必不可少的先行课程。'),(1,'程序设计','《程序设计》是信息学院电子信息类的一门必修的行业平台课程。课程的主要功能是：通过理论和实践教学，训练和培养学生获得C语言编程方面的能力，使学生具备相关职业应用性人才所必需的程序编制及创新设计等基本知识与技能。'),(2,'数据结构与算法','人们利用计算机的目的是解决实际的应用问题。数据结构与算法的研究涉及构筑计算机求解问题过程的两大基石：一是刻画实际问题中信息及其关系的数据结构，二是描述问题解决方案的算法。所以说“数据结构与算法”这门课程是计算机专业课程的核心。\n\n作为学科的专业基础核心课程，《数据结构与算法》对应于学科中问题求解的理论、抽象和设计的方法论，在学科知识体系中具有核心的重要位置。它既是对以往课程的深入和扩展，也为深入地学习其他专业课程打下基础，课程中涉及到的基本的线性结构、树、图等数据结构和查找、排序算法，是计算机科学的基本功。B+树、散列（Hash）等高级数据结构，也是数据库、操作系统、编译原理、计算机网络等重要专业课程的基础。'),(3,'操作系统','操作系统（Operating System，简称OS）是管理和控制计算机硬件与软件资源的计算机程序，是直接运行在“裸机”上的最基本的系统软件，任何其他软件都必须在操作系统的支持下才能运行。\n\n\n\n操作系统是用户和计算机的接口，同时也是计算机硬件和其他软件的接口。操作系统的功能包括管理计算机系统的硬件、软件及数据资源，控制程序运行，改善人机界面，为其它应用软件提供支持，让计算机系统所有资源最大限度地发挥作用，提供各种形式的用户界面，使用户有一个好的工作环境，为其它软件的开发提供必要的服务和相应的接口等。实际上，用户是不用接触操作系统的，操作系统管理着计算机硬件资源，同时按照应用程序的资源请求，分配资源，如：划分CPU时间，内存空间的开辟，调用打印机等。'),(4,'计算机组成原理','计算机组成原理是本科计算机科学与技术专业的学科基础课，重点讲授计算机系统的硬件组成，及其主要功能子系统的基本原理和逻辑设计，内容安排遵照本科教学大纲，兼顾硕士生入学专业课考试，有助于培养学习者计算机硬件系统的分析和设计能力，给参加与本课程相关考试的学习者插上翅膀，如虎添翼。'),(5,'编译原理','编译原理是计算机科学中历史最悠久，也是最高度发展的学科之一。编译器的设计与实现集中体现了计算机科学中的最核心的思想和技术，并且和计算机科学的其他研究领域，如形式语言与自动机、算法、数据结构、程序设计语言、计算机体系结构、软件工程等都有非常重要的联系。\n\n\n\n本课程主要讲授编译器设计与实现中的理论和技术。主要内容包括词法分析、语法分析、语法树构造、语义分析、中间代码生成、代码优化、目标代码生成等主要内容。编译原理最大的特点是强调理论和实践的结合，这也是本课程最强调的部分。在理论方面，我们将和你一起讨论丰富有趣的理论知识，包括正则表达式、有限状态自动机、形式文法、类型系统、数据流方程、不动点算法、格、闭包等；而且实践部分，我们将讨论如果选择合理的数据结构和高效的算法来实现这些理论，以及如何运用软件工程中的思想来处理编译器设计中所出现的种种复杂性。\n\n\n\n该课程主要面向计算机专业相关学生、对计算机感兴趣的学生、及相关技术的从业人员等。对于相关专业的学生来说，学习好编译原理这门课，不但可以理解和掌握编译编译课程本身，而且对于其他相关课程的学习也会有很好的帮助。而对于计算机相关技术的从业人员，学习编译原理相关知识，不但可以深刻理解程序设计语言的设计和实现原理，而且在工作中往往要设计新的领域专用语言及其编译器，因此，这部分知识也是必须的。'),(6,'计算机网络','计算机网络是当今社会信息化的基石，一直以来也是职业技能教育的重点课程之一。我们团队经过多年的研究，根据当今网络技术在中大型企业的实际应用，以及网络信息技术的快速发展趋势；在系统分析了传统网络课程的局限性，以及汇集多年中大型it企业工作经验、并在多年教育行业经验基础上所开发的重大创新课程，其创新性全面体现在课程视频的表现形式、内容的系统性与与时俱进，以及内容的实用性等方面。\n\n    当今社会企业信息化应用已全面迈向虚拟化与云计算阶段，为真实反映现今企业信息网络的技术全貌，我们对传统的计算机网络课程进行了重大革新：在内容方面除精炼传统的TCP/IP传输网络之外，对课程的表现形式也进行了重大创新：包括对内容进行分节阐述、所有的知识点都以精美视频与精致图形的方式呈现，大大降低了课程学习的难度与枯燥性，使学习者能够轻松掌握所学知识；另外我们还对传统的计算机网络课程进行了整体梳理，摈弃了过时与非实用性的纯学术性理论知识，系统增加了internet接入网技术与电信传输网技术，以力图使学员全面了解计算机网络的传输技术全貌。精致、系统、实用、紧贴企业实际应用是我们的目标！'),(7,'数据库原理与应用','数据库系统已经成为现代信息系统的核心和基础设施。数据库的建设规模和性能、数据库信息量的大小和使用频度已经成为衡量一个国家信息化程序的重要标志。学习“数据库原理及应用 ”可以帮助你更好地使用数据库，设计适合你需要的数据库应用系统，并进一步科学地管理好数据库系统。'),(8,'人工智能','人工智能可分为强人工智能及弱人工智能。强人工智能著重于模拟人类智能，而弱人工智能则著重于类似智能的应用表现。达成智能的表现有许多方法，其中一种快速有效的方法即为搜寻，也是这门课的重点。本课程将给予人工智能一般性的介绍，并且深入探索三种常用的搜寻：不利用问题特性的uninformed search，使用问题特性的informed search，及针对零和对局的adversarial search。课程中除了讲解各种搜寻的技术之外，也会同时探讨它们的优缺点及应用范围，使同学易于应用其相关技术。'),(9,'计算机图形学','计算机图形学是近30年来发展迅速、应用广泛的新兴学科，是计算机科学最活跃的分支之一。如何在计算机中表示图形、以及利用计算机进行图形的计算、处理和显示的相关原理与算法，构成了其主要研究内容。在计算机辅助设计制造、科学计算可视化、地理信息系统、农林业等领域有着非常广泛的应用，是计算机、地理信息系统、电子工程、机械设计、建筑等本科专业一门重要的专业基础课，也是许多后续课程（图像处理、模式识别、多媒体技术、虚拟现实、计算机视觉等）的基础课程，在教学计划中占有重要地位和作用。虚拟现实被称为“下一代互联网”以及“下一代移动计算平台”，而计算机图形学是实现虚拟现实最重要的技术保证。');

create table `ots`.courseware
(
	id INT not null primary key,
	name VARCHAR(50) not null,
	content VARCHAR(1000) not null,
	path VARCHAR(200) not null,
	authorid INT not null,
	courseid INT not null,
	grade YEAR not null,
	time TIMESTAMP default CURRENT_TIMESTAMP not null
);

create table `ots`.article
(
	id INT not null primary key,
	name VARCHAR(50) not null,
	content VARCHAR(4000) not null,
	authorid INT not null,
	courseid INT not null,
	grade YEAR not null,
	time TIMESTAMP default CURRENT_TIMESTAMP not null
);

create table `ots`.message
(
	id INT not null primary key,
	name VARCHAR(50) not null,
	content VARCHAR(1000) not null,
	authorid INT not null,
	classid INT not null,
	grade YEAR not null,
	time TIMESTAMP default CURRENT_TIMESTAMP not null
);

create table `ots`.student
(
	id INT not null primary key,
	classid INT not null,
	name VARCHAR(20) not null,
	password VARCHAR(20) not null,
        email VARCHAR(30) not null,
	grade YEAR not null
);
insert into `ots`.student values(0,0,'student','123456','359558125@qq.com','2014');

create table `ots`.teacher
(
	id INT not null primary key,
	name VARCHAR(20) not null,
	password VARCHAR(20) not null,
        email VARCHAR(30) not null
);
insert into `ots`.teacher values(0,'teacher','123456','359558125@qq.com');

create table `ots`.admin
(
	id INT not null primary key,
	name VARCHAR(20) not null,
	password VARCHAR(20) not null,
        email VARCHAR(30) not null
);

insert into `ots`.admin values(0,'admin','123456','359558125@qq.com');
