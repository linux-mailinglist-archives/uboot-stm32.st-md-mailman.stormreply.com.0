Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE099B1AB2
	for <lists+uboot-stm32@lfdr.de>; Sat, 26 Oct 2024 22:18:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDCCDC78023;
	Sat, 26 Oct 2024 20:18:30 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68EFBC6DD9D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Oct 2024 20:18:29 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XbWF10mQRz9skw;
 Sat, 26 Oct 2024 22:18:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUpraYsXhTq6Qs3z36kw6sbrKuOgRBC4vu4ya1bHr9U=;
 b=sDQ7dEJxJmBqUzfSTkfO7D26qoAZJn4m9keCZj+zAGn+Q8UW52FVdl6Vp94yItwbTpkFbM
 XGpKmlrtPo8r2CAnCr1EuzYD9//KbfumeMCIjwld0N1fgxh12NkX8tLd556iTx87qkSVQY
 AfVwGuJFxxVFwNBXG6/b8Fn4HhFl5/9Obl4jICzf0Tl/0fASQinvXVIxrLeYEZdaAWARjn
 j1qBnvRKRh8X5O98ZQmNLP3uNijAV2FRgeYaWe0/U/REdidjQQgmxMub+WWF5iTPX5zqOC
 Sh9lJf1+H3H9BYLpI9z9nxFWcKq3KOt8jVsDIRv3fKX0WdPzfr36N8bg92Kdug==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUpraYsXhTq6Qs3z36kw6sbrKuOgRBC4vu4ya1bHr9U=;
 b=ZevWuu7In84FjGe9d755lvoObpuShOqwwTKV+cpwSxnbmZ6u4g4zvvXMcYcLVgK0ohDYFU
 GJQrqgunIdGdKQYHSkjZlxjrqu7VT9fumYLu685FV6yfD8Mc06iQoiH6WyoI06RKsmcWLZ
 Re7/r8QShOtKv/n/OCAJNppbFboGzTFQHkW937LfE//DXEKZdGc+5z34wxaLcY9icFMqV+
 smhE9rqTvSGhTr3l/I3zcnjfH4pE/6Fauz0Gmsf2DsxWVeoOoV6n3l5rJdL5/lEFTmJ126
 p0mhA2jVaHxbWEh0mC0+/M3WLo/xQooD+vcoJcwL0Ld/6eXJQn/Vf8WglMbp0A==
To: u-boot@lists.denx.de
Date: Sat, 26 Oct 2024 22:16:21 +0200
Message-ID: <20241026201741.171073-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: rpm6rayed1xnhyah7chyzbqef1cmk6ta
X-MBO-RS-ID: c5a2266fe1fa926723a
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [Uboot-stm32] [PATCH 4/9] mtd: spi-nor: Remove recently added
	write_disable() call
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

Remove undocumented write_disable() call. This was added in commit
5d40b3d384dc ("mtd: spi-nor: Add parallel and stacked memories support")
without any explanation in the commit message. Remove it.

Fixes: 5d40b3d384dc ("mtd: spi-nor: Add parallel and stacked memories support")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Pratyush Yadav <p.yadav@ti.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 drivers/mtd/spi/spi-nor-core.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index 3114281832b..d22363e8267 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -2073,10 +2073,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		if (ret)
 			goto write_err;
 
-		ret = write_disable(nor);
-		if (ret)
-			goto write_err;
-
 		*retlen += written;
 		i += written;
 	}
@@ -2117,10 +2113,6 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	ret = write_disable(nor);
-	if (ret)
-		return ret;
-
 	ret = read_sr(nor);
 	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
 		dev_err(nor->dev, "Macronix Quad bit not set\n");
@@ -2182,7 +2174,7 @@ static int spansion_quad_enable_volatile(struct spi_nor *nor, u32 addr_base,
 		return -EINVAL;
 	}
 
-	return write_disable(nor);
+	return 0;
 }
 #endif
 
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
