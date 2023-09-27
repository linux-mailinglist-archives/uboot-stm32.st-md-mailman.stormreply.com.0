Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 577C97B12CD
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Sep 2023 08:25:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FFB0C6B473;
	Thu, 28 Sep 2023 06:25:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64334C6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 12:46:46 +0000 (UTC)
Received: from maia.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: hws@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D12B986D59;
 Wed, 27 Sep 2023 14:46:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1695818806;
 bh=FvD66zdZNTnLz/Oia9Tt6/38K4QCX9PStrkbt4XStjA=;
 h=From:To:Cc:Subject:Date:From;
 b=g+HZ878BE8GV0+c2pP8GolBHYTMjHZfsKxoxIGBPdyLnachJAaPhviTSKrIcccaIe
 4zrf6DBPzr0NfV9bOqASkmN7Xyk+WmjfvmvJQ5lCSIu4t0IpoesRWj75jD0wEbHyF1
 kDriHp3itQ1IqK9VJqYFZx7/3lt3mkRV3bl0vxOyveFRcqvIq8BLd/xrPD/dDkroUj
 Svs1st+cAifp9DMdN5XXJLoNaFEUM380Lnm9+VE9sYW5kfpD97QeQ6No/q07UrgOim
 8bssfFsw1Ov9tZQRIvS3QJmJv2GPU9Czs/4ljkoqgi25pLeQKHPdOjNSCjpEXML9T4
 AmgO5H4mGiJBA==
From: Harald Seiler <hws@denx.de>
To: u-boot@lists.denx.de,
	Marek Vasut <marex@denx.de>
Date: Wed, 27 Sep 2023 14:46:25 +0200
Message-ID: <20230927124625.247858-1-hws@denx.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Thu, 28 Sep 2023 06:25:27 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Harald Seiler <hws@denx.de>,
 u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH 2/2] board: dh_stm32mp1: Only print board code
	with CONFIG_SPL_DISPLAY_PRINT
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

Ensure that the SoM and board code information is only printed when
CONFIG_SPL_DISPLAY_PRINT is set.

Signed-off-by: Harald Seiler <hws@denx.de>
---
 board/dhelectronics/dh_stm32mp1/board.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index f9cfabe2420..b933761d0de 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -229,8 +229,9 @@ static void board_get_coding_straps(void)
 
 	gpio_free_list_nodev(gpio, ret);
 
-	printf("Code:  SoM:rev=%d,ddr3=%d Board:rev=%d\n",
-		somcode, ddr3code, brdcode);
+	if (CONFIG_IS_ENABLED(DISPLAY_PRINT))
+		printf("Code:  SoM:rev=%d,ddr3=%d Board:rev=%d\n",
+		       somcode, ddr3code, brdcode);
 }
 
 int board_stm32mp1_ddr_config_name_match(struct udevice *dev,
-- 
2.41.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
