Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CB1387E3
	for <lists+uboot-stm32@lfdr.de>; Sun, 12 Jan 2020 20:07:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D043C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sun, 12 Jan 2020 19:07:04 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C43AC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2020 19:07:02 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id z8so7299749ioh.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2020 11:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BkUBK93b+skvHgNwuhBsl6XdjYuqI/1JFT8tDad+40=;
 b=iHebWkwIWyLEryhmMAEoKcxWrDiyaRDpkkWieycvMgbKlGhJicNR8O/GfqZwbX/Zyu
 DAN7PluseYJgMxiymj3mV/+vXOSRcah2ePGliMwoIIcIohQUufZjZxzwGNlAYz94Wv6p
 jnIVrpuxd0B2QwgZvzCZWFwsQUe/ANyJwcFaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0BkUBK93b+skvHgNwuhBsl6XdjYuqI/1JFT8tDad+40=;
 b=Qp38VQ2bWlISkGWS6rmAWAylNqyYirKHg3DO1SBXv7BzZtlxzbFJP4QxjrVHJGqGFk
 VMkuBkTn3p1CcAAzR90ZwM7zOW/RHQranjLPfn9ovsugS8i72baUpDT9kS2SjBjmI/i1
 IyJHJ1CjSPUFkXE+7D6RXLdK5y39nutHrrNlrEuGjKiD/Dxw5IhXMqsp9GGitYQL1Rvz
 7VAI/C+CtTLA76jwP6pq2CbhpjiaRfw4g17bZRaThRL+WmAL5soIMk+xCGOiCnA/5276
 gNPyudmP/mwcpKEOyqduKu1cxeMEzBpjXibUwhrrf8eu1komgr076ZjMZx0zXDwO/XZ9
 Pzkw==
X-Gm-Message-State: APjAAAXCINtYaPTAhImoGzlOBFigrUqlqkSdv3FVLW6qawIFab006U7Q
 i//huoDIQHn6tdb7xqXJH5veaQ==
X-Google-Smtp-Source: APXvYqxF8QbOH/WRhn716+P3ZqlEDlwD8O8V/sU9TqpTp7VYQCbj3LC/c3jcG61EB390cgWNM450hA==
X-Received: by 2002:a6b:5917:: with SMTP id n23mr10621886iob.112.1578856021390; 
 Sun, 12 Jan 2020 11:07:01 -0800 (PST)
Received: from kiwi.bld.corp.google.com ([2620:15c:183:0:8223:87c:a681:66aa])
 by smtp.gmail.com with ESMTPSA id
 r22sm3039219ilb.25.2020.01.12.11.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 11:07:01 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 12 Jan 2020 12:05:57 -0700
Message-Id: <20200112120216.6.Ib38dca8a84963a43157a31475f2cc51e59d0a398@changeid>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200112190624.79077-1-sjg@chromium.org>
References: <20200112190624.79077-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: uboot-snps-arc@synopsys.com, u-boot-amlogic@groups.io,
 Ryder Lee <ryder.lee@mediatek.com>, Patrick Wildt <patrick@blueri.se>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Simon Glass <sjg@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Shawn Guo <shawn.guo@linaro.org>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Subject: [Uboot-stm32] [PATCH 06/33] reset: Rename free() to rfree()
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

This function name conflicts with our desire to #define free() to
something else on sandbox. Since it deals with resources, rename it to
rfree().

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 drivers/reset/reset-bcm6345.c   | 2 +-
 drivers/reset/reset-hisilicon.c | 2 +-
 drivers/reset/reset-hsdk.c      | 2 +-
 drivers/reset/reset-imx7.c      | 2 +-
 drivers/reset/reset-mediatek.c  | 2 +-
 drivers/reset/reset-meson.c     | 2 +-
 drivers/reset/reset-mtmips.c    | 2 +-
 drivers/reset/reset-rockchip.c  | 2 +-
 drivers/reset/reset-socfpga.c   | 2 +-
 drivers/reset/reset-sunxi.c     | 2 +-
 drivers/reset/reset-ti-sci.c    | 2 +-
 drivers/reset/reset-uclass.c    | 2 +-
 drivers/reset/reset-uniphier.c  | 2 +-
 drivers/reset/sandbox-reset.c   | 2 +-
 drivers/reset/sti-reset.c       | 2 +-
 drivers/reset/stm32-reset.c     | 2 +-
 drivers/reset/tegra-car-reset.c | 2 +-
 drivers/reset/tegra186-reset.c  | 2 +-
 include/reset-uclass.h          | 4 ++--
 19 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/reset/reset-bcm6345.c b/drivers/reset/reset-bcm6345.c
index 753c1108a9..bbaaea9bb3 100644
--- a/drivers/reset/reset-bcm6345.c
+++ b/drivers/reset/reset-bcm6345.c
@@ -52,7 +52,7 @@ static int bcm6345_reset_request(struct reset_ctl *rst)
 }
 
 struct reset_ops bcm6345_reset_reset_ops = {
-	.free = bcm6345_reset_free,
+	.rfree = bcm6345_reset_free,
 	.request = bcm6345_reset_request,
 	.rst_assert = bcm6345_reset_assert,
 	.rst_deassert = bcm6345_reset_deassert,
diff --git a/drivers/reset/reset-hisilicon.c b/drivers/reset/reset-hisilicon.c
index a9f052a0c5..d449e3d25e 100644
--- a/drivers/reset/reset-hisilicon.c
+++ b/drivers/reset/reset-hisilicon.c
@@ -72,7 +72,7 @@ static int hisi_reset_of_xlate(struct reset_ctl *rst,
 static const struct reset_ops hisi_reset_reset_ops = {
 	.of_xlate = hisi_reset_of_xlate,
 	.request = hisi_reset_request,
-	.free = hisi_reset_free,
+	.rfree = hisi_reset_free,
 	.rst_assert = hisi_reset_assert,
 	.rst_deassert = hisi_reset_deassert,
 };
diff --git a/drivers/reset/reset-hsdk.c b/drivers/reset/reset-hsdk.c
index 213d6c87be..f9a432a7a2 100644
--- a/drivers/reset/reset-hsdk.c
+++ b/drivers/reset/reset-hsdk.c
@@ -81,7 +81,7 @@ static int hsdk_reset_noop(struct reset_ctl *rst_ctl)
 
 static const struct reset_ops hsdk_reset_ops = {
 	.request	= hsdk_reset_noop,
-	.free		= hsdk_reset_noop,
+	.rfree		= hsdk_reset_noop,
 	.rst_assert	= hsdk_reset_noop,
 	.rst_deassert	= hsdk_reset_reset,
 };
diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
index f2ca5cf801..a2bad65a3b 100644
--- a/drivers/reset/reset-imx7.c
+++ b/drivers/reset/reset-imx7.c
@@ -272,7 +272,7 @@ static int imx7_reset_request(struct reset_ctl *rst)
 
 static const struct reset_ops imx7_reset_reset_ops = {
 	.request = imx7_reset_request,
-	.free = imx7_reset_free,
+	.rfree = imx7_reset_free,
 	.rst_assert = imx7_reset_assert,
 	.rst_deassert = imx7_reset_deassert,
 };
diff --git a/drivers/reset/reset-mediatek.c b/drivers/reset/reset-mediatek.c
index e3614e6e2a..cfbf2af863 100644
--- a/drivers/reset/reset-mediatek.c
+++ b/drivers/reset/reset-mediatek.c
@@ -55,7 +55,7 @@ static int mediatek_reset_deassert(struct reset_ctl *reset_ctl)
 
 struct reset_ops mediatek_reset_ops = {
 	.request = mediatek_reset_request,
-	.free = mediatek_reset_free,
+	.rfree = mediatek_reset_free,
 	.rst_assert = mediatek_reset_assert,
 	.rst_deassert = mediatek_reset_deassert,
 };
diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 31aa4d41e8..9026e034c3 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -62,7 +62,7 @@ static int meson_reset_deassert(struct reset_ctl *reset_ctl)
 
 struct reset_ops meson_reset_ops = {
 	.request = meson_reset_request,
-	.free = meson_reset_free,
+	.rfree = meson_reset_free,
 	.rst_assert = meson_reset_assert,
 	.rst_deassert = meson_reset_deassert,
 };
diff --git a/drivers/reset/reset-mtmips.c b/drivers/reset/reset-mtmips.c
index 59734565d7..71254a93dd 100644
--- a/drivers/reset/reset-mtmips.c
+++ b/drivers/reset/reset-mtmips.c
@@ -45,7 +45,7 @@ static int mtmips_reset_deassert(struct reset_ctl *reset_ctl)
 
 static const struct reset_ops mtmips_reset_ops = {
 	.request	= mtmips_reset_request,
-	.free		= mtmips_reset_free,
+	.rfree		= mtmips_reset_free,
 	.rst_assert	= mtmips_reset_assert,
 	.rst_deassert	= mtmips_reset_deassert,
 };
diff --git a/drivers/reset/reset-rockchip.c b/drivers/reset/reset-rockchip.c
index 3871fc00d0..4fb9571b18 100644
--- a/drivers/reset/reset-rockchip.c
+++ b/drivers/reset/reset-rockchip.c
@@ -76,7 +76,7 @@ static int rockchip_reset_deassert(struct reset_ctl *reset_ctl)
 
 struct reset_ops rockchip_reset_ops = {
 	.request = rockchip_reset_request,
-	.free = rockchip_reset_free,
+	.rfree = rockchip_reset_free,
 	.rst_assert = rockchip_reset_assert,
 	.rst_deassert = rockchip_reset_deassert,
 };
diff --git a/drivers/reset/reset-socfpga.c b/drivers/reset/reset-socfpga.c
index 93ec9cfdb6..98524eb2b7 100644
--- a/drivers/reset/reset-socfpga.c
+++ b/drivers/reset/reset-socfpga.c
@@ -101,7 +101,7 @@ static int socfpga_reset_free(struct reset_ctl *reset_ctl)
 
 static const struct reset_ops socfpga_reset_ops = {
 	.request = socfpga_reset_request,
-	.free = socfpga_reset_free,
+	.rfree = socfpga_reset_free,
 	.rst_assert = socfpga_reset_assert,
 	.rst_deassert = socfpga_reset_deassert,
 };
diff --git a/drivers/reset/reset-sunxi.c b/drivers/reset/reset-sunxi.c
index 364dc52fb7..1c717b20c3 100644
--- a/drivers/reset/reset-sunxi.c
+++ b/drivers/reset/reset-sunxi.c
@@ -81,7 +81,7 @@ static int sunxi_reset_deassert(struct reset_ctl *reset_ctl)
 
 struct reset_ops sunxi_reset_ops = {
 	.request = sunxi_reset_request,
-	.free = sunxi_reset_free,
+	.rfree = sunxi_reset_free,
 	.rst_assert = sunxi_reset_assert,
 	.rst_deassert = sunxi_reset_deassert,
 };
diff --git a/drivers/reset/reset-ti-sci.c b/drivers/reset/reset-ti-sci.c
index c8a76dfb04..7b6f736f5e 100644
--- a/drivers/reset/reset-ti-sci.c
+++ b/drivers/reset/reset-ti-sci.c
@@ -190,7 +190,7 @@ static const struct udevice_id ti_sci_reset_of_match[] = {
 static struct reset_ops ti_sci_reset_ops = {
 	.of_xlate = ti_sci_reset_of_xlate,
 	.request = ti_sci_reset_request,
-	.free = ti_sci_reset_free,
+	.rfree = ti_sci_reset_free,
 	.rst_assert = ti_sci_reset_assert,
 	.rst_deassert = ti_sci_reset_deassert,
 	.rst_status = ti_sci_reset_status,
diff --git a/drivers/reset/reset-uclass.c b/drivers/reset/reset-uclass.c
index ee1a423ffb..bf1cba4124 100644
--- a/drivers/reset/reset-uclass.c
+++ b/drivers/reset/reset-uclass.c
@@ -164,7 +164,7 @@ int reset_free(struct reset_ctl *reset_ctl)
 
 	debug("%s(reset_ctl=%p)\n", __func__, reset_ctl);
 
-	return ops->free(reset_ctl);
+	return ops->rfree(reset_ctl);
 }
 
 int reset_assert(struct reset_ctl *reset_ctl)
diff --git a/drivers/reset/reset-uniphier.c b/drivers/reset/reset-uniphier.c
index 39d684be4a..97f7b0ed5f 100644
--- a/drivers/reset/reset-uniphier.c
+++ b/drivers/reset/reset-uniphier.c
@@ -234,7 +234,7 @@ static int uniphier_reset_deassert(struct reset_ctl *reset_ctl)
 
 static const struct reset_ops uniphier_reset_ops = {
 	.request = uniphier_reset_request,
-	.free = uniphier_reset_free,
+	.rfree = uniphier_reset_free,
 	.rst_assert = uniphier_reset_assert,
 	.rst_deassert = uniphier_reset_deassert,
 };
diff --git a/drivers/reset/sandbox-reset.c b/drivers/reset/sandbox-reset.c
index 40f2654d8e..c03fce3531 100644
--- a/drivers/reset/sandbox-reset.c
+++ b/drivers/reset/sandbox-reset.c
@@ -79,7 +79,7 @@ static const struct udevice_id sandbox_reset_ids[] = {
 
 struct reset_ops sandbox_reset_reset_ops = {
 	.request = sandbox_reset_request,
-	.free = sandbox_reset_free,
+	.rfree = sandbox_reset_free,
 	.rst_assert = sandbox_reset_assert,
 	.rst_deassert = sandbox_reset_deassert,
 };
diff --git a/drivers/reset/sti-reset.c b/drivers/reset/sti-reset.c
index d8cc485ce6..614da9da59 100644
--- a/drivers/reset/sti-reset.c
+++ b/drivers/reset/sti-reset.c
@@ -298,7 +298,7 @@ static int sti_reset_deassert(struct reset_ctl *reset_ctl)
 
 struct reset_ops sti_reset_ops = {
 	.request = sti_reset_request,
-	.free = sti_reset_free,
+	.rfree = sti_reset_free,
 	.rst_assert = sti_reset_assert,
 	.rst_deassert = sti_reset_deassert,
 };
diff --git a/drivers/reset/stm32-reset.c b/drivers/reset/stm32-reset.c
index 16d3dba749..4d7745abce 100644
--- a/drivers/reset/stm32-reset.c
+++ b/drivers/reset/stm32-reset.c
@@ -64,7 +64,7 @@ static int stm32_reset_deassert(struct reset_ctl *reset_ctl)
 
 static const struct reset_ops stm32_reset_ops = {
 	.request	= stm32_reset_request,
-	.free		= stm32_reset_free,
+	.rfree		= stm32_reset_free,
 	.rst_assert	= stm32_reset_assert,
 	.rst_deassert	= stm32_reset_deassert,
 };
diff --git a/drivers/reset/tegra-car-reset.c b/drivers/reset/tegra-car-reset.c
index 25947822f1..886ea04e2e 100644
--- a/drivers/reset/tegra-car-reset.c
+++ b/drivers/reset/tegra-car-reset.c
@@ -51,7 +51,7 @@ static int tegra_car_reset_deassert(struct reset_ctl *reset_ctl)
 
 struct reset_ops tegra_car_reset_ops = {
 	.request = tegra_car_reset_request,
-	.free = tegra_car_reset_free,
+	.rfree = tegra_car_reset_free,
 	.rst_assert = tegra_car_reset_assert,
 	.rst_deassert = tegra_car_reset_deassert,
 };
diff --git a/drivers/reset/tegra186-reset.c b/drivers/reset/tegra186-reset.c
index 9927c063c3..84ed77b96f 100644
--- a/drivers/reset/tegra186-reset.c
+++ b/drivers/reset/tegra186-reset.c
@@ -60,7 +60,7 @@ static int tegra186_reset_deassert(struct reset_ctl *reset_ctl)
 
 struct reset_ops tegra186_reset_ops = {
 	.request = tegra186_reset_request,
-	.free = tegra186_reset_free,
+	.rfree = tegra186_reset_free,
 	.rst_assert = tegra186_reset_assert,
 	.rst_deassert = tegra186_reset_deassert,
 };
diff --git a/include/reset-uclass.h b/include/reset-uclass.h
index 7b5cc3cb3b..9a0696dd1e 100644
--- a/include/reset-uclass.h
+++ b/include/reset-uclass.h
@@ -51,14 +51,14 @@ struct reset_ops {
 	 */
 	int (*request)(struct reset_ctl *reset_ctl);
 	/**
-	 * free - Free a previously requested reset control.
+	 * rfree - Free a previously requested reset control.
 	 *
 	 * This is the implementation of the client reset_free() API.
 	 *
 	 * @reset_ctl:	The reset control to free.
 	 * @return 0 if OK, or a negative error code.
 	 */
-	int (*free)(struct reset_ctl *reset_ctl);
+	int (*rfree)(struct reset_ctl *reset_ctl);
 	/**
 	 * rst_assert - Assert a reset signal.
 	 *
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
