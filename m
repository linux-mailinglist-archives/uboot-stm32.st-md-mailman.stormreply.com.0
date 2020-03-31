Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB0199AD1
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:05:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0437C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:05:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54294C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:05:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VG4lxt027840; Tue, 31 Mar 2020 18:05:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=jzj5O0u/XMAhGqqMRvcojgHjKbibUviV30Mhzg9dpVY=;
 b=ChrS9S7fnpnaNhsF98IAEYhwXo1D7sIRfX2x1t8Pz76eP1ikh5+IPVJ88Yo1ByvY9LeN
 fAJGTwkO95Yhbcrx5AaIEbCvUaxWAB+q5TX2E5R5n8G9vIZCOh3JFrOgeaBBpoCKv+Mt
 AgC58QRZZBiYv3V7ZPSUCj7g8AFzRNTErKAt/JeZ8HCdZgVzCRjW74oi0eFI9wVTV1V4
 SW9e+PIsid0Zww92KcTtTSffmx19PF1xgPXLDcignHPCfQWKXfy/nwgfvNs/u3S4UcAV
 Xc6mfs8+V1+tfcCWGt9v9CYH0bJIlXregTmwPSzEitrNRRwMHnICZU9QpjiZfoBHXqqo dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301xbmfyue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 18:05:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6687C100038;
 Tue, 31 Mar 2020 18:05:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5AEDE2BEC6E;
 Tue, 31 Mar 2020 18:05:01 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 31 Mar 2020 18:05:00 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 31 Mar 2020 18:04:26 +0200
Message-ID: <20200331180330.9.I5d296f8fd82b60a592b51029e7e420672d0e855b@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 09/16] board: stm32mp1: gt9147 IRQ before
	reset on EV1
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

Software workaround for I2C issue on EV1 board,
configure the IRQ line for touchscreen before LCD reset
to fix the used I2C address.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 6ca47509b3..52881adef7 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -626,6 +626,44 @@ static bool board_is_dk2(void)
 }
 #endif
 
+static bool board_is_ev1(void)
+{
+	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15x) &&
+	    (of_machine_is_compatible("st,stm32mp157a-ev1") ||
+	     of_machine_is_compatible("st,stm32mp157c-ev1") ||
+	     of_machine_is_compatible("st,stm32mp157d-ev1") ||
+	     of_machine_is_compatible("st,stm32mp157f-ev1")))
+		return true;
+
+	return false;
+}
+
+/* touchscreen driver: only used for pincontrol configuration */
+static const struct udevice_id goodix_ids[] = {
+	{ .compatible = "goodix,gt9147", },
+	{ }
+};
+
+U_BOOT_DRIVER(goodix) = {
+	.name		= "goodix",
+	.id		= UCLASS_NOP,
+	.of_match	= goodix_ids,
+};
+
+static int board_ev1_init(void)
+{
+	struct udevice *dev;
+	int ret;
+
+	/* configure IRQ line on EV1 for touchscreen before LCD reset */
+	ret = uclass_get_device_by_driver(UCLASS_NOP, DM_GET_DRIVER(goodix),
+					  &dev);
+	if (ret)
+		debug("goodix init failed: %d\n", ret);
+
+	return ret;
+}
+
 /* board dependent setup after realloc */
 int board_init(void)
 {
@@ -643,6 +681,9 @@ int board_init(void)
 
 	board_key_check();
 
+	if (board_is_ev1())
+		board_ev1_init();
+
 #ifdef CONFIG_DM_REGULATOR
 	if (board_is_dk2())
 		dk2_i2c1_fix();
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
