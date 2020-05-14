Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEC11D302C
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 14:45:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BF90C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 12:45:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D7E0C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 12:45:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EChACT002849; Thu, 14 May 2020 14:44:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=WFYN6Qac+VHHq/zdh8Ev6Sza3eiuDxzAw4jWF5Z7L4w=;
 b=uH9B2orkKCJwhqA931Db01weW8oMIYeTeVWNm/cFemwCLO5pIkjzO+k5yoOCAkyMR/z+
 egapBMQZ6TlEU3ePr3J268Exr9qm6CvBKAkK6lZETZ+xqEWIMlGlIRShMBnszDjEXZ7T
 X7NglHWmuucbbNmIJIZGWGO1Dly6x3Vw8kHXJ12Neu/EXtGQtQFZ4wwgm+UhPRPZ9/Lu
 msFAkx7FWagN/lTsYzbk7zSeJp3/6DB6gyNtpJbBnraLjzODTpEsX2DfxSrA96i/nvNy
 tKnCQ0RDMcxAQpct80HFcGrIUtQJu2trMXOoza7JIg/vWqxAx7F8kGA/hn5+GDJfj//y +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vykakj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 14:44:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3088410002A;
 Thu, 14 May 2020 14:44:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14F222B8A2D;
 Thu, 14 May 2020 14:44:53 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 14 May 2020 14:44:52 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 14 May 2020 14:44:40 +0200
Message-ID: <20200514124441.14027-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_03:2020-05-14,
 2020-05-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] net: dwc_eth_qos: update the compatible
	supported for STM32
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

Update the compatible associated with the STM32 MPU glue
in the DWC ethernet driver.

The supported compatible is the specific "st,stm32mp1-dwmac"
as indicated in Linux binding
Documentation/devicetree/bindings/net/stm32-dwmac.txt
and not the "snps,dwmac-4.20a" only used to the select IP
version.

This glue is implemented in Linux kernel in:
drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c

For information in stm32mp151.dtsi, the 2 compatibles are
supported:

ethernet0: ethernet@5800a000 {
	compatible = "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
	...
};

Serie-cc: Christophe ROULLIER <christophe.roullier@st.com>
Serie-cc: David Wu <david.wu@rock-chips.com>
Serie-cc: marex

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/net/dwc_eth_qos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index f67c5f4570..5e7ad6c658 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -2166,7 +2166,7 @@ static const struct udevice_id eqos_ids[] = {
 		.data = (ulong)&eqos_tegra186_config
 	},
 	{
-		.compatible = "snps,dwmac-4.20a",
+		.compatible = "st,stm32mp1-dwmac",
 		.data = (ulong)&eqos_stm32_config
 	},
 	{
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
