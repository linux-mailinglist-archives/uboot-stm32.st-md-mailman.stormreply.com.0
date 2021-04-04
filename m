Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09637354D6C
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Apr 2021 09:10:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE4DEC57B69;
	Tue,  6 Apr 2021 07:10:10 +0000 (UTC)
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C09AC5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Apr 2021 18:21:56 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.148.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id T7NiljuYb3IXUT7NiloHAb; Sun, 04 Apr 2021 20:21:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1617560516; bh=9Gb2xwkHplzCHiDrpjx3vrXQib7kAZvT4QCl7QwJJFM=;
 h=From:To:Subject:Date:MIME-Version;
 b=U2AHW8uLYqo/qYStezY/GWXbK0FAS8YFUdctZt3M8/c/tFpzvqqelajFoF9qhDcxd
 HbkIqIe1qyLj5ucL/W8nOeXIYmd70Cf+8aOOX2+6AjsjJiZPWnWeHWpVNJ9E0davT/
 pwKHDca2BtqCHyMMhnuZY4QlybAqh0GluY4lFfxvZsII53EBB7fqf3GMUzLD4KIZi5
 WgwAffXf0+oziUh9PKId92G4cRUz+AT7rDULO2uP3xKu6h5TYwndtrODYsZFDNJhu1
 ENnT2vZlNd8nwJxNON9dH0UiBG1lsoqNzkI8hS/pn3AhxQTOGJu5CuFJO/8QJArPXB
 tPYHHYCfU3mDw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Stefano Babic <sbabic@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Vikas Manocha <vikas.manocha@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Sun,  4 Apr 2021 20:21:33 +0200
Message-Id: <20210404182135.1243077-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAEknoBdOA0iDjOXJ5J7yvgd3hfX4OLKhG4koBcxJoxP1KHH4UsHU1Ds9QEnmFN+xCxAxtFXNp6RGy6QVsA+04sx5xuKu3JyfcVLnYDrFjZnPsEm/4qD
 of7DF5J/jnU6YSPHxtAsOmbzkzRyi2NlGFE99d2c8ZhlrCS7YUkIxnJQnmR2G8Zq74OGLgQuz+2vHQf2+boxxHYDHU2AzWOCxmw0Faw+AD7VAMJx+0yUlhoY
 4U8zLmLwLCl+Mn0lXfBlQYn3cBZWMwWSmmslNI+zKmRWIg8mhsfvJIKUqoovq3FyljwAms/Bh+hev9Pop9xTAQ7PspGZG1VagSyfrmuR33gmtlLfOT9V4eef
 dXwK5mbDbS5Rp/50O4nKZ/W04euqnK0kKBODTe2SbseRENt9TzeW0n32s21qWCWuiGDaHoO9rWCoOyjGDBehJaShEYxHLNIarZsOKfavpXMJ7mSiD0AIeWTB
 LsMJKxLScVgbnBLFk4pfVNr1fh1tToSSa81ClQ==
X-Mailman-Approved-At: Tue, 06 Apr 2021 07:10:08 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>
Subject: [Uboot-stm32] [PATCH 1/3] board: freescale: imxrt1020-evk: fix
	console is not enabled while init dram
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

While initializing dram in spl_dram_init(), mdelay() is called that in
order calls get_ticks() that  verifies if timer exists, if doesn't, it
throws a panic(), but since preloader_console_init() has still not been
called those panic()s will fail. This doesn't help debugging, so let's
setup console before calling spl_dram_init() by moving it after
spl_dram_init().

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/freescale/imxrt1020-evk/imxrt1020-evk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/imxrt1020-evk/imxrt1020-evk.c b/board/freescale/imxrt1020-evk/imxrt1020-evk.c
index 35241acd22..479e66bddc 100644
--- a/board/freescale/imxrt1020-evk/imxrt1020-evk.c
+++ b/board/freescale/imxrt1020-evk/imxrt1020-evk.c
@@ -60,8 +60,8 @@ int spl_dram_init(void)
 
 void spl_board_init(void)
 {
-	spl_dram_init();
 	preloader_console_init();
+	spl_dram_init();
 	arch_cpu_init(); /* to configure mpu for sdram rw permissions */
 }
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
