Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8BC6E5FA
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 15:00:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2859FC0E333
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 13:00:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77B1BC0EB20
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 13:00:22 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JD06bE021006; Fri, 19 Jul 2019 15:00:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=yePnVd8uhV1OPdekiyLOIswAeL7gzwAg9W7690L4IWw=;
 b=IiI2AvZOF4DFd6CsjYeiazLudkDDC5RYiHeCfa3I5ANV7txIGRhdi0uVZr6Jc0icc1YH
 gLvmsrbNvfOifA7WBkHQIEZakp2+l8XluORKdCJQxNXwea08OlyAuOpn0HtoT/abB2J3
 AZ8mtG7N3zZgCDk7kBhrTJ+lK+Yv/uyCgtVzjhZbmbaIQt3s1NufhbGPCQFN4CmXY4V8
 Zl7gvbdwgMSWPZ4b4od8efGuyNxmLEWx89+ZdhpFFP7FgkuFH2lKgXBzH+fOIff6cnmg
 mbIb+pbPtIrg1DObtrHSE+eSyqwvY2e3WUiAisQTf1ZMIhBYKrD7uJXTdvHSNsa1Wcgl Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tsdepv664-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 15:00:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A6F864;
 Fri, 19 Jul 2019 12:57:33 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B1022D51;
 Fri, 19 Jul 2019 12:57:33 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 14:57:33 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 14:57:33
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 14:57:15 +0200
Message-ID: <1563541046-6432-4-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [RFC PATCH 03/14] dfu: prepare the support of
	multiple interface
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

 drivers/dfu/dfu.c | 51 +++++++++++++++++++++++++++++++++++++++------------
 include/dfu.h     |  2 ++
 2 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index eb3a3c6..79a652e 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -438,13 +438,12 @@ void dfu_free_entities(void)
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
@@ -455,21 +454,49 @@ int dfu_config_entities(char *env, char *interface, char *devstr)
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
index bf51ab7..7d60ffc 100644
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
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
