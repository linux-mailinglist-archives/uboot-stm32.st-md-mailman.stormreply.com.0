Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F69614B0C5
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 09:18:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34430C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 08:18:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F29FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 08:18:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S8CXe4018842; Tue, 28 Jan 2020 09:18:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Nt1XhWVvVH/PAoch6bf2nohXlVQECXnA4JyGVGvH5vo=;
 b=ChR72l8K5R4yFt9BQ52cOdcR7TNibm/0cxKZDELXw0QrshQ5LrCXG5CGXpVFQrzdGJtq
 bI7hiRmTjKttPMs3L8+CHia/NxpjiSKRAeserBHg8nIljQ5UOVzFTayDUn361k0OZXCK
 WZX6h2WMZcXBmug9LESdGo6bZK0vG5U8sDDLVHECK+2Q3yHYwo9ZxPbwCDpONti4ByfZ
 PNNyVRMFfVsyqxyStpK5E9mgzkOBDMjEYlM7cMd9GS8Xa9wN89hK60VD5SQ8YZlddhDg
 MZ/segJETrYigUrqJNZQOKGjInBArL4Lh04syYVPm9EMx8nNKT15r/vmWQ5SR8scbkJq xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrdekcm98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 09:18:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 00F42100038;
 Tue, 28 Jan 2020 09:18:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1133210F9C;
 Tue, 28 Jan 2020 09:18:43 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 09:18:43 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jan 2020 09:18:40 +0100
Message-ID: <20200128081840.24926-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH v2] env: add prototypes for weak function
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

Changes in v2:
- clarify the comment on the added prototype

 include/env_internal.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/env_internal.h b/include/env_internal.h
index 90a4df8a72..3f13a90326 100644
--- a/include/env_internal.h
+++ b/include/env_internal.h
@@ -209,6 +209,37 @@ struct env_driver {
 
 extern struct hsearch_data env_htab;
 
+/**
+ * env_ext4_get_intf() - Provide the interface for env in EXT4
+ *
+ * It is a weak function allowing board to overidde the default interface for
+ * U-Boot env in EXT4: CONFIG_ENV_EXT4_INTERFACE
+ *
+ * @return string of interface, empty if not supported
+ */
+const char *env_ext4_get_intf(void);
+
+/**
+ * env_ext4_get_dev_part() - Provide the device and partition for env in EXT4
+ *
+ * It is a weak function allowing board to overidde the default device and
+ * partition used for U-Boot env in EXT4: CONFIG_ENV_EXT4_DEVICE_AND_PART
+ *
+ * @return string of device and partition
+ */
+const char *env_ext4_get_dev_part(void);
+
+/**
+ * env_get_location()- Provide the best location for the U-Boot environment
+ *
+ * It is a weak function allowing board to overidde the environment location
+ *
+ * @op: operations performed on the environment
+ * @prio: priority between the multiple environments, 0 being the
+ *        highest priority
+ * @return  an enum env_location value on success, or -ve error code.
+ */
+enum env_location env_get_location(enum env_operation op, int prio);
 #endif /* DO_DEPS_ONLY */
 
 #endif /* _ENV_INTERNAL_H_ */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
