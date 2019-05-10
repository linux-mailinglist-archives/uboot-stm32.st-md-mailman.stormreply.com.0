Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B67471A13F
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:20:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86451CA8E65
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:20:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D3B8CA8E64
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:20:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6SAf025315; Fri, 10 May 2019 18:20:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=gyIC3mMoMDlOjZ4ynddTTL25x6BIRC6NnEbpFLnY0ok=;
 b=V+5h8ZaoULOQZ4U1r63/sBOyMZ6/Ey0Uttku1s8PerygFLtcfFQNPt6+Lk4yNS/9/gt9
 8tw3T5hapHqF3pIp9k+De9Rmz4fauK/D/nhnYA2aaDHQ+HyhLEg9NQ/LUBZFqetatnpk
 mYks8b4gaXn78bXO6Sp5LB9Qf6Z7sapR7w/gd6dV3D7Ob6xt0uS6nGqhZTD1l9+XcIxQ
 84P0Rl1RKqbPMH7f6TTveFeyyCNOn7WMpTz1fhBRDxwiv3VgQKL65wwv4Pf/ehOYUC2h
 eNsBe1oXk8T27StQ8gs8SDsURs/M27a1sPKTsE4E3B61Vvr7wNOc8SyJ1Gwv0LKnr2dX +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sc9s4kfu1-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:20:17 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5EEB731;
 Fri, 10 May 2019 16:20:17 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43121132F;
 Fri, 10 May 2019 16:20:17 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:20:16 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:19:08 +0200
Message-ID: <1557505154-3856-8-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
References: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 07/13] configs: stm32mp15: Enable
	ENV_IS_IN_EXT4 and all relative flags
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

From: Patrick Delaunay <patrick.delaunay@st.com>

Enable ENV_IS_IN_EXT4 and all relative flags to be able to
load/save environment in EXT4 partition.

This will allows to load/save environment on both sdcard and eMMC.
As for stm32mp15, bootfs has not the same partition number on sdcard
and on eMMC, we use "auto" key which allows to find the first
partition in device with bootable flag which is partition 4 on sdcard
and partition 2 on eMMC.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 configs/stm32mp15_basic_defconfig   | 5 +++++
 configs/stm32mp15_trusted_defconfig | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index f5e13dd..051c1de 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -41,6 +41,11 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_MTDPARTS=y
 # CONFIG_SPL_DOS_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_EXT4_INTERFACE="mmc"
+CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
+CONFIG_ENV_EXT4_FILE="/uboot.env"
 CONFIG_STM32_ADC=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index cae3324..f09f0e4 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -33,6 +33,11 @@ CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_MTDPARTS=y
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_EXT4_INTERFACE="mmc"
+CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
+CONFIG_ENV_EXT4_FILE="/uboot.env"
 CONFIG_STM32_ADC=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
