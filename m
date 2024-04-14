Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C06BE8A44A6
	for <lists+uboot-stm32@lfdr.de>; Sun, 14 Apr 2024 20:39:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84F16C6B444;
	Sun, 14 Apr 2024 18:39:45 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBC0DC69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Apr 2024 18:39:44 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E1CE888134;
 Sun, 14 Apr 2024 20:39:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713119984;
 bh=xHcwBke5o81i7d/5uWGbsKVfDhnHff8uM162FWullPM=;
 h=From:To:Cc:Subject:Date:From;
 b=aWDGHt5OCsVP9jGz7Rl5nrfOmeFOFSUrle8Vb0CQARbg6Dls/8N2JwbxiTA/cYpox
 WXhgSZBE6pIdb3/uVnuJwz1HYJdy5Zu9MJTNbgOisEM20hQJZifqDhrnWN3SVkfue8
 QZADM1x7aiqvPTROQTTeCqiVUsskOyNFN8lPkY6/ial7M7OPO5ggDu54s7vp/83Sas
 FTdnPRyt5R3SSd8IYGDSeWYMRtcGuT8GPqyUyFkPFTu5e8c9uLoCX1LCJgcQ+nXKcg
 45x9kDShGF5R6X0jcW+A4ENw/ZUJnJyDyRdIvXnXG32OKWUidcVCth2lFk/sz/dT2N
 TXy/gWryaaMQw==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sun, 14 Apr 2024 20:39:29 +0200
Message-ID: <20240414183932.147045-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Report OTP-CLOSED instead of
	rev.? on closed STM32MP15xx
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

SoC revision is only accessible via DBUMCU IDC register,
which requires BSEC.DENABLE DBGSWENABLE bit to be set to
make the register accessible, otherwise an access to the
register triggers bus fault. As BSEC.DBGSWENABLE is zero
in case of an OTP-CLOSED system, do NOT set DBGSWENABLE
bit as this might open a brief window for timing attacks.
Instead, report that this system is OTP-CLOSED and do not
report any SoC revision to avoid confusing users. Use an
SEC/C abbreviation to avoid growing SOC_NAME_SIZE .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
index afc56b02eea..dd99150fbc2 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
@@ -322,8 +322,23 @@ void get_soc_name(char name[SOC_NAME_SIZE])
 
 	get_cpu_string_offsets(&type, &pkg, &rev);
 
-	snprintf(name, SOC_NAME_SIZE, "STM32MP%s%s Rev.%s",
-		 soc_type[type], soc_pkg[pkg], soc_rev[rev]);
+	if (bsec_dbgswenable()) {
+		snprintf(name, SOC_NAME_SIZE, "STM32MP%s%s Rev.%s",
+			 soc_type[type], soc_pkg[pkg], soc_rev[rev]);
+	} else {
+		/*
+		 * SoC revision is only accessible via DBUMCU IDC register,
+		 * which requires BSEC.DENABLE DBGSWENABLE bit to be set to
+		 * make the register accessible, otherwise an access to the
+		 * register triggers bus fault. As BSEC.DBGSWENABLE is zero
+		 * in case of an OTP-CLOSED system, do NOT set DBGSWENABLE
+		 * bit as this might open a brief window for timing attacks.
+		 * Instead, report that this system is OTP-CLOSED and do not
+		 * report any SoC revision to avoid confusing users.
+		 */
+		snprintf(name, SOC_NAME_SIZE, "STM32MP%s%s SEC/C",
+			 soc_type[type], soc_pkg[pkg]);
+	}
 }
 
 static void setup_soc_type_pkg_rev(void)
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
