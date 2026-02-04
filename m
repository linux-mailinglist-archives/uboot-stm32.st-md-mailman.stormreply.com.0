Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFSGOufXg2lbuwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 00:36:07 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A3FED4DE
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 00:36:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C41DC87ECD;
	Wed,  4 Feb 2026 23:36:07 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49498C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 23:36:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-481188b7760so2599125e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Feb 2026 15:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770248164; x=1770852964;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vTotPwPeX7mDUfiL+iy6WaKCa5xiJdrE7pgMGB1LwSM=;
 b=C7akyVRpRQkXeB3+a1rrQi3pHxjst3AUh4ri7y/sDB//kgnbE3wjUBfq6ezFrxVSwE
 SrtooXYM1Ns/llEG+0p80zcwP3pInC8mDUpknsrj3XYFDXUKW75ePXlr9b/ecV0/cuxb
 6HaMyhT7CqjvWhlOQG3yl/cGyz6XcHl1Exo2KjLTGSo0B+sZGFgyKyf+TRfTz0gXJB24
 W36ju9UmWvCSPNuaND+WADVayQL9Zy08TnbUgBTIA97tXp4+j7ui9DlaOUnneMlWM1x1
 sfxGdcFsR+xIdhGpuZuWT8ceJ76DKlToGz7wFwPJMtq0MuK8KtYvA+/PY9M8He+WI4cf
 ehSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770248164; x=1770852964;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vTotPwPeX7mDUfiL+iy6WaKCa5xiJdrE7pgMGB1LwSM=;
 b=u04rv2zcEepfS7+SXIW8u1jROrjk1cueSWVsUVKrqUw7b2p8Q9nOQinx+l3iQw3LgF
 LrqhIiR4vQ3LQ1DO7/caMY8pKE9yWKPNdg//p//xxlEk68oeEj72Y7ZYsYvk5CMQ1vlQ
 ZApfQnhULse4woifQJNVs9LYIejBk0MCu/4xJcZ1AjIpNrW+NldPnBbAU3hN/osYD2xv
 gIPj+j0XC/M4E6nm+YX0HtLWkpgHbpnJ57eoH+bjbs2D0Y2u4ce0FWEP+fSpmbIjQMhC
 zaD63XkgBzhMCam5ufBat1lHiRftP+8zk/mjvS94GrSRJbb0HprwyicWk0ESQbECM/Az
 kzZg==
X-Gm-Message-State: AOJu0YyXnNnlPN3rYyVGS9WgFDEdOBGjDixqAFmWC6Z5zbC9JUovqC5e
 bG/J0HgPqU6QgXFVo7IrnG4kuPx+I/h3Mw2i7VdWIlDor0+m9E/WcK3P
X-Gm-Gg: AZuq6aKsLPlrJVCmuhaz7+kTXe9IstjUh2zDdg6UvVOKC0kRYOuK9UrpZdPYbkJbIMe
 jY6j21zLOrAzhOP8IOkhwv9oGxFGTnpMg/g8RJKOegWuIUhVjh++KbBzwcVrw5sKX7WvFjxRCAE
 Afsol2AuQWLyu2YmuShEWf6U3BZ9jYFu2vsDphBm6EnW7KyQRcTVDu1B0gpojTApThXVUXMQYJs
 oIoMpowQc5WlS6R+gXVqM1YS5y8BDH94qN36FNcVhVlWGPfGD2vQwK/GXtj8n++DQpen34yebFp
 RKmjrT4p9BrGwpalcRM7hboGdAxcPYSoQ3rVfEowD1kt4rotI5V2WvA1AiLR1m0ZK1jjUe6UTP4
 AGYCtVSo0a+PZFJobEfjOhz/dFnF34ZvkfYTblv1zZLN9VVGAFiWZ76EoHeyrUkBBQcw5B+SpW1
 giMF+2ytG+udbqc8t3day57FU=
X-Received: by 2002:a05:600c:1546:b0:477:7f4a:44b4 with SMTP id
 5b1f17b1804b1-4830e92450cmr63869495e9.1.1770248164261; 
 Wed, 04 Feb 2026 15:36:04 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d2ba61sm26610585e9.1.2026.02.04.15.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 15:36:03 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 05 Feb 2026 00:35:40 +0100
MIME-Version: 1.0
Message-Id: <20260205-dsi-v1-1-eb5805068e97@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMvXg2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNT3ZTiTF1L8+RUAwuj5DQDIyMloMqCotS0zAqwKdGxtbUAl7QF8lU
 AAAA=
X-Change-ID: 20260205-dsi-97ce082cf022
To: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13421;
 i=rgallaispou@gmail.com; h=from:subject:message-id;
 bh=onGNU2V51ImqsJ2YhwA44Tl7HT6C0hJHCW6JQaRh0d0=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBpg9fQZQEoAb2Fv4juAOWzH/31+XzRigVKfkT/f
 NnpYvJSda2JAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaYPX0AAKCRDnIYpo1BLC
 tSAmD/9bpE1ef5GszDnbJ0wbBxRbrZ8COEWYixc80OrX84Mg3wCjDo30WO2jk1to3uaffg6U57/
 5qxliK2Q57knitOUI0+5E9dnrK5DYHSHSetKE/7hLXU1ZqVd0M8tW3Jx8DZodrH+3uwL6SIx1I/
 6XIFxa8oMRmgw2rOQCjRfre0RHis6IqmLNxCv6PAk/V0YuPcVlHuG+IE2EZIXgRdI1aODj3+Da+
 k/lst6hNSvqKCvo4jETFEyr5I2igkyZ/IE/9QezD11/4TsLxpJqygVs7NN/UJCsR+JSOtC/UbuF
 yzmHt3gSkUY1cqHF2/NUp7f8O5tbtTPE3wZnQ1aDGuyTYhfbK/KRIPOCzOETWXYYmy9ltmLClIW
 0D7K85F6j4k52xzUrucB+6gotbT6fyZE+0Wmi2HCGQuE71H/YhFcTE04CsLzQPiPyQ1aWImId0X
 vNiC7KDccsKwaiWc/zr5/2ggmpPaxu4cuNzRqIwvXkVqnVairc7YTA6oWOtWJd4lYhsWQx8knOb
 7oLA48Y267GrzZC5/sjoFcInfsjmUOGgNj63XbGAOfa/EZipJbBBk2qidDpOy5JQa6WYZAaSBUz
 OUZ6p4reZGs5xRLGRyyBvppMbo3tN20siChGtVZCbP56u+nQ6BYpCXnWYMVMkIEQcVPLGHc4WyI
 YjKA5SBhhDz4Fvw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: [Uboot-stm32] [PATCH] video: stm32: dsi: add .of_to_plat callback
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[foss.st.com,konsulko.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 85A3FED4DE
X-Rspamd-Action: no action

Drivers should extract device-tree data before probing via the
.of_to_plat hook.

Implement it for stm32_dsi driver.  By doing so, it also solve a
variable shadowing in stm32_dsi_probe() where &clk was used as
peripheral clock and ref clock.

For readability some struct have been renamed such as:

  * struct stm32_dsi_priv *dsi -> struct stm32_dsi_priv *priv
  * struct clk clk -> struct clk pclk

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
This patch has been tested on stm32mp157c-dk2 board.
---
 drivers/video/stm32/stm32_dsi.c | 168 ++++++++++++++++++++++------------------
 1 file changed, 91 insertions(+), 77 deletions(-)

diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
index 438ed41e8d5f..65a91f5cff7a 100644
--- a/drivers/video/stm32/stm32_dsi.c
+++ b/drivers/video/stm32/stm32_dsi.c
@@ -84,42 +84,48 @@ enum dsi_color {
 /* Timeout for regulator on/off, pll lock/unlock & fifo empty */
 #define TIMEOUT_US	200000
 
-struct stm32_dsi_priv {
+struct stm32_dsi_plat {
 	struct mipi_dsi_device device;
 	void __iomem *base;
 	struct udevice *panel;
+	struct udevice *vdd_reg;
+	struct udevice *dsi_host;
+	struct reset_ctl rst;
+	struct clk pclk;
+	struct clk refclk;
+};
+
+struct stm32_dsi_priv {
 	u32 pllref_clk;
 	u32 hw_version;
 	int lane_min_kbps;
 	int lane_max_kbps;
-	struct udevice *vdd_reg;
-	struct udevice *dsi_host;
 };
 
-static inline void dsi_write(struct stm32_dsi_priv *dsi, u32 reg, u32 val)
+static inline void dsi_write(void __iomem *base, u32 reg, u32 val)
 {
-	writel(val, dsi->base + reg);
+	writel(val, base + reg);
 }
 
-static inline u32 dsi_read(struct stm32_dsi_priv *dsi, u32 reg)
+static inline u32 dsi_read(void __iomem *base, u32 reg)
 {
-	return readl(dsi->base + reg);
+	return readl(base + reg);
 }
 
-static inline void dsi_set(struct stm32_dsi_priv *dsi, u32 reg, u32 mask)
+static inline void dsi_set(void __iomem *base, u32 reg, u32 mask)
 {
-	dsi_write(dsi, reg, dsi_read(dsi, reg) | mask);
+	dsi_write(base, reg, dsi_read(base, reg) | mask);
 }
 
-static inline void dsi_clear(struct stm32_dsi_priv *dsi, u32 reg, u32 mask)
+static inline void dsi_clear(void __iomem *base, u32 reg, u32 mask)
 {
-	dsi_write(dsi, reg, dsi_read(dsi, reg) & ~mask);
+	dsi_write(base, reg, dsi_read(base, reg) & ~mask);
 }
 
-static inline void dsi_update_bits(struct stm32_dsi_priv *dsi, u32 reg,
+static inline void dsi_update_bits(void __iomem *base, u32 reg,
 				   u32 mask, u32 val)
 {
-	dsi_write(dsi, reg, (dsi_read(dsi, reg) & ~mask) | val);
+	dsi_write(base, reg, (dsi_read(base, reg) & ~mask) | val);
 }
 
 static enum dsi_color dsi_color_from_mipi(u32 fmt)
@@ -210,14 +216,14 @@ static int dsi_phy_init(void *priv_data)
 {
 	struct mipi_dsi_device *device = priv_data;
 	struct udevice *dev = device->dev;
-	struct stm32_dsi_priv *dsi = dev_get_priv(dev);
+	struct stm32_dsi_plat *dsi = dev_get_plat(dev);
 	u32 val;
 	int ret;
 
 	dev_dbg(dev, "Initialize DSI physical layer\n");
 
 	/* Enable the regulator */
-	dsi_set(dsi, DSI_WRPCR, WRPCR_REGEN | WRPCR_BGREN);
+	dsi_set(dsi->base, DSI_WRPCR, WRPCR_REGEN | WRPCR_BGREN);
 	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_RRS,
 				 TIMEOUT_US);
 	if (ret) {
@@ -226,7 +232,7 @@ static int dsi_phy_init(void *priv_data)
 	}
 
 	/* Enable the DSI PLL & wait for its lock */
-	dsi_set(dsi, DSI_WRPCR, WRPCR_PLLEN);
+	dsi_set(dsi->base, DSI_WRPCR, WRPCR_PLLEN);
 	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_PLLLS,
 				 TIMEOUT_US);
 	if (ret) {
@@ -241,7 +247,7 @@ static void dsi_phy_post_set_mode(void *priv_data, unsigned long mode_flags)
 {
 	struct mipi_dsi_device *device = priv_data;
 	struct udevice *dev = device->dev;
-	struct stm32_dsi_priv *dsi = dev_get_priv(dev);
+	struct stm32_dsi_plat *dsi = dev_get_plat(dev);
 
 	dev_dbg(dev, "Set mode %p enable %ld\n", dsi,
 		mode_flags & MIPI_DSI_MODE_VIDEO);
@@ -256,9 +262,9 @@ static void dsi_phy_post_set_mode(void *priv_data, unsigned long mode_flags)
 	 */
 
 	if (mode_flags & MIPI_DSI_MODE_VIDEO)
-		dsi_set(dsi, DSI_WCR, WCR_DSIEN);
+		dsi_set(dsi->base, DSI_WCR, WCR_DSIEN);
 	else
-		dsi_clear(dsi, DSI_WCR, WCR_DSIEN);
+		dsi_clear(dsi->base, DSI_WCR, WCR_DSIEN);
 }
 
 static int dsi_get_lane_mbps(void *priv_data, struct display_timing *timings,
@@ -266,32 +272,33 @@ static int dsi_get_lane_mbps(void *priv_data, struct display_timing *timings,
 {
 	struct mipi_dsi_device *device = priv_data;
 	struct udevice *dev = device->dev;
-	struct stm32_dsi_priv *dsi = dev_get_priv(dev);
+	struct stm32_dsi_plat *plat = dev_get_plat(dev);
+	struct stm32_dsi_priv *priv = dev_get_priv(dev);
 	int idf, ndiv, odf, pll_in_khz, pll_out_khz;
 	int ret, bpp;
 	u32 val;
 
 	/* Update lane capabilities according to hw version */
-	dsi->lane_min_kbps = LANE_MIN_KBPS;
-	dsi->lane_max_kbps = LANE_MAX_KBPS;
-	if (dsi->hw_version == HWVER_131) {
-		dsi->lane_min_kbps *= 2;
-		dsi->lane_max_kbps *= 2;
+	priv->lane_min_kbps = LANE_MIN_KBPS;
+	priv->lane_max_kbps = LANE_MAX_KBPS;
+	if (priv->hw_version == HWVER_131) {
+		priv->lane_min_kbps *= 2;
+		priv->lane_max_kbps *= 2;
 	}
 
-	pll_in_khz = dsi->pllref_clk / 1000;
+	pll_in_khz = priv->pllref_clk / 1000;
 
 	/* Compute requested pll out */
 	bpp = mipi_dsi_pixel_format_to_bpp(format);
 	pll_out_khz = (timings->pixelclock.typ / 1000) * bpp / lanes;
 	/* Add 20% to pll out to be higher than pixel bw (burst mode only) */
 	pll_out_khz = (pll_out_khz * 12) / 10;
-	if (pll_out_khz > dsi->lane_max_kbps) {
-		pll_out_khz = dsi->lane_max_kbps;
+	if (pll_out_khz > priv->lane_max_kbps) {
+		pll_out_khz = priv->lane_max_kbps;
 		dev_warn(dev, "Warning max phy mbps is used\n");
 	}
-	if (pll_out_khz < dsi->lane_min_kbps) {
-		pll_out_khz = dsi->lane_min_kbps;
+	if (pll_out_khz < priv->lane_min_kbps) {
+		pll_out_khz = priv->lane_min_kbps;
 		dev_warn(dev, "Warning min phy mbps is used\n");
 	}
 
@@ -299,7 +306,7 @@ static int dsi_get_lane_mbps(void *priv_data, struct display_timing *timings,
 	idf = 0;
 	ndiv = 0;
 	odf = 0;
-	ret = dsi_pll_get_params(dsi, pll_in_khz, pll_out_khz,
+	ret = dsi_pll_get_params(priv, pll_in_khz, pll_out_khz,
 				 &idf, &ndiv, &odf);
 	if (ret) {
 		dev_err(dev, "Warning dsi_pll_get_params(): bad params\n");
@@ -310,18 +317,18 @@ static int dsi_get_lane_mbps(void *priv_data, struct display_timing *timings,
 	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
 
 	/* Set the PLL division factors */
-	dsi_update_bits(dsi, DSI_WRPCR,	WRPCR_NDIV | WRPCR_IDF | WRPCR_ODF,
+	dsi_update_bits(plat->base, DSI_WRPCR, WRPCR_NDIV | WRPCR_IDF | WRPCR_ODF,
 			(ndiv << 2) | (idf << 11) | ((ffs(odf) - 1) << 16));
 
 	/* Compute uix4 & set the bit period in high-speed mode */
 	val = 4000000 / pll_out_khz;
-	dsi_update_bits(dsi, DSI_WPCR0, WPCR0_UIX4, val);
+	dsi_update_bits(plat->base, DSI_WPCR0, WPCR0_UIX4, val);
 
 	/* Select video mode by resetting DSIM bit */
-	dsi_clear(dsi, DSI_WCFGR, WCFGR_DSIM);
+	dsi_clear(plat->base, DSI_WCFGR, WCFGR_DSIM);
 
 	/* Select the color coding */
-	dsi_update_bits(dsi, DSI_WCFGR, WCFGR_COLMUX,
+	dsi_update_bits(plat->base, DSI_WCFGR, WCFGR_COLMUX,
 			dsi_color_from_mipi(format) << 1);
 
 	*lane_mbps = pll_out_khz / 1000;
@@ -340,27 +347,27 @@ static const struct mipi_dsi_phy_ops dsi_stm_phy_ops = {
 
 static int stm32_dsi_attach(struct udevice *dev)
 {
-	struct stm32_dsi_priv *priv = dev_get_priv(dev);
-	struct mipi_dsi_device *device = &priv->device;
+	struct stm32_dsi_plat *plat = dev_get_plat(dev);
+	struct mipi_dsi_device *device = &plat->device;
 	struct mipi_dsi_panel_plat *mplat;
 	struct display_timing timings;
 	int ret;
 
-	ret = uclass_first_device_err(UCLASS_PANEL, &priv->panel);
+	ret = uclass_first_device_err(UCLASS_PANEL, &plat->panel);
 	if (ret) {
 		dev_err(dev, "panel device error %d\n", ret);
 		return ret;
 	}
 
-	mplat = dev_get_plat(priv->panel);
-	mplat->device = &priv->device;
+	mplat = dev_get_plat(plat->panel);
+	mplat->device = &plat->device;
 	device->lanes = mplat->lanes;
 	device->format = mplat->format;
 	device->mode_flags = mplat->mode_flags;
 
-	ret = panel_get_display_timing(priv->panel, &timings);
+	ret = panel_get_display_timing(plat->panel, &timings);
 	if (ret) {
-		ret = ofnode_decode_display_timing(dev_ofnode(priv->panel),
+		ret = ofnode_decode_display_timing(dev_ofnode(plat->panel),
 						   0, &timings);
 		if (ret) {
 			dev_err(dev, "decode display timing error %d\n", ret);
@@ -368,13 +375,13 @@ static int stm32_dsi_attach(struct udevice *dev)
 		}
 	}
 
-	ret = uclass_get_device(UCLASS_DSI_HOST, 0, &priv->dsi_host);
+	ret = uclass_get_device(UCLASS_DSI_HOST, 0, &plat->dsi_host);
 	if (ret) {
 		dev_err(dev, "No video dsi host detected %d\n", ret);
 		return ret;
 	}
 
-	ret = dsi_host_init(priv->dsi_host, device, &timings, 2,
+	ret = dsi_host_init(plat->dsi_host, device, &timings, 2,
 			    &dsi_stm_phy_ops);
 	if (ret) {
 		dev_err(dev, "failed to initialize mipi dsi host\n");
@@ -386,17 +393,17 @@ static int stm32_dsi_attach(struct udevice *dev)
 
 static int stm32_dsi_set_backlight(struct udevice *dev, int percent)
 {
-	struct stm32_dsi_priv *priv = dev_get_priv(dev);
+	struct stm32_dsi_plat *plat = dev_get_plat(dev);
 	int ret;
 
-	ret = panel_enable_backlight(priv->panel);
+	ret = panel_enable_backlight(plat->panel);
 	if (ret) {
 		dev_err(dev, "panel %s enable backlight error %d\n",
-			priv->panel->name, ret);
+			plat->panel->name, ret);
 		return ret;
 	}
 
-	ret = dsi_host_enable(priv->dsi_host);
+	ret = dsi_host_enable(plat->dsi_host);
 	if (ret) {
 		dev_err(dev, "failed to enable mipi dsi host\n");
 		return ret;
@@ -417,66 +424,71 @@ static int stm32_dsi_bind(struct udevice *dev)
 	return dm_scan_fdt_dev(dev);
 }
 
-static int stm32_dsi_probe(struct udevice *dev)
+static int stm32_dsi_of_to_plat(struct udevice *dev)
 {
-	struct stm32_dsi_priv *priv = dev_get_priv(dev);
-	struct mipi_dsi_device *device = &priv->device;
-	struct reset_ctl rst;
-	struct clk clk;
+	struct stm32_dsi_plat *plat = dev_get_plat(dev);
+	struct mipi_dsi_device *device = &plat->device;
 	int ret;
 
 	device->dev = dev;
 
-	priv->base = dev_read_addr_ptr(dev);
-	if (!priv->base) {
+	plat->base = dev_read_addr_ptr(dev);
+	if (!plat->base) {
 		dev_err(dev, "dsi dt register address error\n");
 		return -EINVAL;
 	}
 
 	ret =  device_get_supply_regulator(dev, "phy-dsi-supply",
-					   &priv->vdd_reg);
+					   &plat->vdd_reg);
 	if (ret && ret != -ENOENT) {
 		dev_err(dev, "Warning: cannot get phy dsi supply\n");
 		return -ENODEV;
 	}
 
 	if (ret != -ENOENT) {
-		ret = regulator_set_enable(priv->vdd_reg, true);
+		ret = regulator_set_enable(plat->vdd_reg, true);
 		if (ret)
 			return ret;
 	}
 
-	ret = clk_get_by_name(device->dev, "pclk", &clk);
+	ret = clk_get_by_name(device->dev, "pclk", &plat->pclk);
 	if (ret) {
 		dev_err(dev, "peripheral clock get error %d\n", ret);
-		goto err_reg;
+		return ret;
 	}
 
-	ret = clk_enable(&clk);
+	ret = clk_get_by_name(dev, "ref", &plat->refclk);
+	if (ret) {
+		dev_err(dev, "pll reference clock get error %d\n", ret);
+		return ret;
+	}
+
+	ret = reset_get_by_index(device->dev, 0, &plat->rst);
+	if (ret)
+		dev_err(dev, "missing dsi hardware reset\n");
+
+	return ret;
+}
+
+static int stm32_dsi_probe(struct udevice *dev)
+{
+	struct stm32_dsi_plat *plat = dev_get_plat(dev);
+	struct stm32_dsi_priv *priv = dev_get_priv(dev);
+	int ret;
+
+	ret = clk_enable(&plat->pclk);
 	if (ret) {
 		dev_err(dev, "peripheral clock enable error %d\n", ret);
 		goto err_reg;
 	}
 
-	ret = clk_get_by_name(dev, "ref", &clk);
-	if (ret) {
-		dev_err(dev, "pll reference clock get error %d\n", ret);
-		goto err_clk;
-	}
-
-	priv->pllref_clk = (unsigned int)clk_get_rate(&clk);
-
-	ret = reset_get_by_index(device->dev, 0, &rst);
-	if (ret) {
-		dev_err(dev, "missing dsi hardware reset\n");
-		goto err_clk;
-	}
+	priv->pllref_clk = (unsigned int)clk_get_rate(&plat->refclk);
 
 	/* Reset */
-	reset_deassert(&rst);
+	reset_deassert(&plat->rst);
 
 	/* check hardware version */
-	priv->hw_version = dsi_read(priv, DSI_VERSION) & VERSION;
+	priv->hw_version = dsi_read(plat->base, DSI_VERSION) & VERSION;
 	if (priv->hw_version != HWVER_130 &&
 	    priv->hw_version != HWVER_131) {
 		dev_err(dev, "DSI version 0x%x not supported\n", priv->hw_version);
@@ -489,9 +501,9 @@ static int stm32_dsi_probe(struct udevice *dev)
 
 	return 0;
 err_clk:
-	clk_disable(&clk);
+	clk_disable(&plat->pclk);
 err_reg:
-	regulator_set_enable(priv->vdd_reg, false);
+	regulator_set_enable(plat->vdd_reg, false);
 
 	return ret;
 }
@@ -512,6 +524,8 @@ U_BOOT_DRIVER(stm32_dsi) = {
 	.of_match			= stm32_dsi_ids,
 	.bind				= stm32_dsi_bind,
 	.probe				= stm32_dsi_probe,
+	.of_to_plat			= stm32_dsi_of_to_plat,
 	.ops				= &stm32_dsi_ops,
+	.plat_auto		= sizeof(struct stm32_dsi_plat),
 	.priv_auto		= sizeof(struct stm32_dsi_priv),
 };

---
base-commit: b5213bbfdcb1812be510427857827ee8becb9f8f
change-id: 20260205-dsi-97ce082cf022

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
