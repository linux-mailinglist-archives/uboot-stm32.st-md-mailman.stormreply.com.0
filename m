Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3610952F0AD
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 18:29:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00DEBC0D2BB;
	Fri, 20 May 2022 16:29:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 922F4C0D2B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 16:29:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KF9WhR000699;
 Fri, 20 May 2022 18:29:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=U97oqY6DCFmprT2WT4XIflZP0gPmA2zvgyPoNszGlWQ=;
 b=8N4Cw8iFbJI9VClP23ao2aQJeVgcDL41o4vJYt8q1JbCR1mVWdDJy+3B4MwifXl3ljYI
 /Fye9QTMQ23cR9zneefzW3yCdxgyJgucsTbkFJH/B87gD+djgY1xQ/PCzi0Lq58Fwv3B
 grQONejO3ChHJt0VOc/CdjO5GAjSczuZRhi73zqyPU4bbnkqHIU80q3sYAzXdw53vzyV
 Oyi7bk1UBO1iMJ7Zk2YWZ5Jl2LU7nfqZ+TL+gPPzoDexoYGJKNN+Lbz4nyU6IsAWne33
 rm/2HzI9ulbqYizxTsTTHU8ZgxNOHiidl1mhfOafM/UE5E0meMA0RP+USOfCVrVqdPRw jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23s2589e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:29:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E6A4210002A;
 Fri, 20 May 2022 18:29:13 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E116324C42B;
 Fri, 20 May 2022 18:29:13 +0200 (CEST)
Received: from localhost (10.75.127.47) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 18:28:24 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 May 2022 18:24:53 +0200
Message-ID: <20220520182444.v2.15.If62e8c985dd17697c445e229f7375013b22a8c0d@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
References: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH v2 15/16] configs: add stm32mp13 defconfig
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

Add a initial config for STM32M13x SOC family, using the stm32mp135f-dk
device tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 board/st/stm32mp1/MAINTAINERS |  1 +
 configs/stm32mp13_defconfig   | 54 +++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 configs/stm32mp13_defconfig

diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
index c9252e90f4..d5a09cdc39 100644
--- a/board/st/stm32mp1/MAINTAINERS
+++ b/board/st/stm32mp1/MAINTAINERS
@@ -6,6 +6,7 @@ S:	Maintained
 F:	arch/arm/dts/stm32mp13*
 F:	arch/arm/dts/stm32mp15*
 F:	board/st/stm32mp1/
+F:	configs/stm32mp13_defconfig
 F:	configs/stm32mp15_defconfig
 F:	configs/stm32mp15_basic_defconfig
 F:	configs/stm32mp15_trusted_defconfig
diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
new file mode 100644
index 0000000000..877c020b4a
--- /dev/null
+++ b/configs/stm32mp13_defconfig
@@ -0,0 +1,54 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_TFABOOT=y
+CONFIG_SYS_MALLOC_F_LEN=0x180000
+CONFIG_ENV_OFFSET=0x900000
+CONFIG_DEFAULT_DEVICE_TREE="stm32mp135f-dk"
+CONFIG_STM32MP13x=y
+CONFIG_DDR_CACHEABLE_SIZE=0x10000000
+CONFIG_TARGET_ST_STM32MP13x=y
+CONFIG_ENV_OFFSET_REDUND=0x940000
+# CONFIG_ARMV7_NONSEC is not set
+CONFIG_SYS_LOAD_ADDR=0xc2000000
+CONFIG_SYS_MEMTEST_START=0xc0000000
+CONFIG_SYS_MEMTEST_END=0xc4000000
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_FIT=y
+CONFIG_BOOTDELAY=1
+CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_SYS_PROMPT="STM32MP> "
+CONFIG_CMD_ADTIMG=y
+CONFIG_CMD_ERASEENV=y
+CONFIG_CMD_MEMINFO=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_MMC=y
+CONFIG_CMD_CACHE=y
+CONFIG_CMD_TIME=y
+CONFIG_CMD_TIMER=y
+CONFIG_CMD_LOG=y
+CONFIG_OF_LIVE=y
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_SYS_MMC_ENV_DEV=-1
+CONFIG_CLK_SCMI=y
+CONFIG_STM32_SDMMC2=y
+CONFIG_DM_ETH=y
+CONFIG_PINCONF=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_DM_REGULATOR_SCMI=y
+CONFIG_RESET_SCMI=y
+CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_SYSRESET_PSCI=y
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+# CONFIG_OPTEE_TA_AVB is not set
+CONFIG_ERRNO_STR=y
+# CONFIG_LMB_USE_MAX_REGIONS is not set
+CONFIG_LMB_MEMORY_REGIONS=2
+CONFIG_LMB_RESERVED_REGIONS=16
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
