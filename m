Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68083C039B1
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Oct 2025 23:47:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C765C5A4CA;
	Thu, 23 Oct 2025 21:47:48 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A275CC349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 21:47:46 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ct04y1CYlz9stY;
 Thu, 23 Oct 2025 23:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761256066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XSCMG5jxLArkFsQW1Jsm63E260tmJTgOo40K1mt+CoE=;
 b=mM6D973InoHg8plh4otBINruI62TiWMYU+wnY+hS6ThqJ3ZiUkKubQEZ5f+61NpwokMNLv
 JZxhNtf0if7YBvsIAygkD7840A/pGqLsD/31/22EOiU65vGJMzhA+0jVaYfbY7kZ0WOfRa
 PwHCHi1wjQmvHBWUE5DAT6xmEU2+0ap0BHm4F/F7UIExhgqWnJ0t0r/MAs5aRU2sZtcw6N
 /8YCYCInrQc9HQgXghldtILiiZJGcZQMyNizKJpUPmc0HmBSsBWa572yUjnkVlNUEmsZIu
 sGCU+NHwoFQFKVBb++TYM4SeENjZunIzg+fR4trALUJcnh8MMoX0wt56YmJKKg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=rFoiM+9L;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761256063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XSCMG5jxLArkFsQW1Jsm63E260tmJTgOo40K1mt+CoE=;
 b=rFoiM+9LzIi/98PRU2NajQLA6VJFqULBoohXo8328Z8KBBjr29utGSXtpaFrhkt/Gy+K7/
 iqdGFOFqAPKtJ0+IvQbTd60vPmIbCI8KzoYVA+GlgMbInKDB/SSkG0yOhVAAow4m8I193Y
 WYm8l1e+XVK6750ZuT7wm/jfWehhhDUD2QPkwZI2UHPlsTo7pCDloK6oynFLsEddkhex5r
 mjwhvvHI1zItBPLei3UtFCc7xfgg8eYp74505n2ZAV0I3qSnz4mqqxFPq2DMe/v019QMRj
 HmUMzW8n0FZ5ghlXYjjU8VBYb/aB7AJjZjvMTP7xBOu4bN5RnECUcgzrwW9HhA==
To: u-boot@lists.denx.de
Date: Thu, 23 Oct 2025 23:47:25 +0200
Message-ID: <20251023214733.181352-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 9e74989d8d51ca7641f
X-MBO-RS-META: ij9486tjqgj9ckc9uod1uo3srhrchrm8
X-Rspamd-Queue-Id: 4ct04y1CYlz9stY
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Keep the reg11 and reg18
	regulators always enabled on STM32MP13xx DHCOR
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

Do not disable reg11 and reg18, disabling these regulators causes
the SoC to hang.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
index 699ba15d6ea..5ca0258e3ff 100644
--- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
@@ -186,6 +186,14 @@
 };
 #endif
 
+&reg11 {
+	regulator-always-on;
+};
+
+&reg18 {
+	regulator-always-on;
+};
+
 &sdmmc1 {
 	status = "disabled";
 };
-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
