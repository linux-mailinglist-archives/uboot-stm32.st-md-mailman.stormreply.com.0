Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60633C233DD
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Oct 2025 05:16:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 067C1C62D98;
	Fri, 31 Oct 2025 04:16:47 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5B21C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 04:16:45 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cySNX6M60z9sdZ;
 Fri, 31 Oct 2025 05:16:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761884204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=chHnbm3tXYStw0EGD32Vc02Qn7qScIQL90GAoHt30LE=;
 b=nAbkPS5vAlLNRKVBEnna9evyS6K9wUPBQ/E9CHwDn8O5bntX199g8cWSwOKHqap1Y4UzWW
 LTn205zhfCmwVgu5pOCnjMdetqotnFd8jrlbviJQgZfm0QZnD3vvi8C1TPxzsYgKJHvt24
 Dn76Iu+PBMmi7uMPijDKC34xar+caR2iEqQnjgpOgub7JkVHN7nbSUeFnO8HjsSQtSl3sU
 df+EILf6+TRbuc786gfDErlELTDavFRVrCEIWpiq4YdVuSuqN6oIrs2v9wTV2nrDA8Gwiq
 CeK6aFaI9+jEkQc8+njpGVp2IOcihdbe4J2us9v5jcHrD8TGbGhGgT9E5r7q7w==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="P+3Z0r6/";
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761884203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=chHnbm3tXYStw0EGD32Vc02Qn7qScIQL90GAoHt30LE=;
 b=P+3Z0r6/ynYy32fUfgJmqi1Tuj6RcTnD+NArcPOx8lg/cgRZ7D9EIuXDRKptoeHvQAVZ9n
 R1+MxrrCe/UsCNCxqdrEO50/ZiTAsMFqx83QVJgelGS+9LUBUPNpIyfFVDA/nWP3DAfu/5
 FZX4uxgMKTKhsHW6IwDEXD6f7bs8oXaNqzINLf8054hdY1K4P8hUTHG/bCrrIwhUuvaSom
 4HX/rxfOwGpEQm417aDTv61D0s258ZjoBtxXG9RkzNgvtNaTEh8grq2NmTATC+F1I9oT2c
 EoJT77A99NzxH3GuEoNEmORSr8F4f8cy0ldvn541aQF/kZFEMMcw/SEbe8iLOQ==
To: u-boot@lists.denx.de
Date: Fri, 31 Oct 2025 05:16:09 +0100
Message-ID: <20251031041640.174689-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 31c2c1b6586f93f5471
X-MBO-RS-META: bmg5mhcc4jc617pnscf66uznp74r5pzk
X-Rspamd-Queue-Id: 4cySNX6M60z9sdZ
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Add missing build of ST DFU virt
	code on DH STM32MP1 DHSOM
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

Commit 6d91f0a3a14d ("board: st: common: cleanup dfu support") split
the vendor-specific DFU implementation into two files, but failed to
update other non-ST boards. This did not lead to noticable breakage
with plain simple dfu-util, but it makes the ST proprietary programmer
CLI tool end in an infinite loop. Update the Makefile accordingly to
allow even that kind of tooling to work.

Fixes: 6d91f0a3a14d ("board: st: common: cleanup dfu support")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 board/dhelectronics/dh_stm32mp1/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
index ffd221ac224..2f4a301d1a0 100644
--- a/board/dhelectronics/dh_stm32mp1/Makefile
+++ b/board/dhelectronics/dh_stm32mp1/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_PMIC_STPMIC1) += ../../st/common/stpmic1.o
 obj-y += board.o
 
 obj-$(CONFIG_SET_DFU_ALT_INFO) += ../../st/common/stm32mp_dfu.o
+obj-$(CONFIG_$(PHASE_)DFU_VIRT) += ../../st/common/stm32mp_dfu_virt.o
-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
