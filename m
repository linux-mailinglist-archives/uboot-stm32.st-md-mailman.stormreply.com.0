Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D181A4848
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 18:13:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4334CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 16:13:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ECECC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 16:13:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03AGDPSg021839; Fri, 10 Apr 2020 18:13:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=3hD4oOdADvBzOm34DhIFqfikBZctVzAzIvEGz/Zs2Ts=;
 b=cmbceDEAe4RUqjM5rZdVaxqQnPpyojIbbn0DVSWbIcRGVf80gBb3dN/vE1JkRaUSUj60
 ysI7p8llOETTn5jjJ17INvLcJ+hvasTGa4JtM46xAg5MAHdU92P74yk+mzpg2NxzK7sp
 /TxzY8XjvQkg2nkYbiqLjPQfxxywEYf0+xfq3/3j1vwGZ6Zuu+TYgRbnY+HUYrbCQaa/
 T+QlzdanbOCGsgDKChmGWdG5kyZK7WQeqSpEYKkrU3gHn46Kmqizx72BFb5B2LZKSg8N
 aUrjneqA2OYLuBEjFEYjnEflwviKeSXtLlvJ586OimVvn3aVAbasOIij6mecUz+Ibls1 Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 309vr9e5fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2020 18:13:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1607E10002A;
 Fri, 10 Apr 2020 18:13:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02F922B187A;
 Fri, 10 Apr 2020 18:13:22 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Apr 2020 18:13:21 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 Apr 2020 18:13:19 +0200
Message-ID: <20200410181315.1.Icdfee0d20622a819ea009800c0bc4164107e0084@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-10_06:2020-04-09,
 2020-04-10 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Enable bootd, iminfo,
	imxtract on ST defconfig
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

Enable these standard U-Boot commands for image manipulation and for
starting the default boot command using 'boot' command in U-Boot shell.

Cc: Marek Vasut <marex@denx.de>
Cc: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 3 ---
 configs/stm32mp15_trusted_defconfig | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 6d82365348..c8f1780cab 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -21,10 +21,7 @@ CONFIG_SPL_MTD_SUPPORT=y
 CONFIG_SPL_POWER_SUPPORT=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
 CONFIG_SYS_PROMPT="STM32MP> "
-# CONFIG_CMD_BOOTD is not set
 # CONFIG_CMD_ELF is not set
-# CONFIG_CMD_IMI is not set
-# CONFIG_CMD_XIMG is not set
 # CONFIG_CMD_EXPORTENV is not set
 # CONFIG_CMD_IMPORTENV is not set
 CONFIG_CMD_MEMINFO=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 6928e9a65c..82a8b709cd 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -9,10 +9,7 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_SYS_PROMPT="STM32MP> "
-# CONFIG_CMD_BOOTD is not set
 # CONFIG_CMD_ELF is not set
-# CONFIG_CMD_IMI is not set
-# CONFIG_CMD_XIMG is not set
 # CONFIG_CMD_EXPORTENV is not set
 # CONFIG_CMD_IMPORTENV is not set
 CONFIG_CMD_MEMINFO=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
