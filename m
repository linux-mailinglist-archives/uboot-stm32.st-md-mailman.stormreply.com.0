Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC433AB3EE4
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 May 2025 19:22:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F9B8C7A82D;
	Mon, 12 May 2025 17:22:23 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78C8AC7A82F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 17:22:22 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Zx5yP6h1Hz9smH;
 Mon, 12 May 2025 19:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wlQeXKprmnnpWWXsbmVTnZIw+/Hde1MGFbCAtnDBLh8=;
 b=DnI7LuXsx30Wx0vR4JOTto/nBhemQLxb+MjFRi2+/2U/Wkdw/OR2kH/f44e5cjEc4m/oS9
 zuD16xsARV6mjCPDG4gs7wGUuL/Cx7KsIa1igBY7u6Iw3WQpE9cHgGR87fBr+UWHryxc9n
 6FqPiN6n8n+b2p+mePuaiSFGwNv6K377U7BnT0cBUP6aU0zbGO8o5oq1zpqe5+TLR0Cy5o
 TRH5hbo6jOQDM8Wu6wDixpnxu9TnTBQrQusWnJZU9UMP+noizkQtIV2l9oTR20nccQGWoi
 4+RmGE8pzcKKn/dzQZf5Z6Z5up9x5pvPy9uywIhGaVBKksDxhk9D13EDp7+BjA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wlQeXKprmnnpWWXsbmVTnZIw+/Hde1MGFbCAtnDBLh8=;
 b=QOEsUC9prl9igi3lWua7lUBxjFUP6nf8lYDW2kgaNlQ99kVFrgn8DvbktV4woGDwhjduGX
 za694O4YGa3CQMbm0t/Aw/frOgN/IYkRzM+oqXAT1BrGV6BqB9+60erjpi7mQKRRsSxhKP
 xhbjXgMz+kJYw4Do17+4ts2LQLNttuY919e9dflzk4jUsnMCiS7IPQMSrLWXTzLdIxWhZu
 wu+XDxvhzZ1h5r4cC1zoqJtSzUfygOGS82MrnLRgjvjnv58nJw92kUIioT3B35Qo8AAXg/
 CdPFO4xZkyQuuczqfDV32+p5Ob/twwGxhHqz54qJoUneZjDPUmWOgPjKw85H/Q==
To: u-boot@lists.denx.de
Date: Mon, 12 May 2025 19:21:31 +0200
Message-ID: <20250512172149.150214-5-marek.vasut@mailbox.org>
In-Reply-To: <20250512172149.150214-1-marek.vasut@mailbox.org>
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: ee551b5348d262a5161
X-MBO-RS-META: swqn8niaunyarxayx3iotuteoggjj6jm
X-Rspamd-Queue-Id: 4Zx5yP6h1Hz9smH
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: [Uboot-stm32] [PATCH 04/10] ARM: stm32: Add STM32MP13xx PMIC
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
