Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEACA28DCA7
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:17:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7632FC424B2;
	Wed, 14 Oct 2020 09:17:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F7E3C424C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:17:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9CH7u010833; Wed, 14 Oct 2020 11:17:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=mFLn3us+6F8t2i+QUuZDC5MpVy9NvJJ3y/54JfNYUyQ=;
 b=aSRAeFnN/nEf7/ot1FLhk8EvGt9VmXigGMoig2muDzcg9sshNs009y5mB5js9HgO1bPi
 DrClq0Ip3aIsWEQgiknQznrI5Sm+687pY5J5fpNn68dIEC3gYMzzgcsKMBGYjJfwxdKc
 Vz6zI138BF732RPSa+IaEksKbhDmaf0EHyYPpduB5OOEqXWckZ5B8i4yfS7wnvQtwYzn
 cCFpuOtKX69BtYwqiJ7ffMBTxaKtANrdSLu4k1b+VjDi474etGMaPKyMiRpV6Bt3u7gd
 L/blYBPw8g/oQC3hg9wVGpQHSAen9aPzsUWWgRKctjK2HfROcH/kJUGG8rBPIKzvdat2 +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353wd3ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:17:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BA0E10002A;
 Wed, 14 Oct 2020 11:17:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4FBC2A5586;
 Wed, 14 Oct 2020 11:17:20 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:17:20
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:44 +0200
Message-ID: <20201014091646.4233-32-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 31/33] board: st: stm32mp1: migrate trace to
	dev and log macro
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

Change pr_* to dev_ or log_ macro and define LOG_CATEGORY.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 134 +++++++++++++++++------------------
 1 file changed, 65 insertions(+), 69 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 03a19af930..202f782906 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -2,6 +2,9 @@
 /*
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
  */
+
+#define LOG_CATEGORY LOGC_BOARD
+
 #include <common.h>
 #include <adc.h>
 #include <bootm.h>
@@ -106,12 +109,11 @@ int checkboard(void)
 	else
 		mode = "basic";
 
-	printf("Board: stm32mp1 in %s mode", mode);
 	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
 				 &fdt_compat_len);
-	if (fdt_compat && fdt_compat_len)
-		printf(" (%s)", fdt_compat);
-	puts("\n");
+
+	log_info("Board: stm32mp1 in %s mode (%s)\n", mode,
+		 fdt_compat && fdt_compat_len ? fdt_compat : "");
 
 	/* display the STMicroelectronics board identification */
 	if (CONFIG_IS_ENABLED(CMD_STBOARD)) {
@@ -122,12 +124,12 @@ int checkboard(void)
 			ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
 					&otp, sizeof(otp));
 		if (ret > 0 && otp)
-			printf("Board: MB%04x Var%d.%d Rev.%c-%02d\n",
-			       otp >> 16,
-			       (otp >> 12) & 0xF,
-			       (otp >> 4) & 0xF,
-			       ((otp >> 8) & 0xF) - 1 + 'A',
-			       otp & 0xF);
+			log_info("Board: MB%04x Var%d.%d Rev.%c-%02d\n",
+				 otp >> 16,
+				 (otp >> 12) & 0xF,
+				 (otp >> 4) & 0xF,
+				 ((otp >> 8) & 0xF) - 1 + 'A',
+				 otp & 0xF);
 	}
 
 	return 0;
@@ -144,17 +146,16 @@ static void board_key_check(void)
 
 	node = ofnode_path("/config");
 	if (!ofnode_valid(node)) {
-		debug("%s: no /config node?\n", __func__);
+		log_debug("no /config node?\n");
 		return;
 	}
 	if (IS_ENABLED(CONFIG_FASTBOOT)) {
 		if (gpio_request_by_name_nodev(node, "st,fastboot-gpios", 0,
 					       &gpio, GPIOD_IS_IN)) {
-			debug("%s: could not find a /config/st,fastboot-gpios\n",
-			      __func__);
+			log_debug("could not find a /config/st,fastboot-gpios\n");
 		} else {
 			if (dm_gpio_get_value(&gpio)) {
-				puts("Fastboot key pressed, ");
+				log_notice("Fastboot key pressed, ");
 				boot_mode = BOOT_FASTBOOT;
 			}
 
@@ -164,18 +165,17 @@ static void board_key_check(void)
 	if (IS_ENABLED(CONFIG_CMD_STM32PROG)) {
 		if (gpio_request_by_name_nodev(node, "st,stm32prog-gpios", 0,
 					       &gpio, GPIOD_IS_IN)) {
-			debug("%s: could not find a /config/st,stm32prog-gpios\n",
-			      __func__);
+			log_debug("could not find a /config/st,stm32prog-gpios\n");
 		} else {
 			if (dm_gpio_get_value(&gpio)) {
-				puts("STM32Programmer key pressed, ");
+				log_notice("STM32Programmer key pressed, ");
 				boot_mode = BOOT_STM32PROG;
 			}
 			dm_gpio_free(NULL, &gpio);
 		}
 	}
 	if (boot_mode != BOOT_NORMAL) {
-		puts("entering download mode...\n");
+		log_notice("entering download mode...\n");
 		clrsetbits_le32(TAMP_BOOT_CONTEXT,
 				TAMP_BOOT_FORCED_MASK,
 				boot_mode);
@@ -198,8 +198,10 @@ int g_dnl_board_usb_cable_connected(void)
 	ret = uclass_get_device_by_driver(UCLASS_USB_GADGET_GENERIC,
 					  DM_GET_DRIVER(dwc2_udc_otg),
 					  &dwc2_udc_otg);
-	if (!ret)
-		debug("dwc2_udc_otg init failed\n");
+	if (ret) {
+		log_debug("dwc2_udc_otg init failed\n");
+		return ret;
+	}
 
 	return dwc2_udc_B_session_valid(dwc2_udc_otg);
 }
@@ -231,13 +233,12 @@ static int get_led(struct udevice **dev, char *led_string)
 
 	led_name = fdtdec_get_config_string(gd->fdt_blob, led_string);
 	if (!led_name) {
-		pr_debug("%s: could not find %s config string\n",
-			 __func__, led_string);
+		log_debug("could not find %s config string\n", led_string);
 		return -ENOENT;
 	}
 	ret = led_get_by_label(led_name, dev);
 	if (ret) {
-		debug("%s: get=%d\n", __func__, ret);
+		log_debug("get=%d\n", ret);
 		return ret;
 	}
 
@@ -305,7 +306,7 @@ static int board_check_usb_power(void)
 
 	node = ofnode_path("/config");
 	if (!ofnode_valid(node)) {
-		debug("%s: no /config node?\n", __func__);
+		log_debug("no /config node?\n");
 		return -ENOENT;
 	}
 
@@ -319,8 +320,7 @@ static int board_check_usb_power(void)
 		if (adc_count == -ENOENT)
 			return 0;
 
-		pr_err("%s: can't find adc channel (%d)\n", __func__,
-		       adc_count);
+		log_err("can't find adc channel (%d)\n", adc_count);
 
 		return adc_count;
 	}
@@ -329,8 +329,7 @@ static int board_check_usb_power(void)
 		if (ofnode_parse_phandle_with_args(node, "st,adc_usb_pd",
 						   "#io-channel-cells", 0, i,
 						   &adc_args)) {
-			pr_debug("%s: can't find /config/st,adc_usb_pd\n",
-				 __func__);
+			log_debug("can't find /config/st,adc_usb_pd\n");
 			return 0;
 		}
 
@@ -338,16 +337,15 @@ static int board_check_usb_power(void)
 						  &adc);
 
 		if (ret) {
-			pr_err("%s: Can't get adc device(%d)\n", __func__,
-			       ret);
+			log_err("Can't get adc device(%d)\n", ret);
 			return ret;
 		}
 
 		ret = adc_channel_single_shot(adc->name, adc_args.args[0],
 					      &raw);
 		if (ret) {
-			pr_err("%s: single shot failed for %s[%d]!\n",
-			       __func__, adc->name, adc_args.args[0]);
+			log_err("single shot failed for %s[%d]!\n",
+				adc->name, adc_args.args[0]);
 			return ret;
 		}
 		/* Convert to uV */
@@ -356,11 +354,11 @@ static int board_check_usb_power(void)
 				max_uV = uV;
 			if (uV < min_uV)
 				min_uV = uV;
-			pr_debug("%s: %s[%02d] = %u, %d uV\n", __func__,
-				 adc->name, adc_args.args[0], raw, uV);
+			log_debug("%s[%02d] = %u, %d uV\n",
+				  adc->name, adc_args.args[0], raw, uV);
 		} else {
-			pr_err("%s: Can't get uV value for %s[%d]\n",
-			       __func__, adc->name, adc_args.args[0]);
+			log_err("Can't get uV value for %s[%d]\n",
+				adc->name, adc_args.args[0]);
 		}
 	}
 
@@ -374,7 +372,7 @@ static int board_check_usb_power(void)
 	    min_uV <= USB_LOW_THRESHOLD_UV)
 		return 0;
 
-	pr_err("****************************************************\n");
+	log_notice("****************************************************\n");
 
 	/*
 	 * If highest and lowest value are either both below
@@ -386,8 +384,8 @@ static int board_check_usb_power(void)
 	     min_uV > USB_LOW_THRESHOLD_UV) ||
 	     (max_uV <= USB_LOW_THRESHOLD_UV &&
 	     min_uV <= USB_LOW_THRESHOLD_UV)) {
-		pr_err("* ERROR USB TYPE-C connection in unattached mode   *\n");
-		pr_err("* Check that USB TYPE-C cable is correctly plugged *\n");
+		log_notice("* ERROR USB TYPE-C connection in unattached mode   *\n");
+		log_notice("* Check that USB TYPE-C cable is correctly plugged *\n");
 		/* with 125ms interval, led will blink for 17.02 years ....*/
 		nb_blink = U32_MAX;
 	}
@@ -395,14 +393,14 @@ static int board_check_usb_power(void)
 	if (max_uV > USB_LOW_THRESHOLD_UV &&
 	    max_uV <= USB_WARNING_LOW_THRESHOLD_UV &&
 	    min_uV <= USB_LOW_THRESHOLD_UV) {
-		pr_err("*        WARNING 500mA power supply detected       *\n");
+		log_notice("*        WARNING 500mA power supply detected       *\n");
 		nb_blink = 2;
 	}
 
 	if (max_uV > USB_WARNING_LOW_THRESHOLD_UV &&
 	    max_uV <= USB_START_LOW_THRESHOLD_UV &&
 	    min_uV <= USB_LOW_THRESHOLD_UV) {
-		pr_err("*       WARNING 1.5A power supply detected        *\n");
+		log_notice("*       WARNING 1.5A power supply detected        *\n");
 		nb_blink = 3;
 	}
 
@@ -411,14 +409,14 @@ static int board_check_usb_power(void)
 	 * supplies more than 3 Amp, this is not compliant with TypeC specification
 	 */
 	if (max_uV > USB_START_HIGH_THRESHOLD_UV) {
-		pr_err("*      USB TYPE-C charger not compliant with       *\n");
-		pr_err("*                   specification                  *\n");
-		pr_err("****************************************************\n\n");
+		log_notice("*      USB TYPE-C charger not compliant with       *\n");
+		log_notice("*                   specification                  *\n");
+		log_notice("****************************************************\n\n");
 		/* with 125ms interval, led will blink for 17.02 years ....*/
 		nb_blink = U32_MAX;
 	} else {
-		pr_err("*     Current too low, use a 3A power supply!      *\n");
-		pr_err("****************************************************\n\n");
+		log_notice("*     Current too low, use a 3A power supply!      *\n");
+		log_notice("****************************************************\n\n");
 	}
 
 	led_error_blink(nb_blink);
@@ -471,7 +469,7 @@ static void sysconf_init(void)
 						  DM_GET_DRIVER(stm32mp_bsec),
 						  &dev);
 		if (ret) {
-			pr_err("Can't find stm32mp_bsec driver\n");
+			log_err("Can't find stm32mp_bsec driver\n");
 			return;
 		}
 
@@ -494,13 +492,13 @@ static void sysconf_init(void)
 				       syscfg + SYSCFG_IOCTRLSETR);
 
 				if (!otp)
-					pr_err("product_below_2v5=0: HSLVEN protected by HW\n");
+					log_err("product_below_2v5=0: HSLVEN protected by HW\n");
 			} else {
 				if (otp)
-					pr_err("product_below_2v5=1: HSLVEN update is destructive, no update as VDD>2.7V\n");
+					log_err("product_below_2v5=1: HSLVEN update is destructive, no update as VDD>2.7V\n");
 			}
 		} else {
-			debug("VDD unknown");
+			log_debug("VDD unknown");
 		}
 	}
 
@@ -514,7 +512,7 @@ static void sysconf_init(void)
 				 val & SYSCFG_CMPCR_READY,
 				 1000000);
 	if (ret) {
-		pr_err("SYSCFG: I/O compensation failed, timeout.\n");
+		log_err("SYSCFG: I/O compensation failed, timeout.\n");
 		led_error_blink(10);
 	}
 
@@ -533,39 +531,37 @@ static int dk2_i2c1_fix(void)
 
 	node = ofnode_path("/soc/i2c@40012000/hdmi-transmitter@39");
 	if (!ofnode_valid(node)) {
-		pr_debug("%s: no hdmi-transmitter@39 ?\n", __func__);
+		log_debug("no hdmi-transmitter@39 ?\n");
 		return -ENOENT;
 	}
 
 	if (gpio_request_by_name_nodev(node, "reset-gpios", 0,
 				       &hdmi, GPIOD_IS_OUT)) {
-		pr_debug("%s: could not find reset-gpios\n",
-			 __func__);
+		log_debug("could not find reset-gpios\n");
 		return -ENOENT;
 	}
 
 	node = ofnode_path("/soc/i2c@40012000/cs42l51@4a");
 	if (!ofnode_valid(node)) {
-		pr_debug("%s: no cs42l51@4a ?\n", __func__);
+		log_debug("no cs42l51@4a ?\n");
 		return -ENOENT;
 	}
 
 	if (gpio_request_by_name_nodev(node, "reset-gpios", 0,
 				       &audio, GPIOD_IS_OUT)) {
-		pr_debug("%s: could not find reset-gpios\n",
-			 __func__);
+		log_debug("could not find reset-gpios\n");
 		return -ENOENT;
 	}
 
 	/* before power up, insure that HDMI and AUDIO IC is under reset */
 	ret = dm_gpio_set_value(&hdmi, 1);
 	if (ret) {
-		pr_err("%s: can't set_value for hdmi_nrst gpio", __func__);
+		log_err("can't set_value for hdmi_nrst gpio");
 		goto error;
 	}
 	ret = dm_gpio_set_value(&audio, 1);
 	if (ret) {
-		pr_err("%s: can't set_value for audio_nrst gpio", __func__);
+		log_err("can't set_value for audio_nrst gpio");
 		goto error;
 	}
 
@@ -732,7 +728,7 @@ int board_interface_eth_init(struct udevice *dev,
 	case PHY_INTERFACE_MODE_MII:
 		value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
 			SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
-		debug("%s: PHY_INTERFACE_MODE_MII\n", __func__);
+		log_debug("PHY_INTERFACE_MODE_MII\n");
 		break;
 	case PHY_INTERFACE_MODE_GMII:
 		if (eth_clk_sel_reg)
@@ -740,7 +736,7 @@ int board_interface_eth_init(struct udevice *dev,
 				SYSCFG_PMCSETR_ETH_CLK_SEL;
 		else
 			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII;
-		debug("%s: PHY_INTERFACE_MODE_GMII\n", __func__);
+		log_debug("PHY_INTERFACE_MODE_GMII\n");
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		if (eth_ref_clk_sel_reg)
@@ -748,7 +744,7 @@ int board_interface_eth_init(struct udevice *dev,
 				SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
 		else
 			value = SYSCFG_PMCSETR_ETH_SEL_RMII;
-		debug("%s: PHY_INTERFACE_MODE_RMII\n", __func__);
+		log_debug("PHY_INTERFACE_MODE_RMII\n");
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
@@ -759,11 +755,11 @@ int board_interface_eth_init(struct udevice *dev,
 				SYSCFG_PMCSETR_ETH_CLK_SEL;
 		else
 			value = SYSCFG_PMCSETR_ETH_SEL_RGMII;
-		debug("%s: PHY_INTERFACE_MODE_RGMII\n", __func__);
+		log_debug("PHY_INTERFACE_MODE_RGMII\n");
 		break;
 	default:
-		debug("%s: Do not manage %d interface\n",
-		      __func__, interface_type);
+		log_debug("Do not manage %d interface\n",
+			  interface_type);
 		/* Do not manage others interfaces */
 		return -EINVAL;
 	}
@@ -862,14 +858,14 @@ static void board_copro_image_process(ulong fw_image, size_t fw_size)
 
 	if (!rproc_is_initialized())
 		if (rproc_init()) {
-			printf("Remote Processor %d initialization failed\n",
-			       id);
+			log_err("Remote Processor %d initialization failed\n",
+				id);
 			return;
 		}
 
 	ret = rproc_load(id, fw_image, fw_size);
-	printf("Load Remote Processor %d with data@addr=0x%08lx %u bytes:%s\n",
-	       id, fw_image, fw_size, ret ? " Failed!" : " Success!");
+	log_err("Load Remote Processor %d with data@addr=0x%08lx %u bytes:%s\n",
+		id, fw_image, fw_size, ret ? " Failed!" : " Success!");
 
 	if (!ret)
 		rproc_start(id);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
