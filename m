Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3156C2237
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 15:38:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA6EAC36B11
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 13:38:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08C99C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 13:38:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8UDbBcm032029; Mon, 30 Sep 2019 15:38:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=/wwFvw3X4VWY1vhUNfbaqwSe7F0b9r+b41nfkRDE3xk=;
 b=VIeZJyaOwxW+qITo6b397M6DH+5HXGZOE/oVHdeg/puJ9DEVdtWNMrEH+uea4R0zjeK6
 e3Bypk8f1JY9/Zt5kGHbEYQdDDIUdRGp7zvAj1XR0fQ1/NSxU5mkTcfdYkiYujKOCdjb
 E9WY+BLQMqUyJVranGVli5zsO5ScnDrf1MqmgGOFj10Kh3j9VKL/7NpT5yl8cXZx/0Hy
 kS1F5LNKCUMZtdrWPMdL3a/XhxG9LZHf5OgIKX0UhgDKfykkh7KWx/f1eu8ksib6uCt5
 pK1q42VwLCQY5aynQAMyFOqbau8JG3FM5ZJV95RdXlKkInBBud1AHlWXozbKyOLT7zZy IA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w9vkcvf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 30 Sep 2019 15:38:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9C63522;
 Mon, 30 Sep 2019 13:38:40 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 066402FF5F8;
 Mon, 30 Sep 2019 15:38:40 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep
 2019 15:38:40 +0200
Received: from localhost (10.201.21.107) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep 2019 15:38:39
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 30 Sep 2019 15:38:20 +0200
Message-ID: <20190930133832.11992-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930133832.11992-1-patrick.delaunay@st.com>
References: <20190930133832.11992-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_09:2019-09-25,2019-09-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [PATCH v2 04/16] dfu: prepare the support of multiple
	interface
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Split the function dfu_config_entities with 2 new functions
- dfu_alt_init
- dfu_alt_add

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 drivers/dfu/dfu.c | 51 ++++++++++++++++++++++++++++++++++++-----------
 include/dfu.h     |  2 ++
 2 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index e9db7f8d66..900a844d15 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -439,13 +439,12 @@ void dfu_free_entities(void)
 	alt_num_cnt = 0;
 }
 
-int dfu_config_entities(char *env, char *interface, char *devstr)
+int dfu_alt_init(int num, struct dfu_entity **dfu)
 {
-	struct dfu_entity *dfu;
-	int i, ret;
 	char *s;
+	int ret;
 
-	dfu_alt_num = dfu_find_alt_num(env);
+	dfu_alt_num = num;
 	debug("%s: dfu_alt_num=%d\n", __func__, dfu_alt_num);
 
 	dfu_hash_algo = NULL;
@@ -456,21 +455,49 @@ int dfu_config_entities(char *env, char *interface, char *devstr)
 			pr_err("Hash algorithm %s not supported\n", s);
 	}
 
-	dfu = calloc(sizeof(*dfu), dfu_alt_num);
-	if (!dfu)
+	*dfu = calloc(sizeof(struct dfu_entity), dfu_alt_num);
+	if (!*dfu)
+		return -1;
+
+	return 0;
+}
+
+int dfu_alt_add(struct dfu_entity *dfu, char *interface, char *devstr, char *s)
+{
+	struct dfu_entity *p_dfu;
+	int ret;
+
+	if (alt_num_cnt >= dfu_alt_num)
+		return -1;
+
+	p_dfu = &dfu[alt_num_cnt];
+	ret = dfu_fill_entity(p_dfu, s, alt_num_cnt, interface, devstr);
+	if (ret)
 		return -1;
-	for (i = 0; i < dfu_alt_num; i++) {
 
+	list_add_tail(&p_dfu->list, &dfu_list);
+	alt_num_cnt++;
+
+	return 0;
+}
+
+int dfu_config_entities(char *env, char *interface, char *devstr)
+{
+	struct dfu_entity *dfu;
+	int i, ret;
+	char *s;
+
+	ret = dfu_alt_init(dfu_find_alt_num(env), &dfu);
+	if (ret)
+		return -1;
+
+	for (i = 0; i < dfu_alt_num; i++) {
 		s = strsep(&env, ";");
-		ret = dfu_fill_entity(&dfu[i], s, alt_num_cnt, interface,
-				      devstr);
+		ret = dfu_alt_add(dfu, interface, devstr, s);
 		if (ret) {
 			/* We will free "dfu" in dfu_free_entities() */
 			return -1;
 		}
-
-		list_add_tail(&dfu[i].list, &dfu_list);
-		alt_num_cnt++;
 	}
 
 	return 0;
diff --git a/include/dfu.h b/include/dfu.h
index bf51ab74a5..7d60ffc228 100644
--- a/include/dfu.h
+++ b/include/dfu.h
@@ -143,6 +143,8 @@ struct dfu_entity {
 #ifdef CONFIG_SET_DFU_ALT_INFO
 void set_dfu_alt_info(char *interface, char *devstr);
 #endif
+int dfu_alt_init(int num, struct dfu_entity **dfu);
+int dfu_alt_add(struct dfu_entity *dfu, char *interface, char *devstr, char *s);
 int dfu_config_entities(char *s, char *interface, char *devstr);
 void dfu_free_entities(void);
 void dfu_show_entities(void);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
