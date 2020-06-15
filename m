Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B5E1F9AE4
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 16:52:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D06FC36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 14:52:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB15BC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 14:52:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FEi15G002780; Mon, 15 Jun 2020 16:52:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=h+RiV3Rz4o3kZbCLg4Wxvcf4WfDbvkGMspXJ3ufL7e8=;
 b=UHlGNmSl8msISWxf+P8PwTiyC329kqyAKHhpXZJDUeFcZWmL2hI8CoMBpcrP36f3GIbO
 nbbmfJEUgDFyRQ+Y0ni9NLylZZ9sWQaq+ReSz+VLqHomwfVLKqrg9Uzx8frJGML8euWP
 tq1tnPjn+t6V4kRdd1tw7zm48hhVmi5IdRwydrqncmjKHtw3za3J8DiRyWUwiIKIwwaT
 C6yvcYK/uyBhkthQ2kQ/gJhPsEFeRkwEyQsQLY1z+FRpw7WaW7aEdb+ycNGMCMBNJAZy
 lUqLpfMk5Qo6UwT1hd9YuMuqczH6AtqE8LJD9BE5MWGQA+klJhzTseccLUs+WWDBrrdv jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph20rb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 16:52:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E4ED10002A;
 Mon, 15 Jun 2020 16:52:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D27D2AC953;
 Mon, 15 Jun 2020 16:52:20 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 16:52:19 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 16:52:17 +0200
Message-ID: <20200615145217.16864-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_03:2020-06-15,
 2020-06-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [RESEND PATCH] env: add prototypes for weak function
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

Commit-note
Hi,

I resend this patch, rebased on master without modification
http://patchwork.ozlabs.org/project/uboot/list/?series=155601

Regards

Patrick

END

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/env_internal.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/env_internal.h b/include/env_internal.h
index e89fbdb1b7..b9459f926c 100644
--- a/include/env_internal.h
+++ b/include/env_internal.h
@@ -211,6 +211,37 @@ struct env_driver {
 
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
