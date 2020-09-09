Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 142FB262F21
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 15:24:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 969F9C424B9
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 13:24:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7286C424B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 13:24:47 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089DMjkc030108; Wed, 9 Sep 2020 15:24:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=e36ML3wGAwNts0trnM1hFPrW0I7nHxcoYZ2nPw7eFmE=;
 b=ML7sMYx123BBWd9Lrpe0ICE3qbynKUiuGNQlXszpndsauEEddVvqVFf8eJu2O4e3HRL8
 LyhUvb02k5xGoua1lFcdVXDz+PD+m9Yhp39YoyEx7NaE6wr4xhVrtDvSwuEpofEk+4IS
 J4hTqBl8eGnj5sYQPpc1G3kabdxCQnzzktMg+j5aiHIHE01D8CiYehyA+vtM+VChFOsO
 Cr0+mvMH26oCKuQcPA67ZhW47iYkGGiPw8gvRerWB9nzEh9wP6uS1gQ2Husx+daxvyty
 PIH6BjZY4703mQsuhLQYwPLrG1UomrfMnzW6HLXJPbbmFivd619s3gok0gjuPCnuVCet Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c051dcf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 15:24:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 170C5100034;
 Wed,  9 Sep 2020 15:24:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F65D2AD9F2;
 Wed,  9 Sep 2020 15:24:46 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 9 Sep 2020 15:24:45 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 9 Sep 2020 15:24:35 +0200
Message-ID: <20200909152426.4.I3df1738f393278eeb2df2ad4fd8543360d3a5597@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
References: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_07:2020-09-09,
 2020-09-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 4/4] configs: stm32mp1: enable the fastboot
	oem command bootbus
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

Enable the fastboot oem command bootbus, used to configure the eMMC
boot behavior, with same format than 'mmc bootbus'
and with parameter: boot_bus_width reset_boot_bus_width boot_mode

On stm32mp1 boards the expected command is
$> fastboot oem partconf:0 0 0

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 6cbfbe5274..0115c9b891 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -87,6 +87,7 @@ CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
+CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index cc114896df..470a2f4c35 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -67,6 +67,7 @@ CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
+CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
