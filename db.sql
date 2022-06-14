-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: news_project
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `interaction`
--

DROP TABLE IF EXISTS `interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interaction` (
  `news_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `comments` varchar(800) DEFAULT NULL,
  `commented_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`comment_id`),
  KEY `news_id` (`news_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `interaction_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`) ON DELETE SET NULL,
  CONSTRAINT `interaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaction`
--

LOCK TABLES `interaction` WRITE;
/*!40000 ALTER TABLE `interaction` DISABLE KEYS */;
INSERT INTO `interaction` VALUES (NULL,16,'Nice Sand Worm','2022-06-08 19:27:54',13),(NULL,16,'Lady Jessica right there','2022-06-08 19:28:23',14),(NULL,4,'spice mutant !!','2022-06-08 19:28:55',15),(NULL,4,'dogs of the world unite','2022-06-08 19:29:31',16),(NULL,12,'Shai Hulud','2022-06-08 19:36:30',17),(NULL,12,'confused Limmy','2022-06-08 19:36:40',18),(NULL,16,'adasd\r\n','2022-06-09 14:23:23',20),(43,11,'my laptop is way better ','2022-06-09 21:49:01',21),(NULL,11,'Nooiceeeee ','2022-06-09 21:49:17',22),(45,11,'Android rules !!!','2022-06-09 21:49:46',23),(39,11,'Don\'t give up Chad','2022-06-09 21:50:08',24),(43,10,'new techs are pretty dope','2022-06-09 21:50:53',25),(NULL,10,'alrighty ...!','2022-06-09 21:52:44',26),(44,10,'no one cares','2022-06-09 21:53:03',27),(38,10,'cringe alert !','2022-06-09 21:53:23',28),(36,10,'who the hell watch golf match','2022-06-09 21:53:42',29),(41,10,'Indonesia &#129470;','2022-06-09 21:55:26',30),(NULL,10,'cute doggo right there <3','2022-06-09 21:55:47',31),(35,14,'China is rising','2022-06-09 21:57:12',32),(NULL,14,'you are all perverts','2022-06-09 21:57:24',33),(38,14,'fighting ...!','2022-06-09 21:57:41',34),(NULL,14,'thank you !!','2022-06-09 21:57:54',35),(39,13,'Then give up, clown','2022-06-09 22:00:24',36),(36,13,'golf is boring tho','2022-06-09 22:00:44',37),(45,13,'Apple <3','2022-06-09 22:01:01',38);
/*!40000 ALTER TABLE `interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `news_id` bigint NOT NULL AUTO_INCREMENT,
  `news_name` varchar(200) DEFAULT NULL,
  `descriptions` varchar(8000) DEFAULT NULL,
  `news_img` varchar(200) DEFAULT NULL,
  `news_location` varchar(200) DEFAULT NULL,
  `news_category` int NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_id` bigint DEFAULT NULL,
  `news_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  KEY `news_category` (`news_category`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`news_category`) REFERENCES `news_category` (`news_category_id`),
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `user_account` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (35,'The new light-based quantum computer','Employing a process called boson sampling, Jiuzhang generates a distribution of numbers that is exceedingly difficult for a classical computer to replicate. Here?s how it works: Photons are first sent into a network of channels. There, each photon encounters a series of beam splitters, each of which sends the photon down two paths simultaneously, in what?s called a quantum superposition. Paths also merge together, and the repeated splitting and merging causes the photons to interfere with one another according to quantum rules.\r\n\r\nFinally, the number of photons in each of the network?s output channels is measured at the end. When repeated many times, this process produces a distribution of numbers based on how many photons were found in each output.\r\n\r\nIf operated with large numbers of photons and many channels, the quantum computer will produce a distribution of numbers that is too complex for a classical computer to calculate. In the new experiment, up to 76 photons traversed a network of 100 channels. For one of the world?s most powerful classical computers, the Chinese supercomputer Sunway TaihuLight, predicting the results that the quantum computer would get for anything beyond about 40 photons was intractable.\r\n\r\nWhile Google was the first to break the quantum supremacy barrier, the milestone is ?not a single-shot achievement,? says study coauthor and quantum physicist Chao-Yang Lu of the University of Science and Technology of China in Hefei. ?It?s a continuous competition between constantly improved quantum hardware and constantly improved classical simulation.? After Google?s quantum supremacy claim, for example, IBM proposed a type of calculation that might allow a supercomputer to perform the task Google?s computer completed, at least theoretically.','quantum_computer.jpg','China',11,'2022-06-13 21:12:28','2022-06-14 18:22:50',16,NULL),(36,'McIlroy warns LIV jumpers there are some things money can\'t buy','TORONTO: For Rory McIlroy having his name on a trophy is more meaningful than seeing it on a cheque and he offered a warning to golfers chasing a big pay day with the LIV Invitational Golf Series that doing anything purely for money usually does not end well.\r\n\r\nThe Saudi-backed venture which is looking to shake up golf\'s status quo launches this weekend at the Centurion Club just outside London with super-sized purses that dwarf the PGA Tour stop this week, the Canadian Open.\r\n\r\nThe first of eight events that will offer up purses totalling $255 million, the Centurion will pay out $25 million, almost triple the Canadian Open\'s $8.7 million.\r\n\r\nIf those figures aren\'t startling enough then the astronomical sums dangled in front of golf\'s biggest names in effort to lure them away from the PGA Tour are eye-popping.\r\n\r\nLIV Golf CEO Greg Norman told the Washington Post that Tiger Woods turned down an offer that was \"mind-blowingly enormous\" in the high nine figures while other reports had golf great Jack Nicklaus turning down an offer worth more than US$100 million to be the face of the series.\r\n\r\nBut for others the Saudi money was an offer they could not refuse, with six-times major winner Phil Mickelson, according to media reports, getting a US$200 million appearance deal and Dustin Johnson US$125 million.\r\n\r\n\"Any decision that you make in your life that\'s purely for money usually doesn\'t end up going the right way,\" said McIlroy on Wednesday as he prepared to open the defence of his Canadian Open title.\r\n\r\n\"Obviously, money is a deciding factor in a lot of things in this world, but if it\'s purely for money it\'s not, it never seems to go the way you want it to.\"\r\n\r\nOf course, with nearly US$63 million in career earnings and millions more in endorsements the Northern Irishman can well afford to not simply do things by the numbers.\r\n\r\nFor McIlroy, who needs a Masters Green Jacket to complete the career Grand Slam of winning all four majors, his decision to remain loyal to the PGA Tour lies with his legacy and quality of life.\r\n\r\n\"Most of the oldest events in our game are National Opens and I\'ve been very fortunate enough to win quite a few, here, Irish Open, US Open, Australian Open,\" McIlroy said.\r\n\r\n\"You\'re putting your name in history by winning these national championships and that\'s something that money can\'t buy.\"','golf.jpg','Canada',14,'2022-06-13 21:17:49','2022-06-13 17:47:44',16,NULL),(38,'Teenager\'s Photo In Front Of Bombed School Moves Internet','The post has been shared by a woman Oleksandra Matviichuk, the head of the Center for Civil Liberties, Ukraine on Twitter. She has also received Democracy Defender Award of OSCE 2016.\r\n\r\nThe post says: \"Anna Episheva: My niece was supposed to graduate this year from her high school. She and her friends bought dresses and were looking forward to this day. Then Russians came. Her school was directly hit and destroyed. Today she came back to what is left of her school and her plans.\"\r\n\r\nOn Twitter, the post has already received over 42,000 likes, and people from all around the world have left comments in the comment section.\r\n\r\n\"With or without a war, Ukrainian women are beautiful,\" a user wrote.\r\n\r\nWhile another said, \"It shows that the Ukrainians are tough and unbreakable. How can Putin win against these people?\"\r\n\r\n\"Such an incredible image. The courage of Ukrainians is unbelievable,\" wrote a third user.\r\n\r\nAs the war continues, United Nations chief Antonio Guterres said Wednesday that the consequences for the world of Russia\'s invasion of Ukraine are worsening, with 1.6 billion people likely to be affected.','girl.webp','Ukraine',16,'2022-06-13 21:25:13','2022-06-13 17:47:44',16,NULL),(39,'Millions Could Starve If Russian Blockade Is Not Lifted','Zelensky said in a televised statement the world was on the brink of a \"terrible food crisis\", with Ukraine unable to export large amounts of wheat, corn, oil and other products that had played a \"stabilising role in the global market\".\r\n\r\n\"This means that, unfortunately, there may be a physical shortage of products in dozens of countries around the world. Millions of people may starve if the Russian blockade of the Black Sea continues,\" he said.\r\n\r\nRussia has seized large parts of Ukraine\'s coast in nearly 15 weeks of war and its warships control the Black and Azov Seas, blocking Ukraine\'s farm exports and driving up the cost of grain.\r\n\r\nUkraine and the West accuse Moscow of weaponising food supplies. Russia says Ukrainian mines laid at sea and international sanctions on Moscow are to blame.\r\n\r\nBlaming Russia for the blockade, Zelensky said that \"while we are looking for ways to protect freedom, another person is destroying it. Another person continues to blackmail the world with hunger.\"\r\n\r\nUkraine exported up to 6 million tonnes of grain a month before Russia launched its invasion on Feb. 24. Moscow calls its action a special military operation.\r\n\r\nVolumes have since fallen to about 1 million tonnes as Ukraine, which used to export most of its goods through seaports, has been forced to transport grain by train via its western border or via its small Danube river ports.','that_one_ukraine_dude.jpg','Ukraine',16,'2022-06-13 21:26:50','2022-06-13 17:47:44',16,NULL),(41,'Siloam Hospitals Group\'s digital transformation journey','Siloam Hospitals Group\'s CEO Caroline Riady presented its digital transformation journey during the HIMSS Indonesian Digital Transformation Symposium on 25 May 2022 in Jakarta.\r\n\r\nThe group is one of Indonesia\'s leading healthcare providers. It operates 41 hospitals nationwide, some of which are in the eastern regions of Bali, East Nusa Tenggara, West Nusa Tenggara and Sulawesi. It had just four hospitals in 2010.\r\n\r\n\"[In 2016] we had not done digital transformation [yet], we had 26 hospitals with 16 different IT systems. With those 16 different IT systems, two out of those 16 were still DOS-based,\" Riady told the symposium.\r\n\r\n\"Very, very painful process\"\r\n\r\nAccording to Riady, the group began its digitisation process in 2016.\r\n\r\nThe group had to standardise more than a dozen IT systems and develop a single hospital information, financial and patient appointment system as the group\'s foundation.\r\n\r\nShe said the hospital group did not undergo user acceptance testing for some features but did it directly in a live environment. The billing � within its hospital information system � would only stabilise three months later. The group then had to do the same for 25 other hospitals.\r\n\r\n\"It was a very, very painful process � After the first hospital, we finally completed the last hospital\'s [standardisation] three years later,\" she told the symposium.\r\n\r\n\"But the good news: our future systems are a bit smarter, so [data] migration can be faster [and] people are more used to it.\"\r\n\r\nFurther digitisation\r\n\r\nRiady said the group also worked on its ERP; the process finished last year. However, it then saw an \"end of support\" notice.\r\n\r\n\"If looking for a vendor, ask [when] the end of support is. Do not ask [about] it once finished,\" she said.\r\n\r\nRiady said the digital transformation would cover the patient appointment, EMR, teleconsultation, human resources, doctors\' clinical governance and CPOE aspects. The group also worked on a single queue system, streamlining patient queues from doctor consultations to pharmacies and laboratories.\r\n\r\nFinally, Riady said the final phase would be innovation as the hospital group would utilise technology and AI to enhance services and patient care.\r\n\r\nShe said the broader transformation process and digitisation had benefited the hospital group. One was online and offline seamlessness, whereas a patient could book a laboratory appointment online and have an offline medicine delivery without any hassle. It also allowed more open patient access and enabled the group to manage its operations using data more.\r\n\r\nHIMSS\' support\r\n\r\nRiady was \"very happy\" with HIMSS\' support for \"giving a structure, standards and benchmark of what should be done\", noting how Pondok Indah Hospital Group had achieved EMRAM Stage 6 in March � becoming the first Indonesian healthcare provider to do so.\r\n\r\n\"If [standards have been adopted] abroad, why should we trial and error again? We will just adopt them,\" she told the symposium.\r\n\r\n\"Unfortunately, Siloam is just at the very beginning, so it is hard for me to tell you what it will be like. But I am sure, later within a year, we will start to see the benefits that other hospitals have seen.\"\r\n','indo_girl_with_mic.jpg','Indonesia',13,'2022-06-02 21:30:47','2022-06-09 21:46:57',16,NULL),(42,'RMIT University launches digital health hub','The Royal Melbourne Institute of Technology or RMIT University has opened a hub to drive digital health innovation in Australia and beyond.\r\n\r\nThe RMIT Digital Health Hub seeks to bring advanced digital health research and expertise from RMIT to the health sector with the view of transforming healthcare delivery and improving health outcomes.\r\n\r\nIt was launched in partnership with ANDHealth, a digital health commercialisation organisation, and the federal government-backed Digital Health Cooperative Research Centre.\r\n\r\nWHY IT MATTERS\r\n\r\nThe digital health hub was launched to help bring the stakeholders of the health ecosystem together to solve unmet needs \"from virtual care and artificial intelligence to diagnostic and monitoring wearables and sensors\".\r\n\r\nIt is envisioned to be an \"epicentre for transdisciplinary research\" with capabilities across engineering, data science, information technology, health and biomedical sciences, design and social sciences and business and law. \r\n\r\nAside from research, the hub is also focused on promoting the digital capabilities of the healthcare workforce by offering training via RMIT Online, including short courses and postgraduate training.\r\n\r\nTHE LARGER TREND\r\n\r\nThe RMIT Digital Health Hub has been involved in an international programme for people with lower limb amputation, physical disability, and associated mental health concerns in developing countries within the Asia-Pacific region. The project, which is being delivered through RMIT\'s digital learning platforms and face-to-face training, was launched in Indonesia last month, and is set to be conducted in Cambodia and Timor-Leste soon.\r\n\r\nThe hub, through RMIT Europe, is also supporting a research project in the European Union that is creating a digital health literacy strategy to promote the adoption of digital technologies among European consumers.\r\n\r\nON THE RECORD\r\n\r\n\"The COVID-19 pandemic has resulted in a rapid acceleration of innovations in the health sector, but it is just the beginning. It takes a multi-sectoral approach to co-designing solutions to today�s health and care problems and the Digital Health Hub will play a key role in the development, testing, and implementation of new innovations to support citizen health and wellness goals in the home and the community,\" said RMIT Digital Health Hub Director Kerryn Butler-Henderson.','weird_thingy.jpg','Australia',13,'2022-06-09 21:32:23','2022-06-09 21:32:23',16,NULL),(43,'The world�s fastest supercomputer','The first exascale computer has officially arrived.\r\n\r\nThe world�s fastest supercomputer performed more than a quintillion calculations per second, entering the realm of exascale computing. That�s according to a ranking of the world�s speediest supercomputers called the TOP500, announced on May 30. The computer, known as Frontier, is the first exascale computer to be included on the biannual list.\r\n\r\nExascale computing is expected to allow for new advances in a variety of scientific fields that depend on vastly complex calculations. The exascale milestone �represents an unprecedented capability for researchers around the world to use the computer to ask their specific scientific questions,� says Frontier�s project director Justin Whitt of Oak Ridge National Laboratory in Tennessee.\r\n\r\nOak Ridge�s Frontier clocked in at about 1.1 exaflops, or 1.1 quintillion operations per second. Frontier beat out the previous record-holder, a supercomputer called Fugaku at the RIKEN Center for Computational Science in Kobe, Japan, which achieved more than 0.4 exaflops.\r\n\r\nWhile tentative reports have suggested that some Chinese supercomputers are already achieving exascale performance, they have not been reported on the TOP500 ranking so far.\r\n\r\nAfter about three years of development, Frontier will be ready for scientists to begin using it at the end of 2022. With its new exascale capability, researchers aim to simulate how stars explode, calculate the properties of subatomic particles, investigate new energy sources such as nuclear fusion and harness artificial intelligence to improve the diagnosis and prevention of disease, among many other research topics.','super_computer.jpg','Oak Ridge',11,'2022-06-09 21:36:36','2022-06-09 21:36:36',16,NULL),(44,'Real Madrid injury','Jonathan Woodgate played for Real Madrid and England, managed his hometown club Middlesbrough and has had a career that is the envy of millions. But he has been no stranger to criticism either.\r\n\r\nHis Real Madrid debut is the stuff of a legend. Due to injury, it came over a year after he had signed for the club and did not go to plan. He scored an own goal and was then sent off. That particular day in September 2005 is one that he is able to laugh off.\r\n\r\n\"People always ask me about my debut and how bad it was,\" Woodgate tells Sky Sports. \"I always ask them how their Real Madrid debut went. That is my answer to that one. I wasn\'t bothered in the slightest because I was playing for the biggest team in the world.\"\r\n\r\nNow 42, there is still an air of defiance in his responses. But speaking ahead of the launch of the second series of the Under the Surface podcast with menswear brand Original Penguin and CALM - the Campaign Against Living Miserably - there is greater awareness too.\r\n\r\nThose injuries, for example, left their mark on him.\r\n\r\n\"At the time, you don\'t know you are really struggling,\" he explains.\r\n\r\n\"Nobody ever knew it was called mental health. You would just be called soft.','jonathan.jpg','Spain',14,'2022-06-09 21:40:06','2022-06-09 21:40:06',16,NULL),(45,'Apple will hold its mixed reality headset event in January','Last month, Kuo warned excited Apple fans not to expect the much-anticipated mixed reality headset at this year�s Worldwide Developer Conference (WWDC). Indeed, the headset was a no-show at Apple�s big annual event.\r\n\r\nKuo said at the time that Apple wouldn�t want to prematurely announce the headset as �competitors will immediately kick off copycat projects and happily copy Apple�s excellent ideas, and hit the store shelves before Apple launches in 2023.�\r\n\r\nWhether rivals would be in a position to copy Apple�s hardware and OS � and subsequently manufacture enough to launch in the coming months � is questionable. Apple, with all its weight, is said to be struggling from the same chip shortages and other supply chain issues that are impacting the whole industry.\r\n\r\nKuo himself recently highlighted that competitors are expected to be around 2-3 years behind Apple.\r\n\r\n�At present, the largest chip supplier of AR/VR headsets is Qualcomm, and its mainstream solution XR2 has a computing power of mobile phone level,� explains Kuo.\r\n\r\nApple�s headset is set to feature a three-display configuration (with two Micro OLED panels and one AMOLED), and more than 10 sensors (including cameras) for advanced environment and gesture detection. It should support a seamless transition between VR and AR.\r\n\r\nThe company is said to be setting low sales expectations for the first iteration of its headset due to its expected high cost�which is estimated to be around $3,000. Apple is said to only expect to sell around one headset per Apple Store per day.\r\n\r\nKuo expects future growth will be driven by �a more affordable second generation�.','apple.jpg','United State',11,'2022-06-07 21:45:58','2022-06-09 21:47:17',16,NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_category`
--

DROP TABLE IF EXISTS `news_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_category` (
  `news_category_id` int NOT NULL AUTO_INCREMENT,
  `news_category_name` varchar(200) NOT NULL,
  PRIMARY KEY (`news_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_category`
--

LOCK TABLES `news_category` WRITE;
/*!40000 ALTER TABLE `news_category` DISABLE KEYS */;
INSERT INTO `news_category` VALUES (11,'Science'),(13,'Health & Medicine'),(14,'Sport & Leisure'),(15,'Lifestyle'),(16,'International');
/*!40000 ALTER TABLE `news_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `user_role` int DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `user_status` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_role` (`user_role`),
  CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`user_role`) REFERENCES `user_role` (`user_role_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (1,'joey',1,'joey@gmail.com','iLovePizza',0),(2,'sheldon',1,'sheldon@gmail.com','iLovePhysics',0),(3,'leonard',3,'leonard@gmail.com','iLovePenny',1),(4,'ahkar',2,'ahkar@gmail.com','ahkar',0),(10,'gollum',3,'gollum@gmail.com','gollum',0),(11,'zoey',3,'zoey@gmail.com','hello',0),(12,'toe',3,'toe@gmail.com','toe',0),(13,'theingi',3,'theingi@gmail.com','theingi',0),(14,'maw',3,'maw@gmail.com','maw',0),(16,'asdf',1,'asdf@gmail.com','asdf',0);
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` int NOT NULL AUTO_INCREMENT,
  `user_role_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'admin'),(2,'reporter'),(3,'user');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-14 18:43:27
