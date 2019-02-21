# exam-portal

<pre><font color="#0087FF">.</font>
├── README.md
├── <font color="#0087FF">static</font> 
│   ├── <font color="#0087FF">css</font> // this folder contains all css files
│   ├── <font color="#0087FF">js</font> // this folder contains all js files
│   └── <font color="#0087FF">php</font> // this folder contains all php files
└── <font color="#0087FF">templates</font> 
    ├── examinationPage.html
    ├── homePage.html
    ├── instructionPage.html
    ├── logoutPage.html
    ├── registrationPage.html
    └── resultPage.html
</pre>

## Configuring Apache Server

<pre>
1. /etc/init.d/apache2 [start/stop/restart](1)
2. To change the default document root i.e. /var/www/html/
   2.1) Edit - /etc/apache2/sites-available/000-default.conf
   2.2) If permission denied issue arises
        2.2.1) Go to - /etc/apache2/apache2.conf and add
        &lt;Directory yourDirectory&gt;
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
        &lt;/Directory&gt;
        near the place where such things are existing.
   2.3) To change the priority of files looked for
        edit this - /etc/apache2/mods-enabled/dir.conf - FCFS
3. To allow PHP in .html files
   3.1) Edit `/etc/apache2/apache2.conf`
   3.2) Add the following line: `AddHandler application/x-httpd-php .html`
</pre>

## MySQL

<pre>
    1. To create dump file - mysqldump -u username -p dbName > db_dump.sql
    2. To import dump file
        2.1) Create a db by that name
        2.2) mysql -u username -p -D dbName < db_dump.sql
</pre>

