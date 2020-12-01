create table polls
(
	id bigserial not null
		constraint polls_pkey
			primary key,
	created_at timestamp,
	updated_at timestamp,
	created_by bigint,
	updated_by bigint,
	expiration_date_time timestamp,
	question varchar(255)
);

alter table polls owner to db;

create table choices
(
	id bigserial not null
		constraint choices_pkey
			primary key,
	text varchar(255),
	poll_id bigint not null
		constraint fk1i68hpih40n447wqx4lpef6ot
			references polls
);

alter table choices owner to db;

create table roles
(
	id bigserial not null
		constraint roles_pkey
			primary key,
	name varchar(60)
		constraint uk_nb4h0p6txrmfc0xbrd1kglp9t
			unique
);

alter table roles owner to db;

create table users
(
	id bigserial not null
		constraint users_pkey
			primary key,
	created_at timestamp,
	updated_at timestamp,
	email varchar(255)
		constraint uk6dotkott2kjsp8vw4d0m25fb7
			unique,
	name varchar(255),
	password varchar(255),
	username varchar(255)
		constraint ukr43af9ap4edm43mmtq01oddj6
			unique
);

alter table users owner to db;

create table user_roles
(
	user_id bigint not null
		constraint fkhfh9dx7w3ubf1co1vdev94g3f
			references users,
	role_id bigint not null
		constraint fkh8ciramu9cc9q3qcqiv4ue8a6
			references roles,
	constraint user_roles_pkey
		primary key (user_id, role_id)
);

alter table user_roles owner to db;

create table votes
(
	id bigserial not null
		constraint votes_pkey
			primary key,
	created_at timestamp,
	updated_at timestamp,
	choice_id bigint not null
		constraint fkomskymhxde3qq9mcukyp1puio
			references choices,
	poll_id bigint not null
		constraint fk7trt3uyihr4g13hva9d31puxg
			references polls,
	user_id bigint not null
		constraint fkli4uj3ic2vypf5pialchj925e
			references users,
	constraint uk8um9h2wxsdjrgx3rjjwvny676
		unique (poll_id, user_id)
);

alter table votes owner to db;

