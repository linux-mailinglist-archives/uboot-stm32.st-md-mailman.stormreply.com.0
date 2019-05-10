Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C00581A140
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:20:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C870CA8E67
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:20:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D0B8CA8E66
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:20:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6Tmo025459; Fri, 10 May 2019 18:20:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=D718zYvyjZHyDjzrdpb2nCU+afqNwPk7+JWsneKxj7Q=;
 b=uPisZrUmIFEY4xwbI3j94LHxdnksepuVPEbGzLPJX/s2IDlW40o3OzPfWIEwcCCNVbbz
 BuaFdCplrvKi7mZHVVszByRVgdTSHKCg5aK4r14REeIKR2lFqLnkmZpbLYnzmUEQ/3hX
 l6vbwSzcqCFbuFcyWlD/VtVBhzIgL5DK1+tGGSCn4cuSZw/LDNlTlKmPvqH9wHWsSI+T
 k3uOSLy1Htrv8cBDvY20ShTExdXrFIY+aN5/hx/DEInMtSHFuH+RVoh4snkYbMa9WYwV
 fOV8hsJAqJ5UFtUHH5Eu+Y8tbFdNtjAmrHUVmGlO1xizjCTThj5oapobw4hpNh/DG/+8 qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sc9s4kfu4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:20:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CD29431;
 Fri, 10 May 2019 16:20:18 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF1971394;
 Fri, 10 May 2019 16:20:18 +0000 (GMT)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:20:18 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:19:09 +0200
Message-ID: <1557505154-3856-9-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
References: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 08/13] stm32mp1: Add env_get_location()
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

In case of several environment location support, env_get_location
is needed to select the correct location depending of the boot
device .

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 316cd48..4f7d24a 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -7,6 +7,7 @@
 #include <config.h>
 #include <clk.h>
 #include <dm.h>
+#include <environment.h>
 #include <g_dnl.h>
 #include <generic-phy.h>
 #include <i2c.h>
@@ -506,6 +507,28 @@ void board_quiesce_devices(void)
 	setup_led(LEDST_OFF);
 }
 
+enum env_location env_get_location(enum env_operation op, int prio)
+{
+	u32 bootmode = get_bootmode();
+
+	if (prio)
+		return ENVL_UNKNOWN;
+
+	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
+#ifdef CONFIG_ENV_IS_IN_EXT4
+	case BOOT_FLASH_SD:
+	case BOOT_FLASH_EMMC:
+		return ENVL_EXT4;
+#endif
+#ifdef CONFIG_ENV_IS_IN_UBI
+	case BOOT_FLASH_NAND:
+		return ENVL_UBI;
+#endif
+	default:
+		return ENVL_NOWHERE;
+	}
+}
+
 #if defined(CONFIG_ENV_IS_IN_EXT4)
 const char *env_ext4_get_intf(void)
 {
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
