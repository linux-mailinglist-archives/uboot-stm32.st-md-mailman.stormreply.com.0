Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F90C0398D
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Oct 2025 23:46:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14AEFC5A4CA;
	Thu, 23 Oct 2025 21:46:32 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BEF1C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 21:46:30 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ct03T5cC4z9tk9;
 Thu, 23 Oct 2025 23:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761255989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qUy8WcVhhs1DyLTOiIPfn3Q+cT0AlpAxZNoqw5IJohU=;
 b=kZjQmIoqYRnbZlC+1chq0309MvexIUUMHvIKPxEZ/jDvwCx3Q7fWdH/UJhr4idlXmXyqv8
 JdLkiLW15ZgIJQ9HPABjxAKdssdW4D/gf+tl/8n9rL69EiV4ku0VZFV7CeFiXzAgDFjmv2
 6GDKFnv2SSWFz4t0VhiZMcXvOVXQjLvwjTuchI8CDRPCR/bg1jeItoGaFnWKiKNLVZ+gUS
 ysQSl+hnbBw3fphM+TzhzPOW32viC5bJpSlLDarKm65dm84ZWtJh7AjlwR+MW8Pk7vWOtu
 DqFPinHvbljKDZpRPWTzD9JhS2EdgMV9bbmlvcGHbG3ePEi54Lvb+EYb1BlLBg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761255988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qUy8WcVhhs1DyLTOiIPfn3Q+cT0AlpAxZNoqw5IJohU=;
 b=pYyx0U0ZrA5yPf6ZhNrihBdyUGS6q+2fUjNuGProBRT8mWx+XFbM2GMIgV5P41XuViUF/9
 i4BQIVC0vJAGu1EKz+aU1GbBgRo5LjKgFGpd7YhJnC0le9yvhNKxEz0CjALcDHGbOcyg96
 uGL0DtH9Ruv5GQJ826YqUihPgj/GUEEYbHav/W+3l2J+1qWm9UBlz6sv6sGbChyWWZ4s3d
 w0kMGI/kGN9rHGoMzuZHukLizPU7OW/uBU6pLCpYvJKX4T/SX6qoSWjWAf9lGwy7HWK8M6
 gwMRxCQjbms6c/b+umhD5v72IU4QIkrUXnuStm2FCf9BAi/nMYyWEdNs2BFCLg==
To: u-boot@lists.denx.de
Date: Thu, 23 Oct 2025 23:46:05 +0200
Message-ID: <20251023214614.181165-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: ajamhtpbyzaxx51k96s519bnjyxm6wrx
X-MBO-RS-ID: ddacfc0b436078df4d9
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Fix STM32MP15xx DHSOM boot
	breakage due to ETZPC
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

Switch etzpc bus to simple-bus to prevent breakage on non-TFA systems.
This fixes boot of every STM32MP15xx DHSOM device.

Fixes: ad3cdc677dda ("ARM: stm32mp: add ETZPC system bus driver for STM32MP1")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi
index 386c605c07f..ed2629f379a 100644
--- a/arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi
@@ -51,3 +51,7 @@
 		};
 	};
 };
+
+&etzpc {
+	compatible = "simple-bus";
+};
-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
