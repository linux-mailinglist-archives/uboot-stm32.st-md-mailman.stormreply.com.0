Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE331FAA21
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 09:41:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB8DCC36B2D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 07:41:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82628C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 07:41:04 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05G7cuYj026908; Tue, 16 Jun 2020 09:40:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=v/woQdszPxLVTxB/js2GFZ0XB/oZVRDaONJWqrcmwus=;
 b=Y9wnFquNJ+D8B81bghnNY41KiSUAngzYcLrrortdKmlbVqK4NxEzCPgj/Tzh+akueQ6n
 T9eooVhyg3Qtimxrg9SCHqfPCOCZSZSeGbecB33IMll107mTqB4lJzS6j9mMtqi/8AMh
 Mx9aYPOrpWAroj6y6zmUIixs4k4Zg2s/retODj5rQUcQEvqpOw4DVjVII7OVe5Wdm9KI
 48DqJt/s7qsDvkSvsM0iG/8XhzLJGSR1zcD9hm3mrMP9wRJpYOFN8gVKvlLrYJBiT+Vb
 KyN7Zr0n8/JcVQ+LqYE9sISVzKl+VcIOV2MGvUAJfzV9I6TumXk60LGI2vVkP5JMOpM/ hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjvwtj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 09:40:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BFC4100038;
 Tue, 16 Jun 2020 09:40:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 32D682AEF93;
 Tue, 16 Jun 2020 09:40:52 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 09:40:51 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Jun 2020 09:40:41 +0200
Message-ID: <20200616074048.7898-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616074048.7898-1-patrick.delaunay@st.com>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_02:2020-06-15,
 2020-06-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/9] env: ext4: set gd->env_valid
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

Add a missing initialization of gd->env_valid in env_ext4_load
as it is already done in some other env device.

Set gd->env_valid = ENV_VALID in env_ext4_save() and env_ext4_load().

This patch allows to have a correct information in 'env info' command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v1)

 env/ext4.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/env/ext4.c b/env/ext4.c
index 8e90bb71b7..ac9f126bec 100644
--- a/env/ext4.c
+++ b/env/ext4.c
@@ -32,6 +32,8 @@
 #include <ext4fs.h>
 #include <mmc.h>
 
+DECLARE_GLOBAL_DATA_PTR;
+
 __weak const char *env_ext4_get_intf(void)
 {
 	return (const char *)CONFIG_ENV_EXT4_INTERFACE;
@@ -79,6 +81,7 @@ static int env_ext4_save(void)
 			CONFIG_ENV_EXT4_FILE, ifname, dev, part);
 		return 1;
 	}
+	gd->env_valid = ENV_VALID;
 
 	puts("done\n");
 	return 0;
@@ -124,7 +127,11 @@ static int env_ext4_load(void)
 		goto err_env_relocate;
 	}
 
-	return env_import(buf, 1);
+	err = env_import(buf, 1);
+	if (!err)
+		gd->env_valid = ENV_VALID;
+
+	return err;
 
 err_env_relocate:
 	env_set_default(NULL, 0);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
