Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3BFDBD3
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Nov 2019 11:57:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 393D2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Nov 2019 10:57:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC542C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 10:57:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFAq6UJ001210; Fri, 15 Nov 2019 11:57:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=uSDSej7yyP7Div2ehP3A/ggKu9EQFOeqTdSX96m+sYI=;
 b=UhSATnePfMOlpsXcewfE6929T3fkypQm+mBh4uMNj/K+4DRc/Qj41Fc8K30PW3l0s9Xa
 QL8Ds4jJ9nlVJLXfMNXDkqflY2aV4HMAIte6z8mLYo4QMACM9eP0KAz0NvdiTyKjBeVJ
 Y/nLr1eRjxCzYvHaNV7ZqvztTWO3APl0mJYZap0s6Z5woV/WgNZOPt1dsVvMtaC3NPBv
 lyxe/ymi32PBMMQcR8Cwhmeb+Nc7/c/3O880eHuq7wxoP5K8BJGA/40zKMZQYOoyx7gd
 zK9olKe2kOi2wdSPEdECYXfC6OwCgUdM0B8v2FIy0EQy9QajDpqJ8MnhNmBlG8h8Fjgi IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w7psbkk8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 11:57:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17D8A10003A;
 Fri, 15 Nov 2019 11:57:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F181C2B495E;
 Fri, 15 Nov 2019 11:57:17 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 15 Nov 2019 11:57:17 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 15 Nov 2019 11:57:03 +0100
Message-ID: <20191115105703.27406-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_03:2019-11-15,2019-11-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] configs: stih410-b2260: Enable DM_ETH flag
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

This patch allows to fix the following compilation warning:

===================== WARNING ======================
This board does not use CONFIG_DM_ETH (Driver Model
for Ethernet drivers). Please update the board to use
CONFIG_DM_ETH before the v2020.07 release. Failure to
update by the deadline may result in board removal.
See doc/driver-model/migration.rst for more info.
====================================================

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 configs/stih410-b2260_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stih410-b2260_defconfig b/configs/stih410-b2260_defconfig
index aeebeeca04..63eac131f9 100644
--- a/configs/stih410-b2260_defconfig
+++ b/configs/stih410-b2260_defconfig
@@ -31,6 +31,7 @@ CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_MISC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_STI=y
+CONFIG_DM_ETH=y
 CONFIG_PHY=y
 CONFIG_STI_USB_PHY=y
 CONFIG_PINCTRL=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
