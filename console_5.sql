create table movie
(
    mov_id          integer primary key auto_increment,
    mov_title       char(50),
    mov_year        integer,
    mov_time        integer,
    mov_lang        char(50),
    mov_dt_rel      date,
    mov_rel_country char(5)
);
create table movie_cast
(
    act_id integer,
    mov_id integer,
    role   char(30),
    foreign key (act_id) references actor (act_id),
    foreign key (mov_id) references movie (mov_id)
);
create table reviewer
(
    rev_id   integer primary key auto_increment,
    rev_name char(30)
);
create table actor
(
    act_id     integer primary key auto_increment,
    act_fname  char(20),
    act_lname  char(20),
    act_gender char(1)
);
create table director
(
    dir_id    integer primary key auto_increment,
    dir_fname char(20),
    dir_lname char(20)
);
create table movie_direction
(
    dir_id integer,
    mov_id integer,
    foreign key (mov_id) references movie (mov_id),
    foreign key (dir_id) references director (dir_id)
);
create table genres
(
    gen_id    integer primary key auto_increment,
    gen_title char(20)
);
create table movie_genres
(
    mov_id integer,
    gen_id integer,
    foreign key (mov_id) references movie (mov_id),
    foreign key (gen_id) references genres (gen_id)
);
create table rating
(
    mov_id        integer,
    rev_id        integer,
    rev_stars     integer,
    num_o_ratings integer,
    foreign key (mov_id) references movie (mov_id),
    foreign key (rev_id) references reviewer (rev_id)
);

INSERT into movie(mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country)
values ('Harry Potter', 2004, 130, 'English', '2004-12-05', 'ENG'),
       ('American Beauty', 1997, 150, 'English', '1997-04-15', 'USA'),
       ('Save Private Bryan', 1998, 140, 'English', '1998-09-07', 'USA'),
       ('Harry Potter 2', 2005, 125, 'English', '2005-04-07', 'ENG'),
       ('Harry Potter 3', 2006, 154, 'English', '2006-04-07', 'ENG'),
       ('Harry Potter 4', 2007, 122, 'English', '2007-08-01', 'ENG'),
       ('Lord of the Rings', 2001, 160, 'English', '2001-01-02', 'USA'),
       ('Inseption', 2000, 180, 'English', '2011-02-11', 'USA'),
       ('THe Hobbit', 2014, 175, 'English', '2014-05-09', 'USA'),
       ('Eyes Wide Shut', 2013, 200, 'English', '2013-05-16', 'USA'),
       ('Brazzers the Movie', 1995, 152, 'English', '1995-05-30', 'USA');

insert into actor(act_fname, act_lname, act_gender)
values ('Tom','Cruise','M'),
       ('Jessica','Jones','F'),
       ('Seth', 'Rogan', 'M'),
       ('James','Franco','M'),
       ('Woody','Allen','M'),
       ('Mathias','Limbourg','M'),
       ('Brecht','Erkelbout','M'),
       ('Maarten','Reygaerts','M'),
       ('Hannes','DeBakker','M'),
       ('Sylvie', 'Verdomme','F'),
       ('Nona','Grotem','F');
insert into director(dir_fname, dir_lname)
values ('George','Clooney'),
       ('Maarten','Reygaerts'),
       ('Seth','Rogan'),
       ('Jennifer','Lawrence'),
       ('Miley','Cyrus'),
       ('Stephen','King'),
       ('Steven','Spielberg'),
       ('Stan','Lee'),
       ('Alex','Agnew'),
       ('Philip','Geubels');
Insert into movie_genres(mov_id, gen_id)
values (1,1),
       (2,2),
       (5,5),
       (3,3),
       (4,4),
       (6,6),
       (7,7),
       (8,8),
       (9,9),
       (10,10);
insert into reviewer(rev_name)
VALUES ('Marie'),
       ('Chance'),
       ('Jhon'),
       ('Larry'),
       ('Harry'),
       ('Lucas'),
       ('Thomas'),
       ('Gregory'),
       ('Philip'),
       ('Geofrey');

insert into genres(gen_title)
values ('Horror'),
       ('Romance'),
       ('Actie'),
       ('Adventure'),
       ('Drame'),
       ('Thriller'),
       ('Fantasy'),
       ('Future'),
       ('SciFi'),
       ('Porn');
insert into movie_direction(dir_id, mov_id)
values (1,10),
       (2,9),
       (3,8),
       (4,7),
       (5,6),
       (6,5),
       (7,4),
       (8,3),
       (9,2),
       (10,1);
insert into movie_cast(act_id, mov_id, role)
values (1,10,'Hoofdrol'),
       (2,9,'Moordenaar'),
       (3,8,'Huurmoordenaar'),
       (4,7,'Hoofdrol'),
       (5,6,'Zijrol'),
       (6,5,'Hoofdrol'),
       (7,4,'Hoofdrol'),
       (8,3,'Villain'),
       (9,2,'Hero'),
       (10,1,'Hoofdrol');

insert into rating(mov_id, rev_id, rev_stars, num_o_ratings)
values (1,2,8,3),
       (2,1,4,2),
       (3,8,7,1),
       (4,7,5,7),
       (5,2,8,3),
       (6,1,4,2),
       (7,8,7,1),
       (8,7,5,7),
       (9,7,2,4),
       (10,6,7,6);

#QUERIES TEST
#1
#schrijf een query om de naam en het jaar van de films te vinden:
select mov_title, mov_year
from movie;

#2
#Schrijf een query om het jaar te vinden waarin de film American Beauty uitkwam:
select mov_year
from movie
where mov_title like 'American Beauty';

#3
#Schrijf een query om de film te vinden die in 1999 is uitgebracht
select mov_title
from movie
where mov_year like 1999;

#4
#Schrijf een query om de films te vinden die voor 1998 zijn uitgebracht
select mov_title
from movie
where mov_year < 1998;

#5
#Schrijf een query om de naam van alle recensenten en de naam van films samen te voegen in een enkel lijst.
select concat(rev_name,' ',mov_title) as reviewer_en_movie
from reviewer r
inner join rating on rating.rev_id = r.rev_id
inner join movie m on m.mov_id = rating.mov_id;

#6
#Schrijf een query om de naam te vinden van alle reviewer (Movies?) die 7 of meer sterren op hun rating hebben:
select mov_title
from movie
inner join rating r on r.mov_id = movie.mov_id
where rev_stars>7;

#7
#Schrijf een query om de titels te vinden van alle films die geen rating hebben
select mov_title
from movie
inner join rating r on r.mov_id = movie.mov_id
where rev_stars = null;

#8
#Schrijf een query om de titels van de films met ID 5,7,9 te vinden
select mov_title
from movie
where mov_id = 5 or mov_id = 7 or mov_id = 9;

#9
#Schrijf een query om het ID-nummer te vinden van de acteur met de voornaam 'woody' en de achternaam 'allen'
select act_id
from actor
where act_fname like 'Woody' and act_lname like 'Allen';

#10
#Schrijf een query om de naam te vinden van de regisseur (voor-achternaam) die een film regisseerde die een rol heeft gespeeld voor 'Eyes wide shut'
select concat(dir_fname,'',dir_lname)
from
  ( select dir_id
     from movie_direction md
     inner join movie m on m.mov_id = md.mov_id
     where mov_title like 'Eyes Wide Shut'
     ) sub
where sub.dir_id = dir_id;




#11
#Schrijf een query om alle films die in het land buiten het verenigd koninkrijk zijn uitgebracht op te sommen
select mov_title
from movie
where mov_rel_country != 'ENG';

#12
#Schrijf een query om alle jaren te vinden die minstens één film hebben opgeleverd en die een beoordeling van meer dan 3 sterren hebben gekregen. Toon de resultaten in oplopende volgorde.
select mov_year
 from movie
  where mov_id in
        (
      select mov_id from rating where rev_stars>3
      )
  group by mov_year
  having count(mov_year)>1;

#13

#14
select movie.mov_title,max(r.rev_stars)
       from movie movie
inner join rating r on movie.mov_id = r.mov_id
group by r.mov_id
order by movie.mov_title;


#15
select act_fname,act_lname
from actor
where act_id in(
    select mc.act_id
    from actor
    inner join movie_cast mc on actor.act_id = mc.act_id
    inner join movie m on mc.mov_id = m.mov_id
    where mov_title like 'Annie Hall'
    )



