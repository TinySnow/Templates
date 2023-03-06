CREATE TABLE `collection`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '问题集 id',
  `title` varchar(255) NULL COMMENT '问题集标题',
  `author` varchar(255) NULL COMMENT '创建者，关联 user 的 id',
  `description` text NULL COMMENT '问题集描述',
  `created_time` datetime NULL COMMENT '创建时间',
  `updated_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更改时间，若无可为空',
  PRIMARY KEY (`id`)
);

CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论 id',
  `post` varchar(255) NOT NULL COMMENT '关联 question 的 id',
  `parent` varchar(255) NOT NULL COMMENT '父评论 id，关联 comment 的 id，若无则为 question 的一级评论',
  `author` varchar(255) NOT NULL COMMENT '关联 user 的 id',
  `content` longtext NULL COMMENT '内容',
  `upvote` int NULL COMMENT '点赞数',
  `devote` int NULL COMMENT '点踩数',
  `created_time` datetime NULL COMMENT '创建时间',
  `updated_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更改时间，若无可为空',
  `status` int NULL COMMENT '状态，是否可用',
  `is_top` tinyint(1) NULL COMMENT '置顶，即是否为最佳答案',
  PRIMARY KEY (`id`)
);

CREATE TABLE `post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '文章 id，唯一凭证',
  `author` varchar(255) NOT NULL COMMENT '作者，关联 user 的 id',
  `title` text NULL COMMENT '文章标题',
  `content` longtext NULL COMMENT '文章内容',
  `created_time` datetime NULL COMMENT '创建时间',
  `updated_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，若无更改可为空',
  PRIMARY KEY (`id`)
);

CREATE TABLE `question`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '问题 id，唯一凭证',
  `author` varchar(255) NOT NULL COMMENT '作者，关联 user 的 id',
  `title` text NULL COMMENT '文章标题',
  `content` longtext NULL COMMENT '文章内容',
  `best_answer` varchar(255) NULL COMMENT '最佳答案，关联 comment 的 id',
  `reward` int(0) NULL COMMENT '悬赏分数，标注最佳答案后进行事务性扣除',
  `created_time` datetime(0) NULL COMMENT '创建时间',
  `updated_time` datetime(0) NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间，若无更改可为空',
  PRIMARY KEY (`id`)
);

CREATE TABLE `tag`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标签 id',
  `label` varchar(255) NULL COMMENT '标签名称',
  PRIMARY KEY (`id`)
);

CREATE TABLE `tag_post_relation`  (
  `tag_id` int NOT NULL COMMENT '关联 tag 的 id',
  `post_id` bigint NOT NULL COMMENT '关联 post 的 id',
  PRIMARY KEY (`tag_id`, `post_id`)
);

CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `username` varchar(255) NULL DEFAULT 'user' COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码，加密',
  `avatar` varchar(255) NULL COMMENT '头像，链接存储',
  `email` varchar(255) NULL COMMENT '邮箱，唯一凭证',
  `gender` tinyint(1) NULL DEFAULT 1 COMMENT '性别，默认为 1，女性',
  `birthday` datetime(6) NULL COMMENT '生日，仅日期',
  `points` bigint NULL DEFAULT 0 COMMENT '助人点分数',
  `register_time` datetime NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
);

