Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6AC28FF16
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Oct 2020 09:29:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4B98C3FAD5;
	Fri, 16 Oct 2020 07:29:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 486DEC32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Oct 2020 07:29:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09G7RQIJ026951; Fri, 16 Oct 2020 09:29:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Tn5JvycvteMOhfi2O3jF4KlHhSD6A7WqJemgDyppeA0=;
 b=dwuqQO8ICq6id1NuMhZJqgRqjs0233b/J7oyz86PwKe4l8v5lh2w00cZb85IBMj330NU
 KR18lpL0BtnkKJyvFyLGBawspPHj+HbarvAbWSjYD1Zs3lAG11uxCCzQcveVFNhgatys
 psFKmoTMrEW41Arl/7xDxMAbTkDMVVuf/Dk/Z4aSVaW3Obte7rv1ip7ejRnd69uPllgd
 LOyQtuwa3d7nre3vqlWEEmFV5NA+FhDGQsyhefS0Hz8eHIEiaVr9YgexpliYwZ/s9xtK
 0AfUrDiEEwfgCkITn9ggHN0DDOpy6xzevsRE8nUwofjLrT+DgaLwLFGxzc7zQ44yWZwr LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34356eshha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Oct 2020 09:29:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6422110002A;
 Fri, 16 Oct 2020 09:29:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47C8B2BEDD6;
 Fri, 16 Oct 2020 09:29:11 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct 2020 09:29:10
 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 16 Oct 2020 09:28:59 +0200
Message-ID: <20201016092843.1.I5e39774367f1ea4e7c390f69ab3f86a79b66b8ce@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-16_02:2020-10-16,
 2020-10-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] board: stm32pm1: update USB-C power detection
	algorithm on DK boards
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

USB-C power supply which are Power Delivery compliant (USB-PD) are able
to provide different voltage/current (for example 5V/3A 9V/3A 12V/2.25A...)

In this case, the power supply need to negotiate the voltage/current to
use with the device using CC1/CC2 USB-C signals.

If this negotiation occurs during ADC measurement (done also on CC1/CC2
USB-C signals) some ADC acquisition can be corrupted which cause wrong
power supply current detection.

To avoid this, the power supply current detection algorithm is updated
as following:
  - perform an ADC measurement, if a 3A current is detected, continue the
    boot process.
  - else, wait 20ms (max tPDDebounce duration) to ensure that USB-PD
    negotiation is done and perform another ADC measurement.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 106 +++++++++++++++++++++--------------
 1 file changed, 63 insertions(+), 43 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 202f782906c2..cabd0e09f11d 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -289,41 +289,13 @@ static void __maybe_unused led_error_blink(u32 nb_blink)
 		hang();
 }
 
-static int board_check_usb_power(void)
+static int adc_measurement(ofnode node, int adc_count, int *min_uV, int *max_uV)
 {
 	struct ofnode_phandle_args adc_args;
 	struct udevice *adc;
-	ofnode node;
 	unsigned int raw;
-	int max_uV = 0;
-	int min_uV = USB_START_HIGH_THRESHOLD_UV;
-	int ret, uV, adc_count;
-	u32 nb_blink;
-	u8 i;
-
-	if (!IS_ENABLED(CONFIG_ADC))
-		return -ENODEV;
-
-	node = ofnode_path("/config");
-	if (!ofnode_valid(node)) {
-		log_debug("no /config node?\n");
-		return -ENOENT;
-	}
-
-	/*
-	 * Retrieve the ADC channels devices and get measurement
-	 * for each of them
-	 */
-	adc_count = ofnode_count_phandle_with_args(node, "st,adc_usb_pd",
-						   "#io-channel-cells", 0);
-	if (adc_count < 0) {
-		if (adc_count == -ENOENT)
-			return 0;
-
-		log_err("can't find adc channel (%d)\n", adc_count);
-
-		return adc_count;
-	}
+	int ret, uV;
+	int i;
 
 	for (i = 0; i < adc_count; i++) {
 		if (ofnode_parse_phandle_with_args(node, "st,adc_usb_pd",
@@ -350,10 +322,10 @@ static int board_check_usb_power(void)
 		}
 		/* Convert to uV */
 		if (!adc_raw_to_uV(adc, raw, &uV)) {
-			if (uV > max_uV)
-				max_uV = uV;
-			if (uV < min_uV)
-				min_uV = uV;
+			if (uV > *max_uV)
+				*max_uV = uV;
+			if (uV < *min_uV)
+				*min_uV = uV;
 			log_debug("%s[%02d] = %u, %d uV\n",
 				  adc->name, adc_args.args[0], raw, uV);
 		} else {
@@ -362,18 +334,66 @@ static int board_check_usb_power(void)
 		}
 	}
 
+	return 0;
+}
+
+static int board_check_usb_power(void)
+{
+	ofnode node;
+	int max_uV = 0;
+	int min_uV = USB_START_HIGH_THRESHOLD_UV;
+	int adc_count, ret;
+	u32 nb_blink;
+	u8 i;
+
+	node = ofnode_path("/config");
+	if (!ofnode_valid(node)) {
+		log_debug("no /config node?\n");
+		return -ENOENT;
+	}
+
 	/*
-	 * If highest value is inside 1.23 Volts and 2.10 Volts, that means
-	 * board is plugged on an USB-C 3A power supply and boot process can
-	 * continue.
+	 * Retrieve the ADC channels devices and get measurement
+	 * for each of them
 	 */
-	if (max_uV > USB_START_LOW_THRESHOLD_UV &&
-	    max_uV <= USB_START_HIGH_THRESHOLD_UV &&
-	    min_uV <= USB_LOW_THRESHOLD_UV)
-		return 0;
+	adc_count = ofnode_count_phandle_with_args(node, "st,adc_usb_pd",
+						   "#io-channel-cells", 0);
+	if (adc_count < 0) {
+		if (adc_count == -ENOENT)
+			return 0;
 
-	log_notice("****************************************************\n");
+		log_err("Can't find adc channel (%d)\n", adc_count);
+
+		return adc_count;
+	}
+
+	/* perform maximum of 2 ADC measurements to detect power supply current */
+	for (i = 0; i < 2; i++) {
+		if (IS_ENABLED(CONFIG_ADC))
+			ret = adc_measurement(node, adc_count, &min_uV, &max_uV);
+		else
+			ret = -ENODEV;
 
+		if (ret)
+			return ret;
+
+		/*
+		 * If highest value is inside 1.23 Volts and 2.10 Volts, that means
+		 * board is plugged on an USB-C 3A power supply and boot process can
+		 * continue.
+		 */
+		if (max_uV > USB_START_LOW_THRESHOLD_UV &&
+		    max_uV <= USB_START_HIGH_THRESHOLD_UV &&
+		    min_uV <= USB_LOW_THRESHOLD_UV)
+			return 0;
+
+		if (i == 0) {
+			log_err("Previous ADC measurements was not the one expected, retry in 20ms\n");
+			mdelay(20);  /* equal to max tPDDebounce duration (min 10ms - max 20ms) */
+		}
+	}
+
+	log_notice("****************************************************\n");
 	/*
 	 * If highest and lowest value are either both below
 	 * USB_LOW_THRESHOLD_UV or both above USB_LOW_THRESHOLD_UV, that
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
