Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8140387F58A
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Mar 2024 03:44:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E99C6DD68;
	Tue, 19 Mar 2024 02:44:55 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4F1DC6DD60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Mar 2024 02:44:53 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DA70B8573F;
 Tue, 19 Mar 2024 03:44:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1710816293;
 bh=0TyCzzDTZEycThoV0l09H41/k147KRBbeEYZdXewaQA=;
 h=From:To:Cc:Subject:Date:From;
 b=jTvCkeai4SsKxnO/fwr1aNlPgxpf+vMEZT4nTUEgbe7UXWWAp+9qNu8a6jg72hBZ1
 S9a1yxRSFSvx0GWQsFExze3ifOB/qmllUY601F/oPcCai1CmjsabeHWyi8Z3ug5YTU
 KR/Gd+CbwbJZUxs7muI084o6txb+cKYeE9wAsDVD5lQIfvh79YwAuV5jRwpwUD2vCr
 jVuEt670lEe5Qa67VxdubDdD0VuOo/fqDmCIquUUoilHquayy47vDacmtYogLTeYct
 eBt5E7z2RL5tFMsXKfpJFLZbufQKpRMnLIhkhCTfpiZmYc/zegMH1URVBobW/lA3Y/
 D2DyD0xFc83SQ==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Tue, 19 Mar 2024 03:44:18 +0100
Message-ID: <20240319024430.103196-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Default dfu_alt_info for
	STM32MP13xx SPI NOR
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

Define dfu_alt_info with SPI NOR layout to make it easy to
install or update bootloader in the SPI NOR using dfu-util.

Use the following U-Boot commands to start DFU mode:
"
=> sf probe && dfu 0 mtd
"

Use the following dfu-util invocation on Host PC to install binaries:
"
$ dfu-util -w -a 0 -D build/stm32mp1/release/tf-a-stm32mp135f-dhcor-dhsbc.stm32
$ dfu-util -w -a 1 -D build/stm32mp1/release/tf-a-stm32mp135f-dhcor-dhsbc.stm32
$ dfu-util -w -a 2 -D build/stm32mp1/release/fip.bin
"

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 include/configs/stm32mp13_common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
index 5b0658ced92..d6e4f8fd915 100644
--- a/include/configs/stm32mp13_common.h
+++ b/include/configs/stm32mp13_common.h
@@ -63,6 +63,7 @@
 	"fi;\0"
 
 #define STM32MP_EXTRA \
+	"dfu_alt_info=mtd nor0=fsbl1 raw 0x0 0x40000;fsbl2 raw 0x40000 0x40000;uboot raw 0x80000 0x160000\0" \
 	"env_check=if env info -p -d -q; then env save; fi\0" \
 	"boot_net_usb_start=true\0"
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
