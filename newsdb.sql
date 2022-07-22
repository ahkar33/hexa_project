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
-- Table structure for table `auth_users`
--

DROP TABLE IF EXISTS `auth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) DEFAULT NULL,
  `_token` bigint DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `auth_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`user_role_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_users`
--

LOCK TABLES `auth_users` WRITE;
/*!40000 ALTER TABLE `auth_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_users` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaction`
--

LOCK TABLES `interaction` WRITE;
/*!40000 ALTER TABLE `interaction` DISABLE KEYS */;
INSERT INTO `interaction` VALUES (89,23,'That\'s gonna kill node and deno','2022-07-21 20:07:15',81),(88,23,'RIP :\')','2022-07-21 20:07:31',82),(39,23,'Fighting ...!','2022-07-21 20:07:48',83),(89,25,'let\'s go ...!','2022-07-21 20:09:56',85),(84,25,'nice \n','2022-07-21 20:10:06',86);
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
  PRIMARY KEY (`news_id`),
  KEY `news_category` (`news_category`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`news_category`) REFERENCES `news_category` (`news_category_id`),
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `user_account` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (35,'The new light-based quantum computer','Employing a process called boson sampling, Jiuzhang generates a distribution of numbers that is exceedingly difficult for a classical computer to replicate. Here?s how it works: Photons are first sent into a network of channels. There, each photon encounters a series of beam splitters, each of which sends the photon down two paths simultaneously, in what?s called a quantum superposition. Paths also merge together, and the repeated splitting and merging causes the photons to interfere with one another according to quantum rules.\r\n\r\nFinally, the number of photons in each of the network?s output channels is measured at the end. When repeated many times, this process produces a distribution of numbers based on how many photons were found in each output.\r\n\r\nIf operated with large numbers of photons and many channels, the quantum computer will produce a distribution of numbers that is too complex for a classical computer to calculate. In the new experiment, up to 76 photons traversed a network of 100 channels. For one of the world?s most powerful classical computers, the Chinese supercomputer Sunway TaihuLight, predicting the results that the quantum computer would get for anything beyond about 40 photons was intractable.\r\n\r\nWhile Google was the first to break the quantum supremacy barrier, the milestone is ?not a single-shot achievement,? says study coauthor and quantum physicist Chao-Yang Lu of the University of Science and Technology of China in Hefei. ?It?s a continuous competition between constantly improved quantum hardware and constantly improved classical simulation.? After Google?s quantum supremacy claim, for example, IBM proposed a type of calculation that might allow a supercomputer to perform the task Google?s computer completed, at least theoretically.','quantum_computer.jpg','China',11,'2022-06-24 21:12:28','2022-06-24 09:22:49',16),(36,'McIlroy warns LIV jumpers there are some things money can\'t buy','TORONTO: For Rory McIlroy having his name on a trophy is more meaningful than seeing it on a cheque and he offered a warning to golfers chasing a big pay day with the LIV Invitational Golf Series that doing anything purely for money usually does not end well.\r\n\r\nThe Saudi-backed venture which is looking to shake up golf\'s status quo launches this weekend at the Centurion Club just outside London with super-sized purses that dwarf the PGA Tour stop this week, the Canadian Open.\r\n\r\nThe first of eight events that will offer up purses totalling $255 million, the Centurion will pay out $25 million, almost triple the Canadian Open\'s $8.7 million.\r\n\r\nIf those figures aren\'t startling enough then the astronomical sums dangled in front of golf\'s biggest names in effort to lure them away from the PGA Tour are eye-popping.\r\n\r\nLIV Golf CEO Greg Norman told the Washington Post that Tiger Woods turned down an offer that was \"mind-blowingly enormous\" in the high nine figures while other reports had golf great Jack Nicklaus turning down an offer worth more than US$100 million to be the face of the series.\r\n\r\nBut for others the Saudi money was an offer they could not refuse, with six-times major winner Phil Mickelson, according to media reports, getting a US$200 million appearance deal and Dustin Johnson US$125 million.\r\n\r\n\"Any decision that you make in your life that\'s purely for money usually doesn\'t end up going the right way,\" said McIlroy on Wednesday as he prepared to open the defence of his Canadian Open title.\r\n\r\n\"Obviously, money is a deciding factor in a lot of things in this world, but if it\'s purely for money it\'s not, it never seems to go the way you want it to.\"\r\n\r\nOf course, with nearly US$63 million in career earnings and millions more in endorsements the Northern Irishman can well afford to not simply do things by the numbers.\r\n\r\nFor McIlroy, who needs a Masters Green Jacket to complete the career Grand Slam of winning all four majors, his decision to remain loyal to the PGA Tour lies with his legacy and quality of life.\r\n\r\n\"Most of the oldest events in our game are National Opens and I\'ve been very fortunate enough to win quite a few, here, Irish Open, US Open, Australian Open,\" McIlroy said.\r\n\r\n\"You\'re putting your name in history by winning these national championships and that\'s something that money can\'t buy.\"','golf.jpg','Canada',14,'2022-06-24 21:17:49','2022-06-24 09:22:49',16),(38,'Teenager\'s Photo In Front Of Bombed School Moves Internet','The post has been shared by a woman Oleksandra Matviichuk, the head of the Center for Civil Liberties, Ukraine on Twitter. She has also received Democracy Defender Award of OSCE 2016.\r\n\r\nThe post says: \"Anna Episheva: My niece was supposed to graduate this year from her high school. She and her friends bought dresses and were looking forward to this day. Then Russians came. Her school was directly hit and destroyed. Today she came back to what is left of her school and her plans.\"\r\n\r\nOn Twitter, the post has already received over 42,000 likes, and people from all around the world have left comments in the comment section.\r\n\r\n\"With or without a war, Ukrainian women are beautiful,\" a user wrote.\r\n\r\nWhile another said, \"It shows that the Ukrainians are tough and unbreakable. How can Putin win against these people?\"\r\n\r\n\"Such an incredible image. The courage of Ukrainians is unbelievable,\" wrote a third user.\r\n\r\nAs the war continues, United Nations chief Antonio Guterres said Wednesday that the consequences for the world of Russia\'s invasion of Ukraine are worsening, with 1.6 billion people likely to be affected.','girl.webp','Ukraine',16,'2022-06-24 21:25:13','2022-06-24 09:22:49',16),(39,'Millions Could Starve If Russian Blockade Is Not Lifted','Zelensky said in a televised statement the world was on the brink of a \"terrible food crisis\", with Ukraine unable to export large amounts of wheat, corn, oil and other products that had played a \"stabilising role in the global market\".\r\n\r\n\"This means that, unfortunately, there may be a physical shortage of products in dozens of countries around the world. Millions of people may starve if the Russian blockade of the Black Sea continues,\" he said.\r\n\r\nRussia has seized large parts of Ukraine\'s coast in nearly 15 weeks of war and its warships control the Black and Azov Seas, blocking Ukraine\'s farm exports and driving up the cost of grain.\r\n\r\nUkraine and the West accuse Moscow of weaponising food supplies. Russia says Ukrainian mines laid at sea and international sanctions on Moscow are to blame.\r\n\r\nBlaming Russia for the blockade, Zelensky said that \"while we are looking for ways to protect freedom, another person is destroying it. Another person continues to blackmail the world with hunger.\"\r\n\r\nUkraine exported up to 6 million tonnes of grain a month before Russia launched its invasion on Feb. 24. Moscow calls its action a special military operation.\r\n\r\nVolumes have since fallen to about 1 million tonnes as Ukraine, which used to export most of its goods through seaports, has been forced to transport grain by train via its western border or via its small Danube river ports.','that_one_ukraine_dude.jpg','Ukraine',16,'2022-06-24 21:26:50','2022-06-24 09:22:49',16),(41,'Siloam Hospitals Group\'s digital transformation journey','\r\n Proin eget tincidunt velit. Vestibulum sed massa auctor, vulputate ante laoreet, ullamcorper augue. Quisque vel interdum enim. Praesent aliquam, augue a eleifend vehicula, elit ante gravida nisl, quis euismod metus mauris eu leo. Integer ultricies sem eget mauris viverra, sed facilisis dui facilisis. Donec tempor, leo sed vestibulum pellentesque, neque lacus facilisis felis, a pharetra est ligula in tellus. Phasellus ac auctor magna, et interdum arcu. Aenean aliquam varius sapien, in malesuada orci porta sit amet. Pellentesque ac ex eu neque pretium pellentesque ut ac lectus. Nam fringilla tristique ante. Donec ac arcu eget elit hendrerit scelerisque. Donec hendrerit metus sem, id tempor massa ornare sed. Fusce quis laoreet nibh, quis tincidunt justo.','indo_girl_with_mic.jpg','Indonesia',13,'2022-06-02 21:30:47','2022-06-24 12:42:46',16),(42,'RMIT University launches digital health hub','The Royal Melbourne Institute of Technology or RMIT University has opened a hub to drive digital health innovation in Australia and beyond.\r\n\r\nThe RMIT Digital Health Hub seeks to bring advanced digital health research and expertise from RMIT to the health sector with the view of transforming healthcare delivery and improving health outcomes.\r\n\r\nIt was launched in partnership with ANDHealth, a digital health commercialisation organisation, and the federal government-backed Digital Health Cooperative Research Centre.\r\n\r\nWHY IT MATTERS\r\n\r\nThe digital health hub was launched to help bring the stakeholders of the health ecosystem together to solve unmet needs \"from virtual care and artificial intelligence to diagnostic and monitoring wearables and sensors\".\r\n\r\nIt is envisioned to be an \"epicentre for transdisciplinary research\" with capabilities across engineering, data science, information technology, health and biomedical sciences, design and social sciences and business and law. \r\n\r\nAside from research, the hub is also focused on promoting the digital capabilities of the healthcare workforce by offering training via RMIT Online, including short courses and postgraduate training.\r\n\r\nTHE LARGER TREND\r\n\r\nThe RMIT Digital Health Hub has been involved in an international programme for people with lower limb amputation, physical disability, and associated mental health concerns in developing countries within the Asia-Pacific region. The project, which is being delivered through RMIT\'s digital learning platforms and face-to-face training, was launched in Indonesia last month, and is set to be conducted in Cambodia and Timor-Leste soon.\r\n\r\nThe hub, through RMIT Europe, is also supporting a research project in the European Union that is creating a digital health literacy strategy to promote the adoption of digital technologies among European consumers.\r\n\r\nON THE RECORD\r\n\r\n\"The COVID-19 pandemic has resulted in a rapid acceleration of innovations in the health sector, but it is just the beginning. It takes a multi-sectoral approach to co-designing solutions to today�s health and care problems and the Digital Health Hub will play a key role in the development, testing, and implementation of new innovations to support citizen health and wellness goals in the home and the community,\" said RMIT Digital Health Hub Director Kerryn Butler-Henderson.','weird_thingy.jpg','Australia',13,'2022-06-09 21:32:23','2022-06-09 21:32:23',16),(43,'The world\'s fastest supercomputer','The first exascale computer has officially arrived.\r\n\r\nThe world?s fastest supercomputer performed more than a quintillion calculations per second, entering the realm of exascale computing. That?s according to a ranking of the world?s speediest supercomputers called the TOP500, announced on May 30. The computer, known as Frontier, is the first exascale computer to be included on the biannual list.\r\n\r\nExascale computing is expected to allow for new advances in a variety of scientific fields that depend on vastly complex calculations. The exascale milestone ?represents an unprecedented capability for researchers around the world to use the computer to ask their specific scientific questions,? says Frontier?s project director Justin Whitt of Oak Ridge National Laboratory in Tennessee.\r\n\r\nOak Ridge?s Frontier clocked in at about 1.1 exaflops, or 1.1 quintillion operations per second. Frontier beat out the previous record-holder, a supercomputer called Fugaku at the RIKEN Center for Computational Science in Kobe, Japan, which achieved more than 0.4 exaflops.\r\n\r\nWhile tentative reports have suggested that some Chinese supercomputers are already achieving exascale performance, they have not been reported on the TOP500 ranking so far.\r\n\r\nAfter about three years of development, Frontier will be ready for scientists to begin using it at the end of 2022. With its new exascale capability, researchers aim to simulate how stars explode, calculate the properties of subatomic particles, investigate new energy sources such as nuclear fusion and harness artificial intelligence to improve the diagnosis and prevention of disease, among many other research topics.','super_computer.jpg','Oak Ridge',11,'2022-06-09 21:36:36','2022-06-15 13:30:21',16),(44,'Real Madrid injury','Jonathan Woodgate played for Real Madrid and England, managed his hometown club Middlesbrough and has had a career that is the envy of millions. But he has been no stranger to criticism either.\r\n\r\nHis Real Madrid debut is the stuff of a legend. Due to injury, it came over a year after he had signed for the club and did not go to plan. He scored an own goal and was then sent off. That particular day in September 2005 is one that he is able to laugh off.\r\n\r\n\"People always ask me about my debut and how bad it was,\" Woodgate tells Sky Sports. \"I always ask them how their Real Madrid debut went. That is my answer to that one. I wasn\'t bothered in the slightest because I was playing for the biggest team in the world.\"\r\n\r\nNow 42, there is still an air of defiance in his responses. But speaking ahead of the launch of the second series of the Under the Surface podcast with menswear brand Original Penguin and CALM - the Campaign Against Living Miserably - there is greater awareness too.\r\n\r\nThose injuries, for example, left their mark on him.\r\n\r\n\"At the time, you don\'t know you are really struggling,\" he explains.\r\n\r\n\"Nobody ever knew it was called mental health. You would just be called soft.','jonathan.jpg','Spain',14,'2022-06-09 21:40:06','2022-06-09 21:40:06',16),(45,'Apple will hold its mixed reality headset event in January','Last month, Kuo warned excited Apple fans not to expect the much-anticipated mixed reality headset at this year\'s Worldwide Developer Conference (WWDC). Indeed, the headset was a no-show at Apple\'s big annual event.\r\n\r\nKuo said at the time that Apple wouldn\'t want to prematurely announce the headset as ?competitors will immediately kick off copycat projects and happily copy Apple\'s excellent ideas, and hit the store shelves before Apple launches in 2023.?\r\n\r\nWhether rivals would be in a position to copy Apple\'s hardware and OS ? and subsequently manufacture enough to launch in the coming months  is questionable. Apple, with all its weight, is said to be struggling from the same chip shortages and other supply chain issues that are impacting the whole industry.\r\n\r\nKuo himself recently highlighted that competitors are expected to be around 2-3 years behind Apple.\r\n\r\nAt present, the largest chip supplier of AR/VR headsets is Qualcomm, and its mainstream solution XR2 has a computing power of mobile phone level, explains Kuo.\r\n\r\nApple\'s headset is set to feature a three-display configuration (with two Micro OLED panels and one AMOLED), and more than 10 sensors (including cameras) for advanced environment and gesture detection. It should support a seamless transition between VR and AR.\r\n\r\nThe company is said to be setting low sales expectations for the first iteration of its headset due to its expected high cost which is estimated to be around $3,000. Apple is said to only expect to sell around one headset per Apple Store per day.\r\n\r\nKuo expects future growth will be driven by ?a more affordable second generation?','apple.jpg','United State',11,'2022-06-07 21:45:58','2022-07-20 21:51:16',16),(54,'Netflix plans Squid Game reality show with big cash prize','Netflix Inc\'s most-watched series is no longer just a fictitious television show after the streaming service greenlit \"its biggest reality competition ever\" called Squid Game: The Challenge.\r\n\r\nUnlike the series where the stakes are life or death, the worst possible fate in this 456 player competition will be leaving without the US$4.56 million (S$6.35 million) winnings, which Netflix claims is the largest lump sum prize in reality TV history.\r\n\r\nSquid Game became Netflix\'s most-watched series when it was released in September 2021 as it told the story of cash-strapped contestants who play childhood games for a chance to win life-changing sums of money.\r\n\r\nThe first season holds the record as Netflix?s most popular series of all time, with more than 1.65 billion hours viewed in its first 28 days, the company said.\r\n\r\nThe 10-episode reality competition will include games inspired by the original show, as well as new additions, Netflix said.\r\n\r\nOne of YouTube?s top US creators, MrBeast, did an unofficial iteration of this idea by recreating aspects of the South Korean drama?s set and hosting games featured in the show, like ?Red Light, Green Light.? The YouTuber also opted out of the killing aspect but strapped a device to all 456 players that mimicked a bullet shot when a player was ruled out.\r\n\r\nNetflix?s reality show will be filmed in the UK and is currently only casting English speakers.','squid_game.jpg','South Korea',13,'2022-06-15 13:20:56','2022-06-19 22:54:37',4),(58,'Long COVID still a risk, even for vaccinated people','Al-Aly and his co-authors set out to confirm whether breakthrough SARS-CoV-2 infection (BTI) can also lead to long COVID complications among vaccinated people between one to six months after infection.\r\n\r\nThey studied data on almost 34,000 people with BTI, based on the U.S. Department of Veterans Affairs national healthcare records. The data spanned from January to October 2021.\r\n\r\nAn individual was considered to have a BTI by having tested positive for SARS-CoV-2 at 14 days after having received one dose of the Johnson & Johnson/Janssen vaccine or two doses of the Pfizer BioNTech or Moderna vaccines.\r\n\r\nThe team compared this information with that of almost 5 million people from the same healthcare database who did not develop COVID-19 during the same period. Almost 5 million people made up this contemporary control group.\r\nIn an interview with Medical News Today, Dr. Al-Aly explained that studying the control group helped ensure that the long COVID symptoms observed weren\'t due to undetected, pre-existing conditions.\r\n\r\nCompared to the control group, people who survived the first 30 days of a breakthrough infection were 1.75 times more likely to die than if they did not develop COVID-19.\r\n\r\nThose in the BTI group also had a greater risk of developing at least one post-acute disorder.\r\n\r\nHowever, results also confirmed that COVID-19 vaccines provide protection. When comparing BTI to unvaccinated individuals who had SARS-CoV-2 infections, the results indicated that COVID-19 vaccines can lower the risk of death by 34% and long COVID by 15%.','covid_at_risk.png','United State',13,'2022-06-12 13:53:47','2022-07-20 21:40:19',4),(59,'Anxiety in men: Fighting stereotypes','Anxiety disorders are among the most common mental health conditions worldwide. While they tend to affect women more than men, men are still widely affected. Due to differing social and biological factors, men\'s experiences of anxiety, from coping styles to treatment-seeking behaviors, differ from those of women.\r\nIn 2019, 301 million people around the world were living with an anxiety disorder, including 58 million children and adolescents. Estimates suggest Trusted Source that females are more affected than men; 23.4% of females have anxiety in a given year in the United States, and the same is true for 14.3% of males.\r\n\r\nWhile common in men, anxiety disorders have largely been overlooked in men\'s mental health literature, meaning there is little high-quality research on the subject.\r\n\r\nMedical News Today spoke with four experts in mental health on topics ranging from how anxiety expresses differently in men and women, to how men seek treatment, and what could improve the way they think about the condition and seek support.','man_anxiety.jpg','United State',13,'2022-06-13 13:55:29','2022-07-20 21:49:24',4),(61,'Why Liverpool made Uruguay forward their potential record signing','Darwin Nunez could not have wished for a better audition in front of soon-to-be-boss Jurgen Klopp than scoring twice against Liverpool in the Champions League quarter-final.\r\n\r\nThe 22-year-old got a goal in each leg as Benfica slipped to a 6-4 aggregate defeat, taking his tally to six in 10 games in the competition last season and helping convince the Premier League side to agree what could become a club-record ?85m deal for the Uruguay international, topping the ?75m paid for Virgil van Dijk in 2018.\r\n\r\nWith Sadio Mane looking set to move on, Klopp will continue the evolution of his forward line with a player who was coveted by some of the continent\'s biggest clubs despite having just completed only his second top-flight season in Europe.\r\n\r\nCompatriot Luis Suarez has been banging the drum for the youngster since he first joined Spanish second-tier side Almeria three years ago, but Barcelona\'s financial constraints meant they were unable to capitalise on the veteran striker\'s recommendation.\r\n\r\n\"I have 15 years of international experience, so I know a thing or two about forwards,\" recalled Suarez. \"And I told them, \'pay attention to this one, he\'s very good, he has very interesting things\'.\"\r\n\r\nInstead, it is another of Suarez\'s former clubs that look set to benefit from another emerging South American talent who honed his craft in Portugal, with the Reds having also signed Luis Diaz from Porto in January.','darwin.jpg','Uruguay',14,'2022-06-13 14:01:50','2022-07-04 21:02:17',4),(84,'Kyrgyzstan promotes its traditional mare\'s milk to lure tourists','The importance of kumis to Kyrgyz culture is demonstrated by the fact that the Central Asian former Soviet republic\'s capital, Bishkek, is named after a paddle used to churn the fermenting milk.\r\nKyrgyzstan is seeking to attract more tourists by promoting its traditional kumis fermented mare\'s milk ? which locals drink and bathe in and say is good for their health.\r\nThe importance of kumis to Kyrgyz culture is demonstrated by the fact that the Central Asian former Soviet republic\'s capital, Bishkek, is named after a paddle used to churn the fermenting milk.Through promotional films and festivals, Kyrgyzstan is encouraging tourists to experience the traditional nomadic Kyrgyz lifestyle by sleeping in a yurt in a lush mountain pasture close to the herds of horses which provide the milk.\r\nTourists can also drink fresh local milk, known as saamal, in the yurts.\r\n\r\n\r\n','kyrgyzstan.jpg','Kyrgyzstan',15,'2022-07-21 19:23:44','2022-07-21 19:47:25',22),(85,'Things diabetics must know before having pineapples','Pineapple is a healthy, tropical fruit that is rich in antioxidants, vitamins, and enzymes that help in boosting immunity and suppressing inflammation.\r\nDiabetes, a metabolic disorder, leads to an increase in the body\'s blood sugar levels. If left untreated, the medical condition can further affect various organs including the eyes, kidneys, and heart among others.\r\nAs such, those affected with diabetes are often advised dietary changes that include the elimination of certain foods and including some specific items to ensure the blood glucose levels are always maintained. This often leads to uncertainty about which vegetable, fruit, and grain diabetics can consume and which they should avoid. One such fruit is the pineapple.\r\nFruits are an excellent source of nutrients, including dietary fiber, vitamins, and minerals. However, people who are diabetic need to exercise restraint and avoid fruits that have a high glycemic index, said Dr Rajeev Gupta, Director-Internal Medicine and Diabetes, Max Super Speciality Hospital.He added that pineapple is a healthy, tropical fruit that is rich in antioxidants, vitamins, and enzymes that help in boosting immunity and suppressing inflammation. However, he said pineapple can affect blood sugar more than some other fruits. Thus, it must be consumed in moderation.','diabetics.jpg','United State',15,'2022-07-21 19:33:44','2022-07-21 19:34:57',22),(88,'Japan\'s ex-PM Shinzo Abe pale and lifeless','TOKYO: The moment he laid eyes on Shinzo Abe\'s ashen face, Shingo Nakaoka knew that any attempt to revive the former Japanese prime minister was likely to be in vain.\r\n\r\nBy the time the 64-year-old doctor had rushed to the scene from his nearby clinic within minutes of Abe\'s shooting on Jul 8, the stricken lawmaker\'s face was bloodless from deep gunshot wounds to the neck.\r\n\r\n\"What struck me immediately was just how pallid his face was,\" Nakaoka told Reuters by phone days after the assassination.\r\n\r\n\"When we massaged his heart, his body didn\'t twitch. He was barely conscious and he was just so pale, I knew immediately he was in critical danger.\"\r\n\r\nA physician at his namesake clinic, Nakaoka said he sprang into action when a patient who had been present when Abe was shot rushed in, panicked, shouting for him to come and help.\r\n\r\nWith his nurses, Nakaoka ran down the three flights of stairs and a short distance to the scene. Someone who appeared to be from Abe\'s entourage immediately handed him an automated external defibrillator (AED), but it did not turn on, he said.','shinzoabe.jpg','Japan',16,'2022-07-21 19:50:45','2022-07-22 11:27:26',24),(89,'Javascript Just Got Way Faster','First look at bun a fast new javascript runtime like node.js or deno. explore the core features of bun.js and how they might affect fullstack web developer. Bun : javascript just got way faster. # javascript # programming # webdev # discuss. Javascript just got way faster. 40 1 2022 07 07 03:32:03. 3 1 #javascript #firstlook #thecodereport &#128279; resources bun.js ann. Responsible & open scientific research from independent sources. Hey, this is interesting. it\'s always fun to have something new with faster speed and performance. gotta try this for sure ! #js #javascript #bun.\r\n#reactionthis video is cut out of a section of this stream youtu.be 2zsmo5urpk8?t=9127the original video by @fireship is here youtu.be fmhscn. Web3 hackathon 2022, win up to $1,750 worth of prizes and a lot of fun! we are on a quest to find the best talent to aid in laying the foundations! if you are a skilled developer looking to sharpen your skills and improve your craft with a sense of overcoming challenges then this is a great opportunity for you!. First look at bun a fast new javascript runtime like node.js or deno. explore the core features of bun.js and how they might affect fullstack web developers.','bunsj.jpg','United State',11,'2022-07-21 19:53:12','2022-07-21 19:53:12',24);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (4,'Ahkar',2,'ahkar@gmail.com','83b4356d3e33944a5bdb5052d731ded2d2418a1a765a81946f5a0a2a63931bc09b5f89e2a68273cb80e95a131868bc6b',0),(16,'ACE',1,'admin@gmail.com','83b4356d3e33944a5bdb5052d731ded2d2418a1a765a81946f5a0a2a63931bc09b5f89e2a68273cb80e95a131868bc6b',0),(22,'Chandler',2,'chandler@gmail.com','83b4356d3e33944a5bdb5052d731ded2d2418a1a765a81946f5a0a2a63931bc09b5f89e2a68273cb80e95a131868bc6b',0),(23,'Linda',3,'linda@gmail.com','83b4356d3e33944a5bdb5052d731ded2d2418a1a765a81946f5a0a2a63931bc09b5f89e2a68273cb80e95a131868bc6b',0),(24,'Sakura',2,'sakura@gmail.com','83b4356d3e33944a5bdb5052d731ded2d2418a1a765a81946f5a0a2a63931bc09b5f89e2a68273cb80e95a131868bc6b',0),(25,'Amy',3,'amy@gmail.com','83b4356d3e33944a5bdb5052d731ded2d2418a1a765a81946f5a0a2a63931bc09b5f89e2a68273cb80e95a131868bc6b',0);
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

-- Dump completed on 2022-07-22 11:45:08
