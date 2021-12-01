Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3AB465672
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Dec 2021 20:27:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CB28C5A4D4;
	Wed,  1 Dec 2021 19:27:10 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E067DC597AB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Dec 2021 19:27:08 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id gu12so22718809qvb.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Dec 2021 11:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qkir6Eo9OT/LIQBdmw6eCZnJV2CNKf7AWESETFhxvBY=;
 b=fQbo6ERMPPA1i8gzpIoHOv3T8B1QEVvGeQGFPFrgaH+G5Pi71+9TelGgkf89B3ueVQ
 QDKkrAIRpAZ1vAwCi/a0ntPZZSX5CwpnTi+Cc47QyOVy4pTiMvsv7W6xFS4tdKO7S//N
 yaKwM/IEI54XuTkIeW8ezzgOwzF5fy375X1dGselB0eynZ/W/nKru+qivRm12dt+9uVT
 82xGqa3/Wz2YzBuDsvLa2WyKnDIlT91jVsGU9JzevvPIUf//1ZRIvSyumyZo1rJBKddt
 S60LZSlL2y0IJgnPpyhHuq8k5XtEbDYuQHf4lSfYLJwEInJM5bbiC1q9FZip6Gzz39ct
 6NMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qkir6Eo9OT/LIQBdmw6eCZnJV2CNKf7AWESETFhxvBY=;
 b=mIH1x0h+o72jVt1VLa0oEuYccqBIAHezlGOsTLu/OwEs2x0G289uAG49utI1FoX4Ql
 oVOMYOjmoVjf78lELKQJssCSqz42Q1bB8XrH+5waTaGH9m3MaoeTf8dYiq1xPXoMQYvW
 OhU4ipN/MAdwX+mx4sq18vVldQ3sBoxh11UlAIDTD+rtxO+RSVBENXwIEBmA3cAixAZ2
 9uSWfCQtL70ucna8xhRThTGCKcTAGLdHZWdoYkMaX7PMdEbOlHZWOW6SCtrYM/VH3TPY
 dUvyVmthDHiYjJWzdNKvgsleuxpJIQ/8fTcCxkJm1OCbs0sK5J0g6rvlp0SZFdQODdI4
 iJfA==
X-Gm-Message-State: AOAM533LE1pUNHlxOkTBPjOpzh/cvdlQyi9LX4iXt+tl4XRb7s+RBaPo
 0iJY9z9HBD9iRehrKGM3JGk=
X-Google-Smtp-Source: ABdhPJw9AHnVHyWQRJHTNhm9hjXFykJApA75t/PWn6m0OANkH0C2Xoi4+hwEICUcw20KRSBm4+/OlQ==
X-Received: by 2002:a05:6214:400e:: with SMTP id
 kd14mr8431473qvb.70.1638386827884; 
 Wed, 01 Dec 2021 11:27:07 -0800 (PST)
Received: from godwin.fios-router.home
 (pool-108-18-207-184.washdc.fios.verizon.net. [108.18.207.184])
 by smtp.gmail.com with ESMTPSA id v12sm388531qtx.80.2021.12.01.11.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 11:27:07 -0800 (PST)
From: Sean Anderson <seanga2@gmail.com>
To: Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de
Date: Wed,  1 Dec 2021 14:26:53 -0500
Message-Id: <20211201192653.2171260-1-seanga2@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Hai Pham <hai.pham.ud@renesas.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dario Binacchi <dariobin@libero.it>
Subject: [Uboot-stm32] [PATCH] treewide: invaild -> invalid
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

Somewhere along the way, someone misspelt "invalid" and it got copied
everywhere. Fix it.

Signed-off-by: Sean Anderson <seanga2@gmail.com>
---

 drivers/clk/clk-uclass.c               | 2 +-
 drivers/clk/clk_stm32f.c               | 2 +-
 drivers/clk/clk_stm32h7.c              | 2 +-
 drivers/clk/clk_versaclock.c           | 2 +-
 drivers/clk/renesas/clk-rcar-gen2.c    | 2 +-
 drivers/clk/renesas/clk-rcar-gen3.c    | 2 +-
 drivers/clk/ti/clk-ctrl.c              | 2 +-
 drivers/dma/dma-uclass.c               | 2 +-
 drivers/hwspinlock/hwspinlock-uclass.c | 2 +-
 drivers/mailbox/k3-sec-proxy.c         | 2 +-
 drivers/mailbox/mailbox-uclass.c       | 2 +-
 drivers/mailbox/tegra-hsp.c            | 2 +-
 drivers/misc/irq-uclass.c              | 2 +-
 drivers/mux/mux-uclass.c               | 2 +-
 drivers/phy/phy-uclass.c               | 2 +-
 drivers/reset/reset-uclass.c           | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index 493018b33e..e5defd7ca8 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -57,7 +57,7 @@ static int clk_of_xlate_default(struct clk *clk,
 	debug("%s(clk=%p)\n", __func__, clk);
 
 	if (args->args_count > 1) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		debug("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/clk/clk_stm32f.c b/drivers/clk/clk_stm32f.c
index e7c26db51c..ed7660196e 100644
--- a/drivers/clk/clk_stm32f.c
+++ b/drivers/clk/clk_stm32f.c
@@ -703,7 +703,7 @@ static int stm32_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *args)
 	dev_dbg(clk->dev, "clk=%p\n", clk);
 
 	if (args->args_count != 2) {
-		dev_dbg(clk->dev, "Invaild args_count: %d\n", args->args_count);
+		dev_dbg(clk->dev, "Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/clk/clk_stm32h7.c b/drivers/clk/clk_stm32h7.c
index 20b3647099..d440c28eb4 100644
--- a/drivers/clk/clk_stm32h7.c
+++ b/drivers/clk/clk_stm32h7.c
@@ -835,7 +835,7 @@ static int stm32_clk_of_xlate(struct clk *clk,
 			struct ofnode_phandle_args *args)
 {
 	if (args->args_count != 1) {
-		dev_dbg(clk->dev, "Invaild args_count: %d\n", args->args_count);
+		dev_dbg(clk->dev, "Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/clk/clk_versaclock.c b/drivers/clk/clk_versaclock.c
index 578668bcf8..89c8d02336 100644
--- a/drivers/clk/clk_versaclock.c
+++ b/drivers/clk/clk_versaclock.c
@@ -627,7 +627,7 @@ static int vc5_clk_out_xlate(struct clk *hw, struct ofnode_phandle_args *args)
 	unsigned int idx = args->args[0];
 
 	if (args->args_count != 1) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		debug("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index d2d0169dd8..3a68c5ad0e 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -256,7 +256,7 @@ static ulong gen2_clk_set_rate(struct clk *clk, ulong rate)
 static int gen2_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *args)
 {
 	if (args->args_count != 2) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		debug("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/clk/renesas/clk-rcar-gen3.c b/drivers/clk/renesas/clk-rcar-gen3.c
index 6cf07fb418..bcf5865222 100644
--- a/drivers/clk/renesas/clk-rcar-gen3.c
+++ b/drivers/clk/renesas/clk-rcar-gen3.c
@@ -365,7 +365,7 @@ static ulong gen3_clk_set_rate(struct clk *clk, ulong rate)
 static int gen3_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *args)
 {
 	if (args->args_count != 2) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		debug("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/clk/ti/clk-ctrl.c b/drivers/clk/ti/clk-ctrl.c
index 8ac085ee4f..6cc02d2eea 100644
--- a/drivers/clk/ti/clk-ctrl.c
+++ b/drivers/clk/ti/clk-ctrl.c
@@ -83,7 +83,7 @@ static int clk_ti_ctrl_of_xlate(struct clk *clk,
 				struct ofnode_phandle_args *args)
 {
 	if (args->args_count != 2) {
-		dev_err(clk->dev, "invaild args_count: %d\n", args->args_count);
+		dev_err(clk->dev, "invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/dma/dma-uclass.c b/drivers/dma/dma-uclass.c
index 652ddbb62b..012609bb53 100644
--- a/drivers/dma/dma-uclass.c
+++ b/drivers/dma/dma-uclass.c
@@ -35,7 +35,7 @@ static int dma_of_xlate_default(struct dma *dma,
 	debug("%s(dma=%p)\n", __func__, dma);
 
 	if (args->args_count > 1) {
-		pr_err("Invaild args_count: %d\n", args->args_count);
+		pr_err("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/hwspinlock/hwspinlock-uclass.c b/drivers/hwspinlock/hwspinlock-uclass.c
index cbe7236011..e012d5a4c9 100644
--- a/drivers/hwspinlock/hwspinlock-uclass.c
+++ b/drivers/hwspinlock/hwspinlock-uclass.c
@@ -25,7 +25,7 @@ static int hwspinlock_of_xlate_default(struct hwspinlock *hws,
 				       struct ofnode_phandle_args *args)
 {
 	if (args->args_count > 1) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		debug("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/mailbox/k3-sec-proxy.c b/drivers/mailbox/k3-sec-proxy.c
index 20fdb09f31..a862e55bc3 100644
--- a/drivers/mailbox/k3-sec-proxy.c
+++ b/drivers/mailbox/k3-sec-proxy.c
@@ -116,7 +116,7 @@ static int k3_sec_proxy_of_xlate(struct mbox_chan *chan,
 	debug("%s(chan=%p)\n", __func__, chan);
 
 	if (args->args_count != 1) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		debug("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 	ind = args->args[0];
diff --git a/drivers/mailbox/mailbox-uclass.c b/drivers/mailbox/mailbox-uclass.c
index 01c9e75fa5..85ba8c5fd9 100644
--- a/drivers/mailbox/mailbox-uclass.c
+++ b/drivers/mailbox/mailbox-uclass.c
@@ -24,7 +24,7 @@ static int mbox_of_xlate_default(struct mbox_chan *chan,
 	debug("%s(chan=%p)\n", __func__, chan);
 
 	if (args->args_count != 1) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		debug("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 1d66d95fe4..08c51c40f1 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -77,7 +77,7 @@ static int tegra_hsp_of_xlate(struct mbox_chan *chan,
 	debug("%s(chan=%p)\n", __func__, chan);
 
 	if (args->args_count != 2) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		debug("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/misc/irq-uclass.c b/drivers/misc/irq-uclass.c
index eb9f3b902f..7b79ed2df4 100644
--- a/drivers/misc/irq-uclass.c
+++ b/drivers/misc/irq-uclass.c
@@ -89,7 +89,7 @@ static int irq_of_xlate_default(struct irq *irq,
 	log_debug("(irq=%p)\n", irq);
 
 	if (args->args_count > 1) {
-		log_debug("Invaild args_count: %d\n", args->args_count);
+		log_debug("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/mux/mux-uclass.c b/drivers/mux/mux-uclass.c
index 91842c5539..8870305313 100644
--- a/drivers/mux/mux-uclass.c
+++ b/drivers/mux/mux-uclass.c
@@ -130,7 +130,7 @@ static int mux_of_xlate_default(struct mux_chip *mux_chip,
 	log_debug("%s(muxp=%p)\n", __func__, muxp);
 
 	if (args->args_count > 1) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		debug("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/phy/phy-uclass.c b/drivers/phy/phy-uclass.c
index 59683a080c..706e9fdf3a 100644
--- a/drivers/phy/phy-uclass.c
+++ b/drivers/phy/phy-uclass.c
@@ -23,7 +23,7 @@ static int generic_phy_xlate_offs_flags(struct phy *phy,
 	debug("%s(phy=%p)\n", __func__, phy);
 
 	if (args->args_count > 1) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		debug("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
diff --git a/drivers/reset/reset-uclass.c b/drivers/reset/reset-uclass.c
index c09c009130..ca9f00a8f2 100644
--- a/drivers/reset/reset-uclass.c
+++ b/drivers/reset/reset-uclass.c
@@ -26,7 +26,7 @@ static int reset_of_xlate_default(struct reset_ctl *reset_ctl,
 	debug("%s(reset_ctl=%p)\n", __func__, reset_ctl);
 
 	if (args->args_count != 1) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		debug("Invalid args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
-- 
2.33.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
