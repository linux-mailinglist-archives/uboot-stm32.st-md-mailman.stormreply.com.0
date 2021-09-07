Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F88A4031AB
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Sep 2021 01:59:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C87C0C5A4D4;
	Tue,  7 Sep 2021 23:59:42 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03E16C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 23:59:40 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id x5so349753qtq.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 16:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46Ff6DXnPhnhpLOpPuoqbPtFXloThXqssAgjfYcbqz4=;
 b=Nxb151d6zGyTlo8mOPE92qnjwX85P7y/Cv3SeuGkFr1Exup+pupBoq4A74Vg7tvoO2
 0qn1BFEmggsnWBg9VJmJQMWx9O9NpsAK/mqpdESQGC9uKKrglmPlieQumEXTOgCzrVkt
 wBaz1wqKFBwGNbL8xy86akiZg2BEjruZrOH+b41P9DqklPlq1PtSg3c+gajGoK4gq8IF
 Q8fmBxLDO/D6GO/bqaP2LDXkZPSZUNHiCA77MEonjndp+8l4E7SOyzRI9lpzddyK5rGg
 l+0gjRlxVLOi0x3BAhX+M+/xsyjoXvSqXokIvwS/d1hmX4laTii5/6bmGr4P0gk4Z1yO
 Cudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46Ff6DXnPhnhpLOpPuoqbPtFXloThXqssAgjfYcbqz4=;
 b=V7FU2qqVFmyAc+OJPLQoV+wfX1bGWmJKkGV44gXp8dWXPGSL8PrTz8+GrzoCVGNQNC
 ANF9kraVes46LsBGst9lARFHYsJdk8uPljV3KEERvd/vxET3KQeEuYZr+mnnAHbunFQC
 ETPDgeWKB4jYc2bfDDpGoKNkFTgXonnXKRKvAPWAvS7qhvY3XLTNRJ21lt56Szbk7mNu
 dcSqP2m28zm4N0MMpy+TxL9TDzTrc8S/PPqn4cQCOLLQVoI138LsWJUw8nofUWyvpMOg
 g+6hFundMw1ZgGOeCuCDcjBADDMaVGeM3FzWZf/b7IymfvC8mPu/DXYxMc6jMX1DaeID
 oqNw==
X-Gm-Message-State: AOAM532cYxJ5OQePz/RKu51gQa3HT9rtYELStbtdkNZsKPrjG97BXdYz
 pwuTa9hUVY/yvJfGrFKJ0T8=
X-Google-Smtp-Source: ABdhPJwyZBB6QPgMjEhm/pFdqkReFnBvBnOLZrYYPQ+Zuv4uYUIOguKYbDrWCfphAWEEIVWn+PiDcQ==
X-Received: by 2002:a05:622a:118f:: with SMTP id
 m15mr1067005qtk.107.1631059178900; 
 Tue, 07 Sep 2021 16:59:38 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id d78sm460351qkg.92.2021.09.07.16.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 16:59:38 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Tue,  7 Sep 2021 18:59:24 -0500
Message-Id: <20210907235933.2798330-3-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
References: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 02/11] stm32mp1: Add support for baudrates
	higher than 115200
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

The UART can reliably go up to 2000000 baud when connected to the
on-board st-link. Unfortunately u-boot will fall back to 115200 unless
higher rates are declared via CONFIG_SYS_BAUDRATE_TABLE.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
 include/configs/stm32mp1.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index b372838be8..9fcd60285a 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -16,6 +16,10 @@
 #define CONFIG_ARMV7_SECURE_MAX_SIZE		STM32_SYSRAM_SIZE
 #endif
 
+#define CONFIG_SYS_BAUDRATE_TABLE      { 9600, 19200, 38400, 57600, 115200, \
+					 230400, 460800, 921600, \
+					 1000000, 2000000 }
+
 /*
  * Configuration of the external SRAM memory used by U-Boot
  */
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
