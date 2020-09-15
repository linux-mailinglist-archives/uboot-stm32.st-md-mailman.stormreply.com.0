Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE04226AE19
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Sep 2020 21:52:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97F9BC3FADE
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Sep 2020 19:52:00 +0000 (UTC)
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BBEAC3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 19:51:58 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id b12so1068888oop.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 12:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ssCJQEMyjxevZ+K2X8hpxvUv+eio8ZdKxfR9v2XRRTM=;
 b=PdVwI3e6rTyDzukhCcjmqn6GJapMIv0AJL8FHq8gZqlkXBdjN+FHqf34dDQpOMmeBN
 IUMaA5bYHAWhX+/VE8g09Da/KyTBJXbzQU+g4w6pH5GoPV8szmpZineVNtzg78QcMwU2
 Xst6/zZnFr8cS2pjv5l2ZVxhfnwThv7zZ+0LUPshBnPsnFUOjKJgEZ/sMm2EMLp51lYB
 DIwj/ia7pGPwAyHkojzkdhPbsDu572X+btvjfuT0Ugwm90gTvDS+II36KYAVFV1ktmGZ
 lwQL3Ho7OoALVoIOyEDfUlUQXPYpzLVHSBycka3f9OX7sQzJgwNQz/AoznHD7t0qsnL1
 VW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ssCJQEMyjxevZ+K2X8hpxvUv+eio8ZdKxfR9v2XRRTM=;
 b=K23QHXL9sk5/cmOAii3H16k+14Z09IoMW/MmZ4a874sq3MPjQHroPjGJiuZq84J6iM
 kwht5Bjb8bBYdOb4WVYtN7VXdASfr7/2vtGIPQvDLE1KlUyJEf9IaPjL8LqZLqfaDTDA
 RGm9qWKXDck2uK8+43sTvIG0tNJ6JQ2bHuE7QRUga7SNeRUUN718Ng/+KiTeV3mzp7xs
 mSRBoblE32aOLBwtjmfOi1V0SUTlJRKXzbRSrK53qoCUg9544MZ8PvTXvdlbIPXDpzoK
 B8xMCBdUtWmdW9Mr4U7/8hZL0a/JTji/VDXr80FvmRVStbQmv2zPyt1JhgurzB8q4UB1
 aRfg==
X-Gm-Message-State: AOAM532nxO9PPyUauXduuDjoiDR+zcPN9yMpOGwR+Rv7rCcHgDvtI8L1
 hI5BYg3i5jXHBXv04+TAep1lhBK5l8c=
X-Google-Smtp-Source: ABdhPJyWIkkTbjlpdAv0Kg1tHX/KT1Ffn6zsGUJd6NegRFbyeCOSZ1j9M12v+V8/Kp5a+pU73S8nqQ==
X-Received: by 2002:a4a:614f:: with SMTP id u15mr15167379ooe.70.1600199516713; 
 Tue, 15 Sep 2020 12:51:56 -0700 (PDT)
Received: from nuclearis2-1.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id t7sm7896874ooq.0.2020.09.15.12.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 12:51:56 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: uboot-stm32@st-md-mailman.stormreply.com,
	peng.fan@nxp.com
Date: Tue, 15 Sep 2020 14:51:46 -0500
Message-Id: <20200915195147.2659607-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200909215402.366561-1-mr.nuke.me@gmail.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: u-boot@lists.denx.de, Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] mmc: mmc_of_parse: Enable 52 MHz support
	with "cap-mmc-highspeed"
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

"cap-mmc-highspeed" enables support for 26 MHz MMC, but there is no
additional flag to enable 52 MHz MMC. In Linux. "cap-mmc-highspeed"
is used for MMC HS at both 26MHz and 52MHz.

Use the same approach and enable MMC_CAP(MMC_HS_52) host capability
when "cap-mmc-highspeed" is found in the devicetree. In the event an
MMC card doesn't support 52 MHz, it will be clocked at a speed based
on its EXT CSD, even on 52 MHz host controllers

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/mmc/mmc-uclass.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/mmc-uclass.c b/drivers/mmc/mmc-uclass.c
index 90690c8d1e..6d2310eff3 100644
--- a/drivers/mmc/mmc-uclass.c
+++ b/drivers/mmc/mmc-uclass.c
@@ -198,7 +198,7 @@ int mmc_of_parse(struct udevice *dev, struct mmc_config *cfg)
 	if (dev_read_bool(dev, "cap-sd-highspeed"))
 		cfg->host_caps |= MMC_CAP(SD_HS);
 	if (dev_read_bool(dev, "cap-mmc-highspeed"))
-		cfg->host_caps |= MMC_CAP(MMC_HS);
+		cfg->host_caps |= MMC_CAP(MMC_HS) | MMC_CAP(MMC_HS_52);
 	if (dev_read_bool(dev, "sd-uhs-sdr12"))
 		cfg->host_caps |= MMC_CAP(UHS_SDR12);
 	if (dev_read_bool(dev, "sd-uhs-sdr25"))
-- 
2.25.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
