Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3316FFD85
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 18:10:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2793DC35E06
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 16:10:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06E3AC35E04
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 16:10:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UFpPgN005729; Tue, 30 Apr 2019 18:10:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=tXpfOABoZbqARWWRDN0ERqdpzeKj2nq6pxkcn4uuHFw=;
 b=i0U0jXJR00PAMso0eaS5WeSyu/tx5XEiKvK35buYDc72HEWBHPsUGChF9W3TdaWnPdiH
 8FFl08VsxoBpAj4VyNttjHZh2apyY//Ids/y9EOYowkNI5bxSLAJUHbn8cmLKOGwXLNr
 o7pU1+odqdB9aDVpQ2/RB2sodzuDBHaGrBC4KyB3rxlxu1JS7vJQQRvlDvdYIPtnvNx2
 0lBwYul7XY/G7BoBeGC/aXGz6BsDGKlOzs6xHWwtgdh57DGV8Lx3LzZyWi1v1skpYHrL
 NSPQHlM3wg10vQHB62mj552ODiVqc+dH3n+axp7ma0JxTZ1q+PvhCi2XPW93Aj5CrLYK zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s61r0f2kx-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Apr 2019 18:10:51 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88B263A;
 Tue, 30 Apr 2019 16:10:50 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7036E299F;
 Tue, 30 Apr 2019 16:10:50 +0000 (GMT)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 30 Apr 2019 18:10:49 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Apr 2019 18:09:38 +0200
Message-ID: <1556640578-28033-1-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] board: stm32mp1: Update power supply check
	via USB TYPE-C
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

Add 2 new checks:
 - detect when USB TYPE-C cable is not plugged correctly.
   In this case, GND and VBUS pins are connected but not CC1
   and CC2 pins.

 - detect is an USB Type-C charger supplies more than 3 Amps
   which is not compliant with the USB Type-C specification

In these 2 situations, stop the boot process and let red led
blinks forever.

   V cc1      |   V cc2     | power supply | red led | console message
range (Volts) |range (Volts)|   (Amps)     | blinks  |
--------------|-------------|--------------|---------|-----------------------------------
    > 2.15    |   < 0.2     |     > 3      | for ever| USB TYPE-C charger not compliant with specification
[2.15 - 1.23[ |   < 0.2     |     3        |   NO    | NO
[1.23 - 0.66[ |   < 0.2     |     1.5      | 3 times | WARNING 1.5A power supply detected
[0.66 - 0]    |   < 0.2     |     0.5      | 2 times | WARNING 500mA power supply detected
    < 0.2     |   < 0.2     |              | for ever| ERROR USB TYPE-C connection in unattached mode
    > 0.2     |   > 0.2     |              | for ever| ERROR USB TYPE-C connection in unattached mode

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 69 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 56 insertions(+), 13 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 76917b0..8c591a5 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -60,9 +60,10 @@
  */
 DECLARE_GLOBAL_DATA_PTR;
 
+#define USB_LOW_THRESHOLD_UV		200000
 #define USB_WARNING_LOW_THRESHOLD_UV	660000
 #define USB_START_LOW_THRESHOLD_UV	1230000
-#define USB_START_HIGH_THRESHOLD_UV	2100000
+#define USB_START_HIGH_THRESHOLD_UV	2150000
 
 int checkboard(void)
 {
@@ -263,9 +264,10 @@ static int board_check_usb_power(void)
 	ofnode node;
 	unsigned int raw;
 	int max_uV = 0;
+	int min_uV = USB_START_HIGH_THRESHOLD_UV;
 	int ret, uV, adc_count;
-	u8 i, nb_blink;
-
+	u32 nb_blink;
+	u8 i;
 	node = ofnode_path("/config");
 	if (!ofnode_valid(node)) {
 		debug("%s: no /config node?\n", __func__);
@@ -317,6 +319,8 @@ static int board_check_usb_power(void)
 		if (!adc_raw_to_uV(adc, raw, &uV)) {
 			if (uV > max_uV)
 				max_uV = uV;
+			if (uV < min_uV)
+				min_uV = uV;
 			pr_debug("%s: %s[%02d] = %u, %d uV\n", __func__,
 				 adc->name, adc_args.args[0], raw, uV);
 		} else {
@@ -331,27 +335,66 @@ static int board_check_usb_power(void)
 	 * continue.
 	 */
 	if (max_uV > USB_START_LOW_THRESHOLD_UV &&
-	    max_uV < USB_START_HIGH_THRESHOLD_UV)
+	    max_uV <= USB_START_HIGH_THRESHOLD_UV &&
+	    min_uV <= USB_LOW_THRESHOLD_UV)
 		return 0;
 
-	/* Display warning message and make u-boot,error-led blinking */
-	pr_err("\n*******************************************\n");
+	pr_err("****************************************************\n");
+
+	/*
+	 * If highest and lowest value are either both below
+	 * USB_LOW_THRESHOLD_UV or both above USB_LOW_THRESHOLD_UV, that
+	 * means USB TYPE-C is in unattached mode, this is an issue, make
+	 * u-boot,error-led blinking and stop boot process.
+	 */
+	if ((max_uV > USB_LOW_THRESHOLD_UV &&
+	     min_uV > USB_LOW_THRESHOLD_UV) ||
+	     (max_uV <= USB_LOW_THRESHOLD_UV &&
+	     min_uV <= USB_LOW_THRESHOLD_UV)) {
+		pr_err("* ERROR USB TYPE-C connection in unattached mode   *\n");
+		pr_err("* Check that USB TYPE-C cable is correctly plugged *\n");
+		/* with 125ms interval, led will blink for 17.02 years ....*/
+		nb_blink = U32_MAX;
+	}
 
-	if (max_uV < USB_WARNING_LOW_THRESHOLD_UV) {
-		pr_err("*   WARNING 500mA power supply detected   *\n");
+	if (max_uV > USB_LOW_THRESHOLD_UV &&
+	    max_uV <= USB_WARNING_LOW_THRESHOLD_UV &&
+	    min_uV <= USB_LOW_THRESHOLD_UV) {
+		pr_err("*        WARNING 500mA power supply detected       *\n");
 		nb_blink = 2;
-	} else {
-		pr_err("* WARNING 1.5A power supply detected      *\n");
+	}
+
+	if (max_uV > USB_WARNING_LOW_THRESHOLD_UV &&
+	    max_uV <= USB_START_LOW_THRESHOLD_UV &&
+	    min_uV <= USB_LOW_THRESHOLD_UV) {
+		pr_err("*       WARNING 1.5mA power supply detected        *\n");
 		nb_blink = 3;
 	}
 
-	pr_err("* Current too low, use a 3A power supply! *\n");
-	pr_err("*******************************************\n\n");
+	/*
+	 * If highest value is above 2.15 Volts that means that the USB TypeC
+	 * supplies more than 3 Amp, this is not compliant with TypeC specification
+	 */
+	if (max_uV > USB_START_HIGH_THRESHOLD_UV) {
+		pr_err("*      USB TYPE-C charger not compliant with       *\n");
+		pr_err("*                   specification                  *\n");
+		pr_err("****************************************************\n\n");
+		/* with 125ms interval, led will blink for 17.02 years ....*/
+		nb_blink = U32_MAX;
+	} else {
+		pr_err("*     Current too low, use a 3A power supply!      *\n");
+		pr_err("****************************************************\n\n");
+	}
 
 	ret = get_led(&led, "u-boot,error-led");
-	if (ret)
+	if (ret) {
+		/* in unattached case, the boot process must be stopped */
+		if (nb_blink == U32_MAX)
+			hang();
 		return ret;
+	}
 
+	/* make u-boot,error-led blinking */
 	for (i = 0; i < nb_blink * 2; i++) {
 		led_set_state(led, LEDST_TOGGLE);
 		mdelay(125);
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
