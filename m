Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0154D6F3E33
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 May 2023 09:09:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9777FC6A61F;
	Tue,  2 May 2023 07:09:40 +0000 (UTC)
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB2F5C6907C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 20:38:22 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 524B75FD19;
 Thu, 27 Apr 2023 23:38:22 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1682627902;
 bh=4nYVzLCpEMTTcFXfO70EDG+BkICmQWckwNKqSIHwL0Y=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=kgZQIFDjn10uQZjuAXZKcxjtmUw4HeMoeN7ImKCcjltC3pdC0an/687m9Za0xnv5z
 f7KggEv2yKFisUj0s2DP/g3bT6VO9SMh9mnrpES4GEa7gKwk3twFU/aB4EybSMTi3k
 cYipVuuJHqz7QRv+dFjJW86ABLueOn1u9txpLyM4H3A9xRlsf6Wa6RUTSh6SyEYSGn
 6v5HtHyugKFcOZDSfRjzLeEwjNaP0okK8Aj4cUYIz9C26wtCqdFlOGvygOyiiLH/y+
 xfi2dRPwC/qokcD95prU5hMSPjUyahunSJPNKw19Aq/tXJqhAnKTRLFupzdl0OSBmm
 oZ8KcTaNDcNuQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Thu, 27 Apr 2023 23:38:22 +0300 (MSK)
From: Igor Prusov <ivprusov@sberdevices.ru>
To: Michal Simek <michal.simek@amd.com>, Daniel Schwierzeck
 <daniel.schwierzeck@gmail.com>, Lukasz Majewski <lukma@denx.de>, Sean
 Anderson <seanga2@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Chia-Wei
 Wang <chiawei_wang@aspeedtech.com>, Aspeed BMC SW team
 <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Stefan Roese
 <sr@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>
Date: Thu, 27 Apr 2023 23:37:23 +0300
Message-ID: <20230427203726.11835-5-ivprusov@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230427203726.11835-1-ivprusov@sberdevices.ru>
References: <20230427203726.11835-1-ivprusov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/04/27 14:43:00 #21175431
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Tue, 02 May 2023 07:09:38 +0000
Cc: kernel@sberdevices.ru, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, prusovigor@gmail.com,
 Igor Prusov <ivprusov@sberdevices.ru>
Subject: [Uboot-stm32] [RFC PATCH v1 4/7] clk: Add dump operation to clk_ops
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

This adds dump function to struct clk_ops which should replace
soc_clk_dump. It allows clock drivers to provide custom dump
implementation without overriding generic CCF dump function.

Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
---
 include/clk-uclass.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/clk-uclass.h b/include/clk-uclass.h
index 65ebff9ed2..f29f4c0d01 100644
--- a/include/clk-uclass.h
+++ b/include/clk-uclass.h
@@ -39,6 +39,9 @@ struct clk_ops {
 	int (*set_parent)(struct clk *clk, struct clk *parent);
 	int (*enable)(struct clk *clk);
 	int (*disable)(struct clk *clk);
+#if IS_ENABLED(CONFIG_CMD_CLK)
+	int (*dump)(struct udevice *dev);
+#endif
 };
 
 #if 0 /* For documentation only */
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
