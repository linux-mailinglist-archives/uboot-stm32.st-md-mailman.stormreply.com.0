Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB6A30057E
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Jan 2021 15:34:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBDF8C3FADC;
	Fri, 22 Jan 2021 14:34:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B26F9C3089F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 14:34:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10MEXkJb004351; Fri, 22 Jan 2021 15:34:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=xR/o3Xw7MQ8zionm0gwo/qwKNI9OLBiP4TSEcfXZnkM=;
 b=NgiO21DLTH1DPu6XFPLmPHbRwPbz7tQNFI0Q8J2+M6ym4mobH1zArak7mO5wpL0UGtFI
 QZmrJkbQFfxru/gnXPXiCw/VZ7ngqG31EUhwwavvGmbOuLHxI8hJKwDBMMZ04p6s8KU4
 vUSh6Thaeq7KVglINgkh67aQd4VYnrnSUbFcydfgrIdqNot/qDE77JzZ08sOvmMD0JXs
 acirV2BTMNeQJcTbk7+h65uUHUdsBVHOjC4aUH8a+LBN0r+ZO26Xfb8g4wDpCrg+GvXE
 otZSPYeAtLOjJxm+8753QuvlQTDIjsJh3KsO2mIpKgOgYnf7Ikw+4dzZgnCH6Zf4ev03 ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pe2qe5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 15:34:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C067A10002A;
 Fri, 22 Jan 2021 15:34:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B218E250704;
 Fri, 22 Jan 2021 15:34:27 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Jan 2021 15:34:27
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 22 Jan 2021 15:34:25 +0100
Message-ID: <20210122153414.1.I28be53e4ce2082b513afd19d77d1430741ac16f3@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_11:2021-01-21,
 2021-01-22 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] clk: stm32mp1: add support of I2C6_K
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

Add support of missing I2C6_K with bit 3 of RCC_MC_APB5ENSETR =
I2C6EN: I2C6 peripheral clocks enable.

This patch allows customer to use I2C6 in SPL or in U-Boot
as other I2C instance, already support in clk driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/clk/clk_stm32mp1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index d4f1048591..8a5bdcb11d 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -549,6 +549,7 @@ static const struct stm32mp1_clk_gate stm32mp1_clk_gate[] = {
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB4ENSETR, 16, USBPHY_K, _USBPHY_SEL),
 
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 2, I2C4_K, _I2C46_SEL),
+	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 3, I2C6_K, _I2C46_SEL),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 8, RTCAPB, _PCLK5),
 	STM32MP1_CLK_SET_CLR(RCC_MP_APB5ENSETR, 20, STGEN_K, _STGEN_SEL),
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
