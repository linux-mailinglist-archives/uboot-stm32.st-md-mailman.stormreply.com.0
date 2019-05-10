Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EAD1A108
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:11:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9209ACA8E48
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:11:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38633CA8E44
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:11:46 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6B1B014681; Fri, 10 May 2019 18:11:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=3cC7BlmTEJK0ldNWsplUN7k0RmT4KDvfrmGvV6AZzLQ=;
 b=bI+4s8Rpur66BdeIKbj04IqMgnoLuBr39jZyagBeLe2CRZcu0s4kSi+C0dn2JBO1RQDT
 oSCvUVHQwF9Dy4XsdNByVqS8L2LXWdahzzCfUdx3sdBb6K3+mAHUfjall5P2MWRApXFZ
 8YmGMsCI6HCDznWV/Gg0bWHQXtHRbYgKTlCGGov8TyWD2rGvK3nauyLkG3CA9oVFTjvV
 QEj0k5oMXkVj9egUGo0bpgGJCRH70XnCfOn08sz9Khwtupk6K/VpmZXpnTJoW7h/SrGm
 9l0dkARImAIJA1KVphbBME6bO8cYYrLJesh4+ej+SVEAZJu9ZcnwFXDJ7kn+gxhdt26K TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2scbkajk3m-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:11:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8DF838;
 Fri, 10 May 2019 16:11:44 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D70C92C1E;
 Fri, 10 May 2019 16:11:44 +0000 (GMT)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:11:44 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:11:30 +0200
Message-ID: <1557504691-26188-14-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557504691-26188-1-git-send-email-patrice.chotard@st.com>
References: <1557504691-26188-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 13/14] configs: stm32mp15: Enable
	ENV_IS_SPI_FLASH
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

Add all relative flags needed by ENV_IS_IN_SPI_FLASH

Reserved a 256KB partition in NOR to save the U-Boot
environment.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 include/configs/stm32mp1.h          | 7 ++++++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index e8f170d..93066aa 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -44,6 +44,7 @@ CONFIG_CMD_UBI=y
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_ENV_IS_IN_UBI=y
 CONFIG_ENV_EXT4_INTERFACE="mmc"
 CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 61d4467..949b56a 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -36,6 +36,7 @@ CONFIG_CMD_UBI=y
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_ENV_IS_IN_UBI=y
 CONFIG_ENV_EXT4_INTERFACE="mmc"
 CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index e9bd551..f541132 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -47,6 +47,11 @@
 #define CONFIG_ENV_UBI_VOLUME_REDUND		"uboot_config_r"
 #endif
 
+#if defined(CONFIG_ENV_IS_IN_SPI_FLASH)
+#define	CONFIG_ENV_SECT_SIZE			SZ_256K
+#define	CONFIG_ENV_OFFSET			0x00280000
+#endif
+
 /* ATAGs */
 #define CONFIG_CMDLINE_TAG
 #define CONFIG_SETUP_MEMORY_TAGS
@@ -119,7 +124,7 @@
 #endif
 
 #define STM32MP_MTDPARTS \
-	"mtdparts_nor0=256k(fsbl1),256k(fsbl2),2m(ssbl),-(nor_user)\0" \
+	"mtdparts_nor0=256k(fsbl1),256k(fsbl2),2m(ssbl),256k(u-boot-env),-(nor_user)\0" \
 	"mtdparts_nand0=2m(fsbl),2m(ssbl),-(UBI)\0"
 
 /*
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
