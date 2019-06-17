Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D347BB5
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Jun 2019 09:54:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2DE8CE9FCC
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Jun 2019 07:54:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30FDECE8FFF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 07:54:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H7rvqs026614; Mon, 17 Jun 2019 09:54:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=K5GUMwstr3yHBEmWcR2tGchwwuAyKgqc1W0V/TIG+wY=;
 b=cGVc38pqTb7IKAMqzsM+NEmuh32855Zm6ULpyxUdOYrISQr4DcYBAfcARjIC3wEXc6FM
 Q3GKbc23w4Z0y2VvIP7Fpq59HuEpPsNcqAxet/DsnYG4XxxCZYq6CiLZypJnNa9n2qGj
 pw/1oyXzII+rSL6VcRufoOvYdEC7TFRm3LC1j4Hej4EwHCMLD5Y19MgvIIhaQ850f3WP
 274RPdi1OaQpQExg5FkpALMXiCmfUzqn/a1ZvP4oqLGJLCQn3zH9f3ACLXs43EtgIQad
 sjZpzJmBrw3sNTwhQxpIILvX0VYNgwEKCVAkK3IA2VkGNUucSORA8yM2/WCTtnOcaDvU 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t4nt81hcw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 17 Jun 2019 09:54:41 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B5E234;
 Mon, 17 Jun 2019 07:54:40 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E9F6166B;
 Mon, 17 Jun 2019 07:54:40 +0000 (GMT)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 17 Jun 2019 09:54:39 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 17 Jun 2019 09:54:31 +0200
Message-ID: <20190617075431.13629-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp15: Select correct Ethernet
	driver for trusted mode
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

Select the correct Ethernet driver from Synopsis.
Initially, "Synopsys Designware Ethernet MAC" driver was wrongly
selected instead of "Synopsys DWC Ethernet QOS device" driver.

Fixes: commit f90b3f5b68ed ("configs: stm32mp15: Enable Ethernet feature")

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 configs/stm32mp15_trusted_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 66361c8715..5fe9477823 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -73,7 +73,7 @@ CONFIG_SPI_FLASH_WINBOND=y
 # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
 CONFIG_SPI_FLASH_MTD=y
 CONFIG_DM_ETH=y
-CONFIG_ETH_DESIGNWARE=y
+CONFIG_DWC_ETH_QOS=y
 CONFIG_PHY=y
 CONFIG_PHY_STM32_USBPHYC=y
 CONFIG_PINCONF=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
