Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D7914854E
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 13:41:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4362FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 12:41:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7B63C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 12:41:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OCcYXG027298; Fri, 24 Jan 2020 13:41:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=KQT5Fv5tngJYqLumyIFFJW3RmPaYnfX2TCjhQd0A+9s=;
 b=Ztnxra/7+iBEFz5qQWd7rGE7ZPiYRxXZCCX/rsvfgdEoQaG98ieHcKlQT8nHD988zAQP
 20b278KTRPJdN+yWOCFx/CpgOun4PifX4aNVscWLMUZLt1K+XkiFS+NONW/YPoFNrhqO
 q5kKYMHFD+0I2Av0v52V7Y8WPSiX5WgfnMps3HowUZe+m6Ymg1IcVMYenV+7ihxv+c8Z
 2vKbRAqyVbtfUMSrL3ztCYyYTlj9l2hNJIrGS8EEKRqNr3UeXJbWCQELnY2sOgEL83ee
 o9czYrJ7gCIrVhY1bAjv4QuL8TO+JFIxUQ5udInShHP2oOHQTQj6wZtv/ln98iw1gYdp pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkr1eg0kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2020 13:41:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9BDEE10002A;
 Fri, 24 Jan 2020 13:41:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 90C972A770E;
 Fri, 24 Jan 2020 13:41:44 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Jan 2020 13:41:44 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Jan 2020 13:41:42 +0100
Message-ID: <20200124124142.392-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_03:2020-01-24,
 2020-01-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH] env: add prototypes for weak function
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

This patch adds prototypes for several weak functions:
- env_ext4_get_intf
- env_ext4_get_dev_part
- env_get_location

It solves the following warnings when compiling with W=1
on stm32mp1 board:

board/st/stm32mp1/stm32mp1.c:849:19: warning: no previous prototype for 'env_get_location' [-Wmissing-prototypes]
 enum env_location env_get_location(enum env_operation op, int prio)
                   ^~~~~~~~~~~~~~~~
board/st/stm32mp1/stm32mp1.c:876:13: warning: no previous prototype for 'env_ext4_get_intf' [-Wmissing-prototypes]
 const char *env_ext4_get_intf(void)
             ^~~~~~~~~~~~~~~~~
board/st/stm32mp1/stm32mp1.c:889:13: warning: no previous prototype for 'env_ext4_get_dev_part' [-Wmissing-prototypes]
 const char *env_ext4_get_dev_part(void)
             ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/env_internal.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/env_internal.h b/include/env_internal.h
index 90a4df8a72..874ef48646 100644
--- a/include/env_internal.h
+++ b/include/env_internal.h
@@ -209,6 +209,14 @@ struct env_driver {
 
 extern struct hsearch_data env_htab;
 
+/* allows to set ext4 interface */
+const char *env_ext4_get_intf(void);
+
+/* allows to set ext4 device and partition */
+const char *env_ext4_get_dev_part(void);
+
+/* Returns the best env location for a board */
+enum env_location env_get_location(enum env_operation op, int prio);
 #endif /* DO_DEPS_ONLY */
 
 #endif /* _ENV_INTERNAL_H_ */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
