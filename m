Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B27AF91
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6771DC35E02
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDFBBC35E02
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHG2pS001949; Tue, 30 Jul 2019 19:17:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=oMTW9fIu+KFrd22iy3qkSTCKN4frrnuAKf0t7rL1LbA=;
 b=0+Z5+AuzEekL+arPcqXGMQYp1NGMIBwrAV4BtuwEQ7PjvH29dCtjbIdQpmdp0N6Xa303
 q1gTPQMH+3loKnFQV7kJ8WtXSZK3LUEdQ86/2B6hwpDNpdZzduyrd+TTxzdQyADHEHcA
 lEH7Voz+67Mg2iHMjRmj2kerJJlDcsHI4eSSG81HWJ/ACPJMlWFmVinXWOdZfTL/iGiS
 UG+Vi+1X+xbx5bIZ3Yd3QuFBzmqjA4scuYO9bOmeAqXSONyBsule8Uy0LZQbBun1CdEa
 fvpGA+UKNx6pcxlnlT6g4vv/QjRFRC9l7MkLAq3IG3kCzLFkflOfPPrXw2vMOA5YXxPm /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4actx-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D6AF31;
 Tue, 30 Jul 2019 17:17:35 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 25009CEA01;
 Tue, 30 Jul 2019 19:17:35 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:35 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:34
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:38 +0200
Message-ID: <1564507016-16570-31-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 30/48] stm32mp1: board: enable v1v2_hdmi and
	v3v3_hdmi regulator on dk2 boot
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

As for Audio codec IC, HDMI IC is not "IO safe".
HDMI regulators (v3v3 and v1v2) must be enabled to allow
I2C1 bus usage. HDMI IC must be under reset during power up
and keep HDMI and AUDIO devices in reset while they are not
used in U-Boot to keep them in low power mode
(each device can be kept in reset independently keeping their
power supplies ON until kernel).

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi |  6 +++
 board/st/stm32mp1/Kconfig                |  4 ++
 board/st/stm32mp1/stm32mp1.c             | 70 ++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi b/arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi
index 06ef3a4..18ac1e3 100644
--- a/arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi
@@ -4,3 +4,9 @@
  */
 
 #include "stm32mp157a-dk1-u-boot.dtsi"
+
+&i2c1 {
+	hdmi-transmitter@39 {
+		reset-gpios = <&gpioa 10 GPIO_ACTIVE_LOW>;
+	};
+};
diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
index 87216c0..4fa2360 100644
--- a/board/st/stm32mp1/Kconfig
+++ b/board/st/stm32mp1/Kconfig
@@ -22,4 +22,8 @@ config CMD_STBOARD
 	  This compile the stboard command to
 	  read and write the board in the OTP.
 
+config TARGET_STM32MP157C_DK2
+	bool "support of STMicroelectronics STM32MP157C-DK2 Discovery Board"
+	default y
+
 endif
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index ad3db31..2837e9a 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -504,6 +504,73 @@ static void sysconf_init(void)
 #endif
 }
 
+#ifdef CONFIG_DM_REGULATOR
+/* Fix to make I2C1 usable on DK2 for touchscreen usage in kernel */
+static int dk2_i2c1_fix(void)
+{
+	ofnode node;
+	struct gpio_desc hdmi, audio;
+	int ret = 0;
+
+	node = ofnode_path("/soc/i2c@40012000/hdmi-transmitter@39");
+	if (!ofnode_valid(node)) {
+		pr_debug("%s: no hdmi-transmitter@39 ?\n", __func__);
+		return -ENOENT;
+	}
+
+	if (gpio_request_by_name_nodev(node, "reset-gpios", 0,
+				       &hdmi, GPIOD_IS_OUT)) {
+		pr_debug("%s: could not find reset-gpios\n",
+			 __func__);
+		return -ENOENT;
+	}
+
+	node = ofnode_path("/soc/i2c@40012000/cs42l51@4a");
+	if (!ofnode_valid(node)) {
+		pr_debug("%s: no cs42l51@4a ?\n", __func__);
+		return -ENOENT;
+	}
+
+	if (gpio_request_by_name_nodev(node, "reset-gpios", 0,
+				       &audio, GPIOD_IS_OUT)) {
+		pr_debug("%s: could not find reset-gpios\n",
+			 __func__);
+		return -ENOENT;
+	}
+
+	/* before power up, insure that HDMI and AUDIO IC is under reset */
+	ret = dm_gpio_set_value(&hdmi, 1);
+	if (ret) {
+		pr_err("%s: can't set_value for hdmi_nrst gpio", __func__);
+		goto error;
+	}
+	ret = dm_gpio_set_value(&audio, 1);
+	if (ret) {
+		pr_err("%s: can't set_value for audio_nrst gpio", __func__);
+		goto error;
+	}
+
+	/* power-up audio IC */
+	regulator_autoset_by_name("v1v8_audio", NULL);
+
+	/* power-up HDMI IC */
+	regulator_autoset_by_name("v1v2_hdmi", NULL);
+	regulator_autoset_by_name("v3v3_hdmi", NULL);
+
+error:
+	return ret;
+}
+
+static bool board_is_dk2(void)
+{
+	if (CONFIG_IS_ENABLED(TARGET_STM32MP157C_DK2) &&
+	    of_machine_is_compatible("st,stm32mp157c-dk2"))
+		return true;
+
+	return false;
+}
+#endif
+
 /* board dependent setup after realloc */
 int board_init(void)
 {
@@ -522,6 +589,9 @@ int board_init(void)
 	board_key_check();
 
 #ifdef CONFIG_DM_REGULATOR
+	if (board_is_dk2())
+		dk2_i2c1_fix();
+
 	regulators_enable_boot_on(_DEBUG);
 #endif
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
