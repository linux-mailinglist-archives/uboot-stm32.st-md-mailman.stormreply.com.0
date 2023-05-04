Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B081F6F74AE
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 May 2023 21:52:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79344C6A5ED;
	Thu,  4 May 2023 19:52:36 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 187F0C69073
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 May 2023 19:52:36 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 84093857CF;
 Thu,  4 May 2023 21:52:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683229955;
 bh=zatEt5aAGm/I7DU5gxiRLFI+Fv1bRslOwERhKvS8qgA=;
 h=From:To:Cc:Subject:Date:From;
 b=kOOs9n+ktaxpc6KujF374Gqxi9XdWAsC+bcobxZI+UR8X/aDcKzUk2l3Xhp7hjxSE
 F0SJMmsaQn4DjLpRjt/Il69CqtfoKULx3Iqv1jtrHkZ8AQkY9gy+xk35x8VFO49/bM
 0wcGkp+i3kKNuC2odlT+JsGk/Hq8XAJzADa2Rq/Fo7s0Ri5d+1IFOXqCckMDIJeBzv
 FCkW3N+wRKX8BWblT55qGRM2CZI3sZ4XSsVgtFkF7WAV7oXwC72DNZiUwtWwqlfyy1
 cg+vm08IjWdzIHkasIzWXKQl3hjuuOb+9HINXwk6o8ZjlsTmagPWhj/HdKHBw5uux4
 IhSFd+z98zW7w==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Thu,  4 May 2023 21:52:30 +0200
Message-Id: <20230504195230.4973-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Add missing header for
	save_boot_params
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

The get_stm32mp_rom_api_table() function is defined in sys_params.h ,
add the missing header to avoid compiler warning.

Fixes: dbeaca79b79 ("ARM: stm32: Factor out save_boot_params")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/ecdsa_romapi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32mp/ecdsa_romapi.c b/arch/arm/mach-stm32mp/ecdsa_romapi.c
index 12b42b9d59c..93c561c69b1 100644
--- a/arch/arm/mach-stm32mp/ecdsa_romapi.c
+++ b/arch/arm/mach-stm32mp/ecdsa_romapi.c
@@ -5,6 +5,7 @@
  * Implements ECDSA signature verification via the STM32MP ROM.
  */
 #include <asm/system.h>
+#include <asm/arch/sys_proto.h>
 #include <dm/device.h>
 #include <linux/types.h>
 #include <u-boot/ecdsa.h>
-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
