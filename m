Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59506262F20
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 15:24:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90C97C424BB
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 13:24:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F9D5C424BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 13:24:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089DLgPb027789; Wed, 9 Sep 2020 15:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=g18H/FmRBlyFyyHkyyUbq41lvoIsBuvm5l/XmWme0JM=;
 b=Ff2QCfpc87BnboaMEdzXSFgpcu578LUTS/uhs3/tErkLt7OB4uCj347llRFDbYFSNFmx
 xRcGpSfOcb24fqfn8JV2R/7Dwyi1SU/uSzsFP0lyGGvAloQ1TJsgf7kiJWjeIOf/p8hU
 PSLuYqHug+VJ03WOh0tS/7F8jP9UMRw5HnJ3DO6YagOP4tjSy1mhx9e7XTYWezxQSPBb
 pjieQiyiLrLxYf67kV4OLsIZhb+vDXbCZXhRfo7C3VALveBiK55vJrflZ4dai7oD4m2Q
 lLL2KGft9YRIjqolDU002sUv0ffejgTGOgCVRnFRM1wieMOt1ukg0LwQv/DpNpmh6eGT Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33byt7wwtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 15:24:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C8CE100034;
 Wed,  9 Sep 2020 15:24:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01F612AD9F2;
 Wed,  9 Sep 2020 15:24:45 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 9 Sep 2020 15:24:44 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 9 Sep 2020 15:24:34 +0200
Message-ID: <20200909152426.3.Ifc72cc530e2479312583fe81352d9f58b63388fe@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
References: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_07:2020-09-09,
 2020-09-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/4] configs: stm32mp1: enable the fastboot
	oem command partconf
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

Enable the fastboot oem command partconf, used to select the correct
eMMC boot partition, with same format than 'mmc partconf'
with parameter: boot_ack boot_partition
On stm32mp1 family:
- boot_ack = 1 (Boot Acknowledge is needed by ROM code)
- boot_partition = 1 or 2 (Boot partition 1 / 2 enabled for boot)

So on EV1 board the expected commands to select boot partition 1 or 2
$> fastboot oem partconf:1 1
$> fastboot oem partconf:1 2

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 0f705eccb2..6cbfbe5274 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -86,6 +86,7 @@ CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
 CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
+CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 3e9cca6a1e..cc114896df 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -66,6 +66,7 @@ CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
 CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
+CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
