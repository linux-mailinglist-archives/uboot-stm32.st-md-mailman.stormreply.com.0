Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3395A16C1AD
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Feb 2020 14:07:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9DA0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Feb 2020 13:07:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A48FBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2020 13:07:04 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01PD2b7G022203; Tue, 25 Feb 2020 14:06:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=d23Pk9kN87jJ+4UEho5RLI3MedFzyCaNJuIHz2N3TAY=;
 b=kVP9NeQqPo0xXqcEMwxFJmdi4orKF0OMGTof4Jm8x9UA3W54wZlnz2wQrRECJ6o2frrp
 RwCCwhyc7ScD3RqWWY8mW5PGFYeRR+wuQkDQ5/l5sLQ9N4xCIbjuibIzgXV2dRvp7Znd
 OM6ffq5iRmKpq7SOYd97uqOHz7fiZ19brdeyOQ4L//lTnsejYTfbbMFuE3ycMJi0E21N
 jYFRJxzaCRUE/4+iJ3WgUUN/T6i/b//cTuYS57ul87oPMnmfAU+Z8uIl2+4Z4dq8oLNo
 odK8QK/tGXKT8sBMYKmwbbLnIozJi/kYZnxvZugIxpjpdOIJCz1eJA/gm1LVxWog4QB3 IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yaty1fqx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2020 14:06:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 97CAF10002A;
 Tue, 25 Feb 2020 14:06:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 768CE2B0961;
 Tue, 25 Feb 2020 14:06:58 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 25 Feb 2020 14:06:57 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 25 Feb 2020 14:06:54 +0100
Message-ID: <20200225130654.19740-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-25_04:2020-02-21,
 2020-02-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp1: Resync with savedefconfig
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

Rsync all stm32mp1 defconfig files using moveconfig.py

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 2 +-
 configs/stm32mp15_optee_defconfig   | 2 +-
 configs/stm32mp15_trusted_defconfig | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index f691306800..6d82365348 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -6,6 +6,7 @@ CONFIG_ENV_OFFSET=0x280000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL=y
 CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 # CONFIG_ARMV7_VIRT is not set
@@ -61,7 +62,6 @@ CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
 CONFIG_ENV_EXT4_INTERFACE="mmc"
 CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
 CONFIG_ENV_EXT4_FILE="/uboot.env"
-CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
index 521b24e2cb..298611776d 100644
--- a/configs/stm32mp15_optee_defconfig
+++ b/configs/stm32mp15_optee_defconfig
@@ -5,6 +5,7 @@ CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ENV_OFFSET=0x280000
 CONFIG_TARGET_ST_STM32MP15x=y
 CONFIG_STM32MP1_OPTEE=y
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
@@ -48,7 +49,6 @@ CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
 CONFIG_ENV_EXT4_INTERFACE="mmc"
 CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
 CONFIG_ENV_EXT4_FILE="/uboot.env"
-CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index c8b328d01a..6928e9a65c 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_MALLOC_F_LEN=0x3000
 CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ENV_OFFSET=0x280000
 CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
@@ -47,7 +48,6 @@ CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
 CONFIG_ENV_EXT4_INTERFACE="mmc"
 CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
 CONFIG_ENV_EXT4_FILE="/uboot.env"
-CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
