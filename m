Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 943306E602
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 15:01:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E2EDC0B1AB
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 13:01:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A1E5C0B184
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 13:01:00 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JCugI9018541; Fri, 19 Jul 2019 15:00:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=8Ix1vdMqJftUpj6pl+xu+JNLrSt1D05ez6PfdzAu9ic=;
 b=cz2Fy/npljmv/Ev84lQUGiU7nzgxcInfibmRebVW14ykZyHbO/nFKZe4W910Xthn41wm
 AUzjjRF64uBm5ubwWsxuV+soEWv/EL5wQxGR+tMANFt54+Xp2Z4Qdl+VXWSWorI08chG
 3vrItMpKz/8VPsdg5KD2icfGp4k9Y2VS+uY1MjpbaW5PpdFluqn2qB6HKhbOOBAVdl3I
 wcRo4kfgh5QTHO3rENK7qf45liwZiu+s1bA0FZKZMtqzdFJnw+hg9zpJhMYriTZ454Wd
 eo0Wd6NJMRU7D4O/HvqCK6cSTF/FLIvUruy0FhVdDEzgWmBW6PIpvUEodPYegxhuFbq8 tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tsdepv66b-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 15:00:59 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08E854D;
 Fri, 19 Jul 2019 12:57:44 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA7A42D52;
 Fri, 19 Jul 2019 12:57:43 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 14:57:44 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 14:57:43
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 14:57:24 +0200
Message-ID: <1563541046-6432-13-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RFC PATCH 12/14] stp32mp1: configs: activate
	CONFIG_MTD_SPI_NAND
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

Activate the support of SPI NAND in stm32mp1 U-Boot.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 3f1cc49..4728376 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -75,6 +75,7 @@ CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_NAND=y
 CONFIG_NAND_STM32_FMC2=y
+CONFIG_MTD_SPI_NAND=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SPI_FLASH_BAR=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 5eb9a8c..0d9e13e 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -67,6 +67,7 @@ CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
 CONFIG_NAND=y
 CONFIG_NAND_STM32_FMC2=y
+CONFIG_MTD_SPI_NAND=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SPI_FLASH_BAR=y
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
