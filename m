Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C646AED1E3
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jun 2025 02:11:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E51FAC3089F;
	Mon, 30 Jun 2025 00:11:14 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D399C3089D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 00:11:13 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bVmm11hTqz9sWs;
 Mon, 30 Jun 2025 02:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751242273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCfCROyVazxPg4QdtOEsWZaH8g2P3DzRk2vlQ24/aGA=;
 b=ebbk8XKiP2rfWduLRe4COYHXCIkUbLSzAkjY2od0UGUHGClmGfKWXD25PClTCcDqyZjPaT
 JS3pc1FaHuhHGRdb1QbWXRTZDoqJAHEGt6aJwXXoa44vuWhFp6rN80Iph0VWq39hBes2+S
 Q+H1tA5UNn1GRqEL1QxVMwcJ3pHxaTtqJmp7ThIkHJ+BCiRUMMFsmRwJGTMSo0MMkp/jS7
 /2OOsYfHKlUxBq7wmn9qcZEnA3u3zGOb5jw6ekNesYyf/gNTdEs2OJ3I4nMRlx44ywLS5G
 LSHbPrvFvbWQWGljRpuyDZiBZzRwLAlPj3fW7nNzN2hcdPnbiibHlayBcDYVEA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751242271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCfCROyVazxPg4QdtOEsWZaH8g2P3DzRk2vlQ24/aGA=;
 b=Ls7j/UqC3pnTSbWUmssfTrTNpD0Vb9k5h57XqmlaAr0f2qJNvrjryQaCR157LyUwGkaqIR
 WAITmYChy8vdNkh6YhjdyY57EdZYamq1fNZvaSqoN1/wf0BAWXGfJADAXLFnLCYb5tBnEg
 K0a+i54nUuMEI6yiKdBqJ1nfbwQ4JuUVIhM9LFpd++Ez4FUbMhqSOy8QVRszjNrTeRYzNa
 OPDsc3EiYjaftQpcH2OfIZ/2CvTrMLSjs+Bi2q36NESfnHECmE8wRVJzG0zl7go7jvtmzu
 3l0d4uau9KIL463PnPkibMExjfb2VM42ypbPQnl2SrH8Mf+l1CSvcMFJxcqF8w==
To: u-boot@lists.denx.de
Date: Mon, 30 Jun 2025 02:10:30 +0200
Message-ID: <20250630001053.952342-4-marek.vasut@mailbox.org>
In-Reply-To: <20250630001053.952342-1-marek.vasut@mailbox.org>
References: <20250630001053.952342-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: e59244cddd1e21febd3
X-MBO-RS-META: 4mgd6tf7zsrfpjenzhkfo65xpqtpyrp7
X-Rspamd-Queue-Id: 4bVmm11hTqz9sWs
Cc: Tom Rini <trini@konsulko.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 04/10] ARM: stm32: Add STM32MP13xx PMIC
	initialization for DDR3 DRAM type
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

The STM32MP13xx PMIC initialization for DDR3 DRAM type is similar
to the STM32MP15xx PMIC initialization, except the VTT rail is not
enabled. Fill in the STM32MP13xx support.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Cheick Traore <cheick.traore@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Lionel Debieve <lionel.debieve@foss.st.com>
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
V2: Add RB from Patrice
---
 board/st/common/stpmic1.c | 51 ++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/board/st/common/stpmic1.c b/board/st/common/stpmic1.c
index 45c2bb5bcea..b46f89dacb9 100644
--- a/board/st/common/stpmic1.c
+++ b/board/st/common/stpmic1.c
@@ -14,8 +14,19 @@
 #include <power/pmic.h>
 #include <power/stpmic1.h>
 
+static bool is_stm32mp13xx(void)
+{
+	if (!IS_ENABLED(CONFIG_STM32MP13X))
+		return false;
+
+	return of_machine_is_compatible("st,stm32mp131") ||
+	       of_machine_is_compatible("st,stm32mp133") ||
+	       of_machine_is_compatible("st,stm32mp135");
+}
+
 int board_ddr_power_init(enum ddr_type ddr_type)
 {
+	bool is_mp13 = is_stm32mp13xx();
 	struct udevice *dev;
 	bool buck3_at_1800000v = false;
 	int ret;
@@ -30,18 +41,21 @@ int board_ddr_power_init(enum ddr_type ddr_type)
 	switch (ddr_type) {
 	case STM32MP_DDR3:
 		/* VTT = Set LDO3 to sync mode */
-		ret = pmic_reg_read(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3));
-		if (ret < 0)
-			return ret;
-
-		ret &= ~STPMIC1_LDO3_MODE;
-		ret &= ~STPMIC1_LDO12356_VOUT_MASK;
-		ret |= STPMIC1_LDO_VOUT(STPMIC1_LDO3_DDR_SEL);
-
-		ret = pmic_reg_write(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
-				     ret);
-		if (ret < 0)
-			return ret;
+		if (!is_mp13) {
+			/* Enable VTT only on STM32MP15xx */
+			ret = pmic_reg_read(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3));
+			if (ret < 0)
+				return ret;
+
+			ret &= ~STPMIC1_LDO3_MODE;
+			ret &= ~STPMIC1_LDO12356_VOUT_MASK;
+			ret |= STPMIC1_LDO_VOUT(STPMIC1_LDO3_DDR_SEL);
+
+			ret = pmic_reg_write(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
+					     ret);
+			if (ret < 0)
+				return ret;
+		}
 
 		/* VDD_DDR = Set BUCK2 to 1.35V */
 		ret = pmic_clrsetbits(dev,
@@ -69,11 +83,14 @@ int board_ddr_power_init(enum ddr_type ddr_type)
 		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
 
 		/* Enable VTT = LDO3 */
-		ret = pmic_clrsetbits(dev,
-				      STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
-				      STPMIC1_LDO_ENA, STPMIC1_LDO_ENA);
-		if (ret < 0)
-			return ret;
+		if (!is_mp13) {
+			/* Enable VTT only on STM32MP15xx */
+			ret = pmic_clrsetbits(dev,
+					      STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
+					      STPMIC1_LDO_ENA, STPMIC1_LDO_ENA);
+			if (ret < 0)
+				return ret;
+		}
 
 		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
 
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
