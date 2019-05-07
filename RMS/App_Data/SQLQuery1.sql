
--
-- Database: `rms_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE applications(
  ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  UID int NOT NULL,
  JID int NOT NULL
); 
-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE department (
  ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  name varchar(150) NOT NULL,
  hrManager int NOT NULL
);

--
-- Dumping data for table `department`
--

INSERT INTO department (name, hrManager) VALUES
('1', 1),
('1', 12);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE designation (
  ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  name varchar(100) NOT NULL,
  status varchar(20) NOT NULL CHECK (status IN('Available', 'Not Available', 'Obsolete', ''))
);

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE education (
  ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  UID int NOT NULL,
  degreeName int NOT NULL,
  instituteName varchar(100) NOT NULL,
  completionDate date NOT NULL,
  grade varchar(10) NOT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE experience (
  ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  UID int NOT NULL,
  jobSummary varchar NOT NULL,
  jobType varchar(20) NOT NULL CHECK (jobType IN('internship','partTime','contract','permanent')),
  jobDuration int NOT NULL,
  place varchar(150) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `interviews`
--

CREATE TABLE interviews (
  ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  UID int NOT NULL,
  JID int NOT NULL,
  scheduledTime date NOT NULL,
  happenedTime date DEFAULT NULL,
  status varchar(20) NOT NULL CHECK (status IN('waiting','accepted','rejected')),
  candidateResponse varchar(20) CHECK (candidateResponse IN('pending','accepted','rejected')),
  obtainedMarks int DEFAULT NULL
);
-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE jobs (
  ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  UID int NOT NULL,
  title varchar(255) NOT NULL,
  description text NOT NULL,
  designation int NOT NULL,
  department int NOT NULL,
  skills varchar(255) NOT NULL,
  office int NOT NULL,
  minEducation int DEFAULT NULL,
  minExperience int DEFAULT NULL,
  minAge int DEFAULT NULL,
  maxAge int DEFAULT NULL,
  gender varchar(10) NOT NULL CHECK (gender IN('any','male','female')),
  closingDate date NOT NULL,
  salary int NOT NULL,
  benefits varchar(255) DEFAULT NULL,
  detailsDocument varchar(255) DEFAULT NULL,
  status varchar(10) NOT NULL CHECK (status IN('open','closed')),
  duration int NOT NULL,
  type varchar(20) NOT NULL CHECK (type IN('internship','partTime','contract','permanent')),
  startDate date NOT NULL,
  endDate date NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE office (
  ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  city varchar(150) NOT NULL,
  hrManager int NOT NULL
); 
-- --------------------------------------------------------

--
-- Table structure for table `personaldetails`
--

CREATE TABLE personaldetails (
  ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  UID int NOT NULL,
  dataSize int NOT NULL,
  noOfJobsApplied int NOT NULL,
  lastUsed date NOT NULL,
  usageFrequency int NOT NULL,
  notifyDate date NOT NULL,
  image varchar(255) NOT NULL,
  DOB date NOT NULL,
  CNIC int NOT NULL,
  nationality varchar(50) NOT NULL,
  gender varchar(10) NOT NULL CHECK (gender IN('other','male','female')),
  contact1 varchar(50) NOT NULL,
  contact2 varchar(50) NOT NULL,
  address varchar(255) NOT NULL,
  city varchar(50) NOT NULL,
  country varchar(50) NOT NULL,
  objective text NOT NULL,
  departmentOfInterest int NOT NULL,
  fieldOfInterest int NOT NULL,
  joiningDate date NOT NULL,
  skills varchar(255) NOT NULL,
  extraActivities varchar(255) NOT NULL,
  otherInterests varchar(255) NOT NULL
); 
-- --------------------------------------------------------

--
-- Table structure for table `referenceslist`
--

CREATE TABLE referenceslist (
  ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  UID int NOT NULL,
  name varchar(50) NOT NULL,
  affiliation varchar(50) NOT NULL,
  contact varchar(50) NOT NULL,
  email varchar(255) NOT NULL
); 
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE users (
  ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Role varchar(20)  NOT NULL CHECK (Role IN('SuperAdmin','Admin','HRmanager','applicant')),
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  UserName varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(100) NOT NULL,
  SecurityQuestion varchar(255) NOT NULL,
  SecurityAnswer varchar(255) NOT NULL
); 
--
-- Dumping data for table `users`
--

INSERT INTO users (Role, FirstName, LastName, UserName, email, password, SecurityQuestion, SecurityAnswer) VALUES
('SuperAdmin', '1', '1', '1', '1', '1', 1, 1),
('SuperAdmin', '1', '1', '1', '1', '1', 1, 1),
('SuperAdmin', '1', '1', '1', '1', '1', 1, 1);




--
-- Constraints for dumped tables
--


ALTER TABLE department
  ADD CONSTRAINT department_ibfk_1 FOREIGN KEY (hrManager) REFERENCES users (ID);


ALTER TABLE office
  ADD CONSTRAINT office_ibfk_1 FOREIGN KEY (hrManager) REFERENCES users (ID);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
