Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68352B603B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Sep 2019 11:30:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36355C36B3F
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Sep 2019 09:30:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2927CC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 09:30:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8I96UfL019537; Wed, 18 Sep 2019 11:30:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=YzLZS2SA+OIZa6qtmI8b1Dss6B1sKVqxMCgnaH6Vea0=;
 b=IEh0YhJmnnMGDNtdq0MQr/bIh2Zkq8Srt9m/H6O8ZjzKAO3Ap+UljeejXhXGD8HaXnuR
 1F+rB4C6jGRGvqiEQowsiPUZqPWT00n8+mxKHCDTtDjhOLc6vIAbk9SwQh04jtT8F5BE
 P76WkVpjKeTBNT+Q1Yt/EhCGAuEO43yatuICUwDIQD5lyd+aKeSFkHKYt8lkQv8BaJ84
 uIfLnJI24TZIIWkCjDVqHoVfg0oSP7Y9wGDq/XsUAGgNuEoNdFPAZUvhVwyPY/CGvUu0
 wn/73C0wsyJ8Ux0M2CwEtDAeQPVW4RamNx2ACPLXNwJUwPm67P4A+LgGxSW/72QyThh2 /g== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v37hqu729-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 18 Sep 2019 11:30:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 59B0A4D;
 Wed, 18 Sep 2019 09:29:58 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0B7C2BB876;
 Wed, 18 Sep 2019 11:29:57 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 18 Sep
 2019 11:29:57 +0200
Received: from localhost (10.201.21.107) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 18 Sep 2019 11:29:57
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Sep 2019 11:29:18 +0200
Message-ID: <20190918092920.21435-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918092920.21435-1-patrick.delaunay@st.com>
References: <20190918092920.21435-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-18_06:2019-09-17,2019-09-18 signatures=0
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Lukasz Majewski <lukma@denx.de>, Joe
 Hershberger <joe.hershberger@ni.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Hamish Guthrie <hamish.guthrie@kistler.com>,
 Marek Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, AKASHI
 Takahiro <takahiro.akashi@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Schocher <hs@denx.de>, Ash Charles <ash@gumstix.com>,
 Wolfgang Denk <wd@denx.de>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam
 Ford <aford173@gmail.com>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v3 1/3] env: correct the check of
	env_flags_validate presence
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

This patch corrects the check of env_flags_validate presence because
"flags.c" is always compiled in U-Boot and CONFIG_ENV_SUPPORT
don't exist; so the macro CONFIG_IS_ENABLED(ENV_SUPPORT) only provides
the expected result for SPL and TPL (check activation of
CONFIG_SPL_ENV_SUPPORT and CONFIG_TPL_ENV_SUPPORT).

This patch solves the regression introduced by
commit 7d4776545b0f ("env: solve compilation error
in SPL"); change_ok was always NULL in U-Boot.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2: None

 env/common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/env/common.c b/env/common.c
index 3fb60509dd..f677b5b0da 100644
--- a/env/common.c
+++ b/env/common.c
@@ -24,8 +24,10 @@ DECLARE_GLOBAL_DATA_PTR;
 #include <env_default.h>
 
 struct hsearch_data env_htab = {
-#if CONFIG_IS_ENABLED(ENV_SUPPORT)
-	/* defined in flags.c, only compile with ENV_SUPPORT */
+#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)
+	/* defined in flags.c, only compiled in U-Boot or
+	 * with $(SPL_TPL_)ENV_SUPPORT
+	 */
 	.change_ok = env_flags_validate,
 #endif
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
