Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D0F4271A0
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03066C5719E;
	Fri,  8 Oct 2021 19:57:06 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E5B1C597B4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:03 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 w9-20020a4adec9000000b002b696945457so2732274oou.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JHbiz0iaVRMg6HsVaEAEKWQSFDBMaD3bbrJ9TcJR2B4=;
 b=AP15M0dLFsorgRC2QzVXDU6TCSUoveFEcnQyJESxFYiLtqnRk6AlDeI82hp/NG9d0E
 uSGLiDhhW0JgHeO+ul25z0jIhmW4+jJSRhGU6ahTIj8c1sylokHeqDyeTgGunMuCNglJ
 ym6jvecpzBwWYYEE2JcMasd0bj11sBBoaPGFs+zuK5UYPVAh23a2ANLXouwzdwaL8wGG
 wYAXsoF+jd8nUZaPpU9hVu7ggwrth6mb7n5OW37nj0uTJt/jMe6O253EPnym4kMZ4K5v
 hzQ9g+MmsXVlYDHBHyZ71CFKSb0z7R4wWnWi1gIAPdWPTgolfKTC8k1k4ZXndIlyQY/P
 RXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JHbiz0iaVRMg6HsVaEAEKWQSFDBMaD3bbrJ9TcJR2B4=;
 b=H40DVMQ1Nej7xyE1N/2FcWABx326lHX51291cWov3yPEuM/ZPJeaX9cDscz12x9LtF
 ozLBSlubvaKv0B/WZuGiEDocRhq2lwT0RLalxFd5ERtOl2MN0GEDeISJGJcQYF2AR+Mw
 9gtaSWk2/MvtIQDebmSo6OsZLaE5s1tLcy7wSX1C5jNDO6bvmzfiAlwUmii7Ufr5hoql
 5u7j4a3OWeizbhSyMs6RsYL+luHbUtKT6edKXf/8cnsu1NlDI79zkWlbZAYxjZTF90Zf
 dCjpEeEYFiQuXtFe3HwH+LrQZFNSePK2IqqkgYPiBW5ehxpBzuX1pNfdxSxBbrXwr/RJ
 cJzQ==
X-Gm-Message-State: AOAM533G1gPIFQ4j7/hivRCBV43vGheH3r9/j8rD34GXyH5qivbeIPz5
 3HbnJLJUnulpkdEKoBKNcTc=
X-Google-Smtp-Source: ABdhPJxDFHRcvMqbt00qpAYb8+Oogypb1l/nFVs90D3zOuuXH+1bPQKIW3ECvb+gk0KnFcVUWHWWsg==
X-Received: by 2002:a4a:e8c5:: with SMTP id h5mr9313720ooe.71.1633723022387;
 Fri, 08 Oct 2021 12:57:02 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:57:01 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:45 -0500
Message-Id: <20211008195655.46046-4-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 03/13] stm32mp1: Add support for baudrates
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
index 06cd153d13..b12896bc07 100644
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
