Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4190B3B5E7E
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Jun 2021 14:56:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAC85C57B7D;
	Mon, 28 Jun 2021 12:56:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69E7DC3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 12:56:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SCqcx2032716; Mon, 28 Jun 2021 14:56:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=imNRI+Gj+fJci6N4FsgJYx67iTdcughSMATOXzR7iDU=;
 b=e1OJ7Qg52UYuHDPSyh/+wXtsmoUxE65GLDT0TY8N2/yzxXOU6vmUuxPY+1/ko4f57AFS
 Bve6b7+N3VOInCXrPftsSiSwGkir7AAeVCVouniQqojALqGvziZ6DyK5I3HGWfu1XR9J
 jYavW9fsB/A+uBMpxZ9zXx2Fotft6OiA7i2S+VE6X4QvwzgJ28pPU+ZQXdTLUHi2nxPw
 +UaeSqbNQ/oAVuDmyh3Q0Pyn+7CVs5Ak43yXNLs7MhlWuV68EvffDRA9LseoG8h92xfE
 GoVuk4CIDHNeHbXV6crhYMyl4U2DUarYl9mtlQcoY4GsqJHlD/5dx7zcxeVF+6fx2Zqi 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39f1xsktvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 14:56:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4FC610002A;
 Mon, 28 Jun 2021 14:56:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBF662291B7;
 Mon, 28 Jun 2021 14:56:09 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Jun 2021 14:56:09
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Jun 2021 14:55:57 +0200
Message-ID: <20210628145519.1.I222bda2f6a603fbc60ccaae84a9936af8ccbba8b@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_11:2021-06-25,
 2021-06-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/7] stm32mp: configs: activate the command
	stm32key only for ST boards
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

This command is used to evaluate the secure boot on stm32mp SOC,
it is deactivated by default in real products.

We activate this command only in STMicroelectronics defconfig
used with the evaluation boards.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/Kconfig       | 4 +++-
 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 7c25266f33..0e59931679 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -174,10 +174,12 @@ config STM32_ETZPC
 
 config CMD_STM32KEY
 	bool "command stm32key to fuse public key hash"
-	default y
+	default n
 	help
 		fuse public key hash in corresponding fuse used to authenticate
 		binary.
+		This command is used to evaluate the secure boot on stm32mp SOC,
+		it is deactivated by default in real products.
 
 config PRE_CON_BUF_ADDR
 	default 0xC02FF000
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 3ff46f7048..4e66472825 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -10,6 +10,7 @@ CONFIG_SPL_DM_SPI=y
 CONFIG_SPL_TEXT_BASE=0x2FFC2500
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL=y
+CONFIG_CMD_STM32KEY=y
 CONFIG_TARGET_ST_STM32MP15x=y
 CONFIG_CMD_STM32PROG=y
 CONFIG_ENV_OFFSET_REDUND=0x2C0000
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index afbf721299..d68bdf9eea 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -6,6 +6,7 @@ CONFIG_SYS_MEMTEST_START=0xc0000000
 CONFIG_SYS_MEMTEST_END=0xc4000000
 CONFIG_ENV_OFFSET=0x280000
 CONFIG_ENV_SECT_SIZE=0x40000
+CONFIG_CMD_STM32KEY=y
 CONFIG_TARGET_ST_STM32MP15x=y
 CONFIG_CMD_STM32PROG=y
 CONFIG_ENV_OFFSET_REDUND=0x2C0000
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
