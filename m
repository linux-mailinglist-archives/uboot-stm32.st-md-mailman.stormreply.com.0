Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 441F1C039BD
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Oct 2025 23:49:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A9AAC5EC7C;
	Thu, 23 Oct 2025 21:49:13 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 726FEC5EC79
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 21:49:12 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ct06c0BkVz9v4L;
 Thu, 23 Oct 2025 23:49:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761256152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kP+o7fkimcdmDGMdmXRK571uONr3jO/wq3U8humkhvM=;
 b=N0HcU+EowQipGusMRPU2dvpBZDMZkmMWCyztJxQin5B4kVGxoCEMFIzJ5R0JfiU6bBumZT
 yL1md/nu4MdlorxLxxipijP24I9iUwKwV1bukKATfCFbVk9Y07jjoWFmvIfSgYohJwYlP3
 iSUaNTnTHQxtqmHIEJPkVY5JuzjtkgYpWylfrRVOCQcswpygNqvK1erWd/fTm0udpNyoFK
 4treJlWmq8QKYhLZ9HFfyB8ZcVyrQOwAaYrz5wblaBsCm1Y/jT40LjFv2bd0I0KTMrJ8zj
 4++yDxTNg9yiVZm6JZgu7oADNz0g4EeN+oAPHA7/YTNgWLz2akzaHlqcQICIRw==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=W9yf02vk;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761256149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kP+o7fkimcdmDGMdmXRK571uONr3jO/wq3U8humkhvM=;
 b=W9yf02vkTuQHjfZWjOpS7GNP1QTOUAKA2G31ivIod1fWryIp6+7AYb7N1IvzRxjNlny7QQ
 g7Iy8s9+jJyJYC5gF+RUQeT1lIIWXkFCryulzLjFgc5gvvlr36az6tBZmrV/J7Q7pndeRu
 /1Udou6qNSd3CAW89dcB0SKSEXlhlJ1b8+wgpMDJomyYVlVzwaW9lN6/vQYIF2u7/mSxVJ
 Mphr49hy2zB2YNycp6Ev8Xbe5tebCOUsMlh8mcmPyfBr8/+TeGqkSmQUPMQa6Izp/jxsJs
 6LOw95/ewj8EBMXg4VJWCxNPESX926mFrJT4OgHzOZ1kSiZ8aCS/L2ADSc4CZA==
To: u-boot@lists.denx.de
Date: Thu, 23 Oct 2025 23:48:25 +0200
Message-ID: <20251023214855.181410-2-marek.vasut@mailbox.org>
In-Reply-To: <20251023214855.181410-1-marek.vasut@mailbox.org>
References: <20251023214855.181410-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: 9xsjscay851rtnym54oio8r164trycp6
X-MBO-RS-ID: b5351ac27350787d70e
X-Rspamd-Queue-Id: 4ct06c0BkVz9v4L
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/3] ARM: stm32: Read values from M24256
	write-lockable page on STM32MP13xx DHCOR
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

The STM32MP13xx DHCOR SoM is populated with M24256 EEPROM that contains
an additional write-lockable page called ID page, which is populated with
a structure containing ethernet MAC addresses, DH item number and DH serial
number.

Read out the MAC address from the WL page between higher priority SoC fuses
and lower priority plain EEPROM storage area. Read out the DH item and serial
numbers and set environment variables accordingly.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi |  1 +
 board/dhelectronics/dh_stm32mp1/board.c    | 51 ++++++++++++++++++----
 2 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
index 5ca0258e3ff..bedb7c600d5 100644
--- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
@@ -10,6 +10,7 @@
 / {
 	aliases {
 		eeprom0 = &eeprom0;
+		eeprom0wl = &eeprom0wl;
 	};
 
 	config {
diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index a9b1a0f2c34..065d2f338c2 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -119,7 +119,7 @@ static bool dh_stm32_mac_is_in_ks8851(void)
 	return false;
 }
 
-static int dh_stm32_setup_ethaddr(void)
+static int dh_stm32_setup_ethaddr(struct eeprom_id_page *eip)
 {
 	unsigned char enetaddr[6];
 
@@ -129,13 +129,19 @@ static int dh_stm32_setup_ethaddr(void)
 	if (dh_get_mac_is_enabled("ethernet0"))
 		return 0;
 
+	if (!dh_get_value_from_eeprom_buffer(DH_MAC0, enetaddr, sizeof(enetaddr), eip))
+		goto out;
+
 	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0"))
-		return eth_env_set_enetaddr("ethaddr", enetaddr);
+		goto out;
 
 	return -ENXIO;
+
+out:
+	return eth_env_set_enetaddr("ethaddr", enetaddr);
 }
 
-static int dh_stm32_setup_eth1addr(void)
+static int dh_stm32_setup_eth1addr(struct eeprom_id_page *eip)
 {
 	unsigned char enetaddr[6];
 
@@ -148,20 +154,47 @@ static int dh_stm32_setup_eth1addr(void)
 	if (dh_stm32_mac_is_in_ks8851())
 		return 0;
 
-	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0")) {
-		enetaddr[5]++;
-		return eth_env_set_enetaddr("eth1addr", enetaddr);
-	}
+	if (!dh_get_value_from_eeprom_buffer(DH_MAC1, enetaddr, sizeof(enetaddr), eip))
+		goto out;
+
+	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0"))
+		goto increment_out;
 
 	return -ENXIO;
+
+increment_out:
+	enetaddr[5]++;
+
+out:
+	return eth_env_set_enetaddr("eth1addr", enetaddr);
 }
 
 int setup_mac_address(void)
 {
-	if (dh_stm32_setup_ethaddr())
+	u8 eeprom_buffer[DH_EEPROM_ID_PAGE_MAX_SIZE] = { 0 };
+	struct eeprom_id_page *eip = (struct eeprom_id_page *)eeprom_buffer;
+	int ret;
+
+	ret = dh_read_eeprom_id_page(eeprom_buffer, "eeprom0wl");
+	if (ret) {
+		/*
+		 * The EEPROM ID page is available on SoM rev. 200 and greater.
+		 * For SoM rev. 100 the return value will be -ENODEV. Suppress
+		 * the error message for that, because the absence cannot be
+		 * treated as an error.
+		 */
+		if (ret != -ENODEV)
+			printf("%s: Cannot read valid data from EEPROM ID page! ret = %d\n",
+			       __func__, ret);
+		eip = NULL;
+	} else {
+		dh_add_item_number_and_serial_to_env(eip);
+	}
+
+	if (dh_stm32_setup_ethaddr(eip))
 		log_err("%s: Unable to setup ethaddr!\n", __func__);
 
-	if (dh_stm32_setup_eth1addr())
+	if (dh_stm32_setup_eth1addr(eip))
 		log_err("%s: Unable to setup eth1addr!\n", __func__);
 
 	return 0;
-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
