Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E211B4529
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 14:29:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB1A7C36B16
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 12:29:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C167C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:29:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MCEBWE031946; Wed, 22 Apr 2020 14:29:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=kFQi/JnFxTBLy3iAAIaT3eY12VV5gWz/6b7RtG6O4oM=;
 b=dxKH7r4gPQ90u2iL50lnrV0CIY9yGjXbuhWihV8XiEXVTgtXmsa/lHndKaR67+bD2r0p
 MOBTyrHd0klVn9EKmB761KPcXl0vK5wbVX4UbVguHE8UtkzrdkgHbop2yaFrUb9ZpD+E
 vYBs1Si7LRFZtOqgQjKJex71eHBB4pRsGnGEA/k7NWiJTg6gKhZYYVjpGilyt4yL1TKx
 cGot49O4pvfbioVK4o7+40fuXSne6YXigJS+KiTm+b3A95gqyf1NujfaSOZwiCNWFW1n
 QG2OJC6mD4pjVkGXB3yi9MpaucQ4eHweFMrW8yQYWoL626keU0wIzkymri3XQN+ERYyt aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq11pcfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:29:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DACD1100034;
 Wed, 22 Apr 2020 14:29:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2AB52AE6C5;
 Wed, 22 Apr 2020 14:29:30 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Apr 2020 14:29:30 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Apr 2020 14:29:20 +0200
Message-ID: <20200422142834.v2.12.Ie45c9b3aed36a3a582774fa1dffcea89d2c4bcf4@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422122920.19340-1-patrick.delaunay@st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 12/12] configs: stm32mp1: activate
	CONFIG_ERRNO_STR
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

Add support of errno_str, used in command pmic and regulator.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2: None

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 9a16ada428..115d12ffb5 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -141,4 +141,5 @@ CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_ERRNO_STR=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 8085d28772..d38394ed6b 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -125,4 +125,5 @@ CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_ERRNO_STR=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
