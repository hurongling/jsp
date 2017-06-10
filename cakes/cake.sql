create database cake;
use cake;

/* 
 * TABLE: account,客服id，客服登录名，姓名，密码
 */

CREATE TABLE account(
    aid       int             auto_increment,
    alogin    varchar(20)    NOT NULL,
    aname     char(10)    NULL,
    apass     varchar(20)    NULL,
    CONSTRAINT PK_aid PRIMARY KEY NONCLUSTERED (aid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* 
 * TABLE: category 类别表
 */

CREATE TABLE category(
    cid      int             auto_increment,
    ctype    char(20)    NOT NULL,
    chot     tinyint(1)             DEFAULT 0 NULL,
    aid      int             NOT NULL,
    CONSTRAINT PK_cid PRIMARY KEY NONCLUSTERED (cid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* 
 * TABLE: forder 订单主表，订单时间，产品总价，收货人，联系电话，留言，邮箱，邮编
 */

CREATE TABLE forder(
    fid        int             auto_increment,
    fdate      datetime        DEFAULT NOW() NOT NULL,
    ftotal     float(9,2)    NOT NULL,
    fname      varchar(20)    NOT NULL,
    fphone     varchar(20)    NOT NULL,
    fremark    varchar(50)    NOT NULL,
    femail     varchar(20)    NOT NULL,
    fpost      varchar(10)    NOT NULL,
    uid        int             NOT NULL,
    aid        int             NULL,
    stid        int             NOT NULL,
    CONSTRAINT PK_fid PRIMARY KEY NONCLUSTERED (fid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* 
 * TABLE: goods 商品表
 */

CREATE TABLE goods(
    gid           int                 auto_increment,
    gname         varchar(20)        NOT NULL,
    gprice        float(9,2)         NOT NULL,
    gpic          varchar(100)       NOT NULL,
    gremark       varchar(500)       NOT NULL,
    gxremark      varchar(1000)      NULL,
    gdate         datetime            DEFAULT NOW() NOT NULL,
    giscommend    tinyint(1)                 DEFAULT 0 NOT NULL,
    gisopen       tinyint(1)                 DEFAULT 1 NOT NULL,
    cid           int                 NOT NULL,
    CONSTRAINT PK_gid PRIMARY KEY NONCLUSTERED (gid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* 
 * TABLE: sorder 订单子表，gid外键用来判断重复购物项
 */

CREATE TABLE sorder(
    sid        int             auto_increment,
    sname      varchar(20)    NULL,
    sprice     float           NULL,
    snumber    int             NULL,
    fid        int             NOT NULL,
    gid        int             NOT NULL,    
    CONSTRAINT PK_sid PRIMARY KEY NONCLUSTERED (sid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* 
 * TABLE: status 订单状态表
 */

CREATE TABLE status(
    stid       int             auto_increment,
    status    varchar(20)    NOT NULL,
    CONSTRAINT PK_stid PRIMARY KEY NONCLUSTERED (stid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* 
 * TABLE: users 用户表
 */

CREATE TABLE users(
    uid         int            auto_increment,
    ulogin      varchar(20)    NOT NULL,
    uname       varchar(20)    NOT NULL,
    upass       varchar(20)    NOT NULL,
    usex        varchar(2)     NOT NULL,
    uphone      varchar(20)    NULL,
    upost       varchar(20)    NULL,
    uemail      varchar(20)    NULL,
    uaddress    varchar(20)    NULL,
    CONSTRAINT PK_uid PRIMARY KEY NONCLUSTERED (uid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* 
 * INDEX: Re_category_aid
 */

CREATE INDEX Rc_aid ON category(aid);

/* 
 * INDEX: Rf_uid
 */

CREATE INDEX Rf_uid ON forder(uid);


/* 
 * INDEX: Rf_aid 
 */

CREATE INDEX Rf_aid ON forder(aid);


/* 
 * INDEX: Rf_stid 
 */

CREATE INDEX Rf_stid  ON forder(stid);


/* 
 * INDEX: Rg_cid 
 */

CREATE INDEX Rg_cid ON goods(cid);


/* 
 * INDEX: Rs_fid 
 */

CREATE INDEX Rs_fid ON sorder(fid);


/* 
 * INDEX: Rs_gid
 */

CREATE INDEX Rs_gid ON sorder(gid);


/* 
 * TABLE: category 
 * ALTER TABLE `article`
 * ADD CONSTRAINT `fk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
 * --删除外键
 * ALTER TABLE article DROP FOREIGN KEY fk_1
 *
 */

ALTER TABLE category ADD CONSTRAINT fkc_aid 
    FOREIGN KEY (aid)
    REFERENCES account(aid);



/* 
 * TABLE: forder 
 */

ALTER TABLE forder ADD CONSTRAINT fkf_uid 
    FOREIGN KEY (uid)
    REFERENCES users(uid);

ALTER TABLE forder ADD CONSTRAINT fkf_aid
    FOREIGN KEY (aid)
    REFERENCES account(aid);

ALTER TABLE forder ADD CONSTRAINT fkf_stid
    FOREIGN KEY (stid)
    REFERENCES status(stid);


/* 
 * TABLE: goods 
 */

ALTER TABLE goods ADD CONSTRAINT fkg_cid
    FOREIGN KEY (cid)
    REFERENCES category(cid);


/* 
 * TABLE: sorder 
 */

ALTER TABLE sorder ADD CONSTRAINT fks_fid 
    FOREIGN KEY (fid)
    REFERENCES forder(fid);

ALTER TABLE sorder ADD CONSTRAINT fks_gid
    FOREIGN KEY (gid)
    REFERENCES goods(gid);


--测试用例

SELECT * FROM users;
INSERT INTO users VALUES (1,'u1','小红','u1','女','13202370639','510000','10000@qq.com','广东广州');
INSERT INTO users VALUES (2,'u2','小明','u2','男','15018236155','555222','10001@qq.com','中国北京');


SELECT * FROM account;
INSERT INTO account VALUES (1,'a1','小容','a1');
INSERT INTO account VALUES (2,'a2','小云','a2');


SELECT * FROM status;
INSERT INTO status VALUES (1,'未支付');
INSERT INTO status VALUES (2,'已支付');
INSERT INTO status VALUES (3,'废单');



SELECT * FROM category
INSERT INTO category VALUES (1,'水果蛋糕',1,1);    //原来是'true'现在是1，水果蛋糕是1，巧克力蛋糕是2
INSERT INTO category VALUES (2,'巧克力蛋糕',0,2);


SELECT * FROM goods;
INSERT INTO goods VALUES (1,'四季',188,'101.jpg','四季の','幸福的意义在于，它总是由不同的美好构成，正如你不知道下一口会有着怎样的惊喜',DEFAULT,1,1,1);   
//之前giscommend，gisopen是true
INSERT INTO goods VALUES (2,'鲜果阵地',188,'102.jpg','フルーツケーキ','简单的搭配水果装扮，一改传统的蛋糕的华丽外观，但却充满温馨的味道',DEFAULT,1,0,1);


SELECT * FROM forder;
INSERT INTO forder VALUES (1,getdate(),376,'小明','15018236155','蛋糕写小红生日快乐','10001@qq.com','555222',1,1,1);


SELECT * FROM sorder;
INSERT INTO sorder VALUES (1,'水果蛋糕',376,1,1,1);

