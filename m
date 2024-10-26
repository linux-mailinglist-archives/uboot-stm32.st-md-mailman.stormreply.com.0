Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D09B1AAF
	for <lists+uboot-stm32@lfdr.de>; Sat, 26 Oct 2024 22:18:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7596C78018;
	Sat, 26 Oct 2024 20:18:29 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C071C6DD9D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Oct 2024 20:18:25 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XbWDw1YNFz9t3b;
 Sat, 26 Oct 2024 22:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sEiwIN9kew2gB8b0Hp3qTXyd/l5nRR2lAX6+QuexzH4=;
 b=m8F2C8RGcuH0riIg1KuKjOpxVXhnTvvL0ml4v2mjbW7QHB3flMrCQqpkljNwUjbGcN1S+a
 qhV7C0eZPFZ6JmYdM59pSyK1+k0VMIL0T4ZwKk44yOcew+2nxnx7Ox8k5Pj+ByjD/kKshH
 AZQUOUacrP5+J3KD0U+4vz0USkBAO0hCP3wYbADSY/bEISXDBPl8VIAtIQ1IWzypFZ06UF
 FH+Tk3l8eB2dFnY8WG+cpBxawXskVJdyT3W//DNCvktxyvN3xcxVVH1bC/ndB2H9Ta0GZd
 0CavKTObamyTTUghnNhCuSvCpVgkwxE9S3Cpain13CkfSvpDZftw/e8V20xsxw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sEiwIN9kew2gB8b0Hp3qTXyd/l5nRR2lAX6+QuexzH4=;
 b=QroXca94vcSoCQRJXFPj3ZOxkOGeG8Nbp9SkHey/r72VTve+kiM2ZYkWIOVCBBIjUcRZu8
 34HdVvUMu6BrIwqGJc9K6gJ9Z3Ti1bengaGCafgvkILEWT8iXYEckIbO1C8VtoTszigdDl
 BdVUz9Os6cyVTkAmGxOWEVU12/H4rWcGjQOHDUA9/J8Wx7bnhfEgFvLbY2c/km3L03Amz7
 3+wp5xRez5BAVVX4GhalEP7cLTvdIurGCwAdk3CI2b8uNJwsSMetqR9rSBQXkhtNVXuy8X
 NgoSdXrXyUVKxLTzB0stb6SovMjmLN6ICpHziMstiwuaNcLilX1BueXWpu00RA==
To: u-boot@lists.denx.de
Date: Sat, 26 Oct 2024 22:16:19 +0200
Message-ID: <20241026201741.171073-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: bkrkms5rtftmi5anogwgwwxtbhynjjnc
X-MBO-RS-ID: 2787c5824ccf8689503
X-Rspamd-Queue-Id: 4XbWDw1YNFz9t3b
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
Subject: [Uboot-stm32] [PATCH 2/9] mtd: spi-nor: Remove recently added
	spi_nor_wait_till_ready() call
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

Remove undocumented spi_nor_wait_till_ready() call. This was added in commit
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
 drivers/mtd/spi/spi-nor-core.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index 8dfdcda47fb..0b131ad9aba 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -1631,10 +1631,6 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 		if (read_len == 0)
 			return -EIO;
 
-		ret = spi_nor_wait_till_ready(nor);
-		if (ret)
-			goto read_err;
-
 		ret = nor->read(nor, offset, read_len, buf);
 		if (ret == 0) {
 			/* We shouldn't see 0-length reads */
@@ -2018,10 +2014,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		page_remain = min_t(size_t,
 				    nor->page_size - page_offset, len - i);
 
-		ret = spi_nor_wait_till_ready(nor);
-		if (ret)
-			goto write_err;
-
 		write_enable(nor);
 		/*
 		 * On DTR capable flashes like Micron Xcella the writes cannot
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
