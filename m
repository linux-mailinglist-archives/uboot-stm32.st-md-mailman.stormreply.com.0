Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A93C893D777
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jul 2024 19:18:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C49BC78015;
	Fri, 26 Jul 2024 17:18:06 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2769C71280
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 17:18:03 +0000 (UTC)
Received: from [192.168.192.146] (port=49304 helo=nx64de-b91e0e)
 by mx01.ayax.eu with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gszymaszek@short.pl>)
 id 1sXOZt-000fLA-U9; Fri, 26 Jul 2024 19:18:02 +0200
Date: Fri, 26 Jul 2024 19:18:00 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: u-boot@lists.denx.de
Message-ID: <789acb2e22e681aa86302d522c9385a4bae34582.1722014005.git.gszymaszek@short.pl>
Mail-Followup-To: u-boot@lists.denx.de,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
References: <41ae952bf3f45545e3c6579463df3d0408f6343a.1722014005.git.gszymaszek@short.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41ae952bf3f45545e3c6579463df3d0408f6343a.1722014005.git.gszymaszek@short.pl>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 2/3] doc: stm32mp1: fix literal block markers
	(::)
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

Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
---
 doc/board/st/stm32mp1.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
index 239e18b5e17..98167e80618 100644
--- a/doc/board/st/stm32mp1.rst
+++ b/doc/board/st/stm32mp1.rst
@@ -265,7 +265,7 @@ Build Procedure
      # make stm32mp15_defconfig
      # make DEVICE_TREE=stm32mp157c-ev1-scmi all
 
-    or without SCMI support
+    or without SCMI support::
 
      # export KBUILD_OUTPUT=stm32mp15
      # make stm32mp15_defconfig
@@ -796,7 +796,7 @@ You can update the boot device:
 When the board is booting for nor0 or nand0,
 only the MTD partition on the boot devices are available, for example:
 
-- NOR (nor0 = alt 20, nor1 = alt 26) & NAND (nand0 = alt 27) :
+- NOR (nor0 = alt 20, nor1 = alt 26) & NAND (nand0 = alt 27)::
 
   $> dfu-util -d 0483:5720 -a 21 -D tf-a-stm32mp157c-ev1.stm32
   $> dfu-util -d 0483:5720 -a 22 -D tf-a-stm32mp157c-ev1.stm32
-- 
2.43.0
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
