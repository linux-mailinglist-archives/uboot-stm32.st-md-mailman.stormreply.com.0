Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB023C2040
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Jul 2021 09:53:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F022C3FAD6;
	Fri,  9 Jul 2021 07:53:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5E31C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jul 2021 07:53:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1697r4F0026526; Fri, 9 Jul 2021 09:53:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=bu1asaCFXwWFEbjlPdOlNTCi+D9b9b/UtXxvayquT1M=;
 b=aQH4neqhidWqEgru+Lq2vBcZkcbeUm/i2xcyaYizCyDCmB2uJ38r8noUMEGemi08vd/i
 6UUgd5p6TOWsv9NXnYJZQzkt7J5zWUf7hhcybBivt9axT7jg9Mwnw90cO3Dpo2JQO/Dj
 Tg3W4YNCg8C68vu6wgvLSt/mdPH0hXTwNDt7W73EXWVcL5lyq53eTROwtKPScJrjUrmU
 yeqNmqPVxErCVgodiSqLO16PuV+Hpibk6sywWyW5+fhYxjJk9QSV9Mu7fR7Xe8NP/dB2
 bh3uuIVe2+Dzh98ckKnk9nJ2OTdYyLg0sM90Pjk69Piqv/IBO3gVGwsBjt3VCAqahSDu ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39ph72ghnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 09:53:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0DE20100034;
 Fri,  9 Jul 2021 09:53:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E630A216EDE;
 Fri,  9 Jul 2021 09:53:39 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul 2021 09:53:39
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 9 Jul 2021 09:53:37 +0200
Message-ID: <20210709095322.1.I3841c4ea8add371529df3e03de5439659a69f38b@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_03:2021-07-09,
 2021-07-09 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] stm32mp1: add pull-up for gpio button PA13
	and PA14
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

When a push-button is released and PA13/PA14 are defined as input (high-Z)
the LED should not be active as the circuit is open but a small current
leak through PCB or push-button close the circuit and allows a small LED
bias giving erroneous level voltage.

So it is recommended to activate an internal pull-up in order to clearly
fix the voltage at PA13/PA14 when button is released and to wait
a short delay before to read the GPIO value only when the pull-up is
correctly configured.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 4 ++--
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 4 ++--
 board/st/stm32mp1/stm32mp1.c             | 2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 6787619290..d44da7566f 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -18,8 +18,8 @@
 		u-boot,error-led = "error";
 		u-boot,mmc-env-partition = "ssbl";
 		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
-		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
-		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
+		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	};
 
 	firmware {
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index f3002e995b..3b94218b2f 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -18,8 +18,8 @@
 		u-boot,boot-led = "heartbeat";
 		u-boot,error-led = "error";
 		u-boot,mmc-env-partition = "ssbl";
-		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
-		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
+		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	};
 
 	firmware {
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 18b8870269..e1796e7e31 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -155,6 +155,7 @@ static void board_key_check(void)
 					       &gpio, GPIOD_IS_IN)) {
 			log_debug("could not find a /config/st,fastboot-gpios\n");
 		} else {
+			udelay(20);
 			if (dm_gpio_get_value(&gpio)) {
 				log_notice("Fastboot key pressed, ");
 				boot_mode = BOOT_FASTBOOT;
@@ -168,6 +169,7 @@ static void board_key_check(void)
 					       &gpio, GPIOD_IS_IN)) {
 			log_debug("could not find a /config/st,stm32prog-gpios\n");
 		} else {
+			udelay(20);
 			if (dm_gpio_get_value(&gpio)) {
 				log_notice("STM32Programmer key pressed, ");
 				boot_mode = BOOT_STM32PROG;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
