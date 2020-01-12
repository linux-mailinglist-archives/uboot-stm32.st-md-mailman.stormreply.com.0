Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E07731387E2
	for <lists+uboot-stm32@lfdr.de>; Sun, 12 Jan 2020 20:07:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94215C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sun, 12 Jan 2020 19:07:01 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFBBBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2020 19:06:58 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id c16so7261813ioh.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2020 11:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OliDLNCfwyNfVeIHxO6RiVl1FnkrEQBSGKMidGcjc04=;
 b=WgnjPy0s6xrhS29byRjt9A9tRtYgJ1ar6x1PZmZQd93x5Cugl91mlOWbAU2H5C7KPk
 fQUzK8+BP4HnO87IBQLlLh8w9svJmHpjlMts7CNiUODs1s8FziiWsWeks3xz6zvxnVyM
 Q/7gp4mARvDzS1s1+UTsK/I0IwGDjdHuDtdao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OliDLNCfwyNfVeIHxO6RiVl1FnkrEQBSGKMidGcjc04=;
 b=saHqS04ZZSD5jz4WUeRtaZ+UcQsD4fkmLc0hOpDm7O6ioyyvKI64RxEvMHke3NsvNH
 RJ4dRartsoNjgEDguTUZrKiTGnh8FzllKImQ56JC5RNqyEJinDt0lMfvNXUYyTHKtbu4
 FfFU61qBGj6VNHOHTZB+z9fvF8hgtXT4Kqir3/GWQYcf/VNPQ4yFKAs8/I8o2tAezvuF
 bI0V1sffZapQ1jcAPMn5rnszbWTcSJLM3585xZMPsTzWKt4yVvV6WK3JiXTWlGhdEasT
 hZdBPmpx0ZXBhP7KKYRJZrzcYQ4y/CiS7w99okQMxwwSDte5OxWa3XF552fWuLGStDqM
 akwQ==
X-Gm-Message-State: APjAAAW/XrJjGcV07uPW+cvOJ2xKszsmfsNej/ZOO+rcJdtQ2DrgZtyJ
 1WXOFADHG3KRkTUGc5366o/yRA==
X-Google-Smtp-Source: APXvYqx8zFX38kMZSBCO+byxmGCAAvZlFlj0F9niPkuAltjQkhIMAkIpSKJRG+1nycDb2A1kVvBR+A==
X-Received: by 2002:a5d:9f4f:: with SMTP id u15mr9833476iot.129.1578856017387; 
 Sun, 12 Jan 2020 11:06:57 -0800 (PST)
Received: from kiwi.bld.corp.google.com ([2620:15c:183:0:8223:87c:a681:66aa])
 by smtp.gmail.com with ESMTPSA id
 r22sm3039219ilb.25.2020.01.12.11.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 11:06:57 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 12 Jan 2020 12:05:55 -0700
Message-Id: <20200112120216.4.I48608cdc95aee9e6e906d0e8d3b4169eeb104558@changeid>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200112190624.79077-1-sjg@chromium.org>
References: <20200112190624.79077-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Simon Glass <sjg@chromium.org>, Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Ibai Erkiaga <ibai.erkiaga-elorza@xilinx.com>
Subject: [Uboot-stm32] [PATCH 04/33] mailbox: Rename free() to rfree()
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

 drivers/mailbox/k3-sec-proxy.c   | 2 +-
 drivers/mailbox/mailbox-uclass.c | 4 ++--
 drivers/mailbox/sandbox-mbox.c   | 2 +-
 drivers/mailbox/stm32-ipcc.c     | 2 +-
 drivers/mailbox/tegra-hsp.c      | 2 +-
 include/mailbox-uclass.h         | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/k3-sec-proxy.c b/drivers/mailbox/k3-sec-proxy.c
index b07b56cf97..1194c6f029 100644
--- a/drivers/mailbox/k3-sec-proxy.c
+++ b/drivers/mailbox/k3-sec-proxy.c
@@ -291,7 +291,7 @@ static int k3_sec_proxy_recv(struct mbox_chan *chan, void *data)
 struct mbox_ops k3_sec_proxy_mbox_ops = {
 	.of_xlate = k3_sec_proxy_of_xlate,
 	.request = k3_sec_proxy_request,
-	.free = k3_sec_proxy_free,
+	.rfree = k3_sec_proxy_free,
 	.send = k3_sec_proxy_send,
 	.recv = k3_sec_proxy_recv,
 };
diff --git a/drivers/mailbox/mailbox-uclass.c b/drivers/mailbox/mailbox-uclass.c
index 5968c9b7eb..a6d2d1f5b8 100644
--- a/drivers/mailbox/mailbox-uclass.c
+++ b/drivers/mailbox/mailbox-uclass.c
@@ -105,8 +105,8 @@ int mbox_free(struct mbox_chan *chan)
 
 	debug("%s(chan=%p)\n", __func__, chan);
 
-	if (ops->free)
-		return ops->free(chan);
+	if (ops->rfree)
+		return ops->rfree(chan);
 
 	return 0;
 }
diff --git a/drivers/mailbox/sandbox-mbox.c b/drivers/mailbox/sandbox-mbox.c
index bc917b3de4..442ca633a1 100644
--- a/drivers/mailbox/sandbox-mbox.c
+++ b/drivers/mailbox/sandbox-mbox.c
@@ -87,7 +87,7 @@ static const struct udevice_id sandbox_mbox_ids[] = {
 
 struct mbox_ops sandbox_mbox_mbox_ops = {
 	.request = sandbox_mbox_request,
-	.free = sandbox_mbox_free,
+	.rfree = sandbox_mbox_free,
 	.send = sandbox_mbox_send,
 	.recv = sandbox_mbox_recv,
 };
diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index c3df9678a7..d4035a85f2 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -152,7 +152,7 @@ static const struct udevice_id stm32_ipcc_ids[] = {
 
 struct mbox_ops stm32_ipcc_mbox_ops = {
 	.request = stm32_ipcc_request,
-	.free = stm32_ipcc_free,
+	.rfree = stm32_ipcc_free,
 	.send = stm32_ipcc_send,
 	.recv = stm32_ipcc_recv,
 };
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 9bee886561..c463e6a2be 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -175,7 +175,7 @@ static const struct udevice_id tegra_hsp_ids[] = {
 struct mbox_ops tegra_hsp_mbox_ops = {
 	.of_xlate = tegra_hsp_of_xlate,
 	.request = tegra_hsp_request,
-	.free = tegra_hsp_free,
+	.rfree = tegra_hsp_free,
 	.send = tegra_hsp_send,
 	.recv = tegra_hsp_recv,
 };
diff --git a/include/mailbox-uclass.h b/include/mailbox-uclass.h
index e0618aad97..3c60c76506 100644
--- a/include/mailbox-uclass.h
+++ b/include/mailbox-uclass.h
@@ -49,14 +49,14 @@ struct mbox_ops {
 	 */
 	int (*request)(struct mbox_chan *chan);
 	/**
-	 * free - Free a previously requested channel.
+	 * rfree - Free a previously requested channel.
 	 *
 	 * This is the implementation of the client mbox_free() API.
 	 *
 	 * @chan:	The channel to free.
 	 * @return 0 if OK, or a negative error code.
 	 */
-	int (*free)(struct mbox_chan *chan);
+	int (*rfree)(struct mbox_chan *chan);
 	/**
 	* send - Send a message over a mailbox channel
 	*
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
