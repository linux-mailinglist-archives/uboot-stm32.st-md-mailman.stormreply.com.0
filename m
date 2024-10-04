Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0BB9911D8
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Oct 2024 23:52:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10869C7802B;
	Fri,  4 Oct 2024 21:52:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2C6BC78028
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 21:52:31 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E797E889C5;
 Fri,  4 Oct 2024 23:52:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728078751;
 bh=RVyuTUn67HA7hQbF+5Qh5gIYt//nUfRU5BmjQN1Fvjk=;
 h=From:To:Cc:Subject:Date:From;
 b=X53W/cpKDYZ+ui7NZWxIB/lgegIaze5IFBCOFogQJc9jbzYZ/45PlMDLNHQx9nVhD
 +JKq1XEjKBF1MfAqYJBRpHS0LNS+XXMja3uxIHLpU1cHitor1tfEUcz160y3vYTN8T
 NKS2pJfoK3pLBMofW/eawxbVbDb+DhQOhBA2wpoJzkyMfl9TevC8wRt4ULXQOkXmKz
 g7r8t4Ml0O3t9lwPClmLT/mFCLDfSnIXr/rvO2AXDPxLxEJ2jkBXSTBxF26M++ph8k
 XtHrtUdnmjjgx2nQMsreMy3rVr7FKyNbCIrD+44OfkodTHijuztSAaRYGjZyy00fUH
 2AIsaS8zBrNWQ==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Fri,  4 Oct 2024 23:51:46 +0200
Message-ID: <20241004215213.252840-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Update MAINTAINERS file globs for
	STM32MP DHSOM
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

Update the MAINTAINERS file glob to cover all of STM32MP DHSOM related files.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 board/dhelectronics/dh_stm32mp1/MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/MAINTAINERS b/board/dhelectronics/dh_stm32mp1/MAINTAINERS
index 865588f5b8b..d6c33c15aac 100644
--- a/board/dhelectronics/dh_stm32mp1/MAINTAINERS
+++ b/board/dhelectronics/dh_stm32mp1/MAINTAINERS
@@ -2,8 +2,7 @@ DH_STM32MP1_PDK2 BOARD
 M:	Marek Vasut <marex@denx.de>
 L:	u-boot@dh-electronics.com
 S:	Maintained
-F:	arch/arm/dts/stm32mp15xx-dhcom*
+F:	arch/arm/dts/stm32mp*dhco*
 F:	board/dhelectronics/dh_stm32mp1/
-F:	configs/stm32mp15_dhcom_basic_defconfig
-F:	configs/stm32mp15_dhcor_basic_defconfig
+F:	configs/stm32*_dhco*defconfig
 F:	include/configs/stm32mp15_dh_dhsom.h
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
