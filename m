Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B6753EC4
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jul 2023 17:25:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44C86C6B464;
	Fri, 14 Jul 2023 15:25:04 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8439FC6B44E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 15:25:03 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id EBB56120010;
 Fri, 14 Jul 2023 18:25:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru EBB56120010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1689348302;
 bh=oG+EJfOk/dI8/+y64Hp0jydVlt3bQqqWbzy6LiIrNjk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=VMGTH0SO1K39IjRKgQtJ7TwFJygsybSso/EfmFmRmfvPdpDODBNEmfaIDeLVax5By
 UYdm3gBd7fOAnP8EtZqqaQQMkYHx1m0RpyaS9Og9KYmVCpWjUwQC+fPek6pr4Zc8CI
 j5OtTbDLfHp0qFDFP+LtFmi7CdEZnpulQz8MefQ1efL8WvrDvOngHVB4K3eiVF9mEf
 6I+o4WopO9uc4N05H6B4JDTyrAQSr7e+eKQwNzhaegoAvPqgT7OketMsaCIWxjlMcS
 +yL80A4+jJK0oIRVFZPHaa+VgrRgoOyp4BlEon0Vf9HCnhHG+bNjYfBe/Os8pentKp
 LjMvgBqingIbw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Fri, 14 Jul 2023 18:25:02 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 14 Jul 2023 18:24:29 +0300
From: Igor Prusov <ivprusov@sberdevices.ru>
To: Michal Simek <michal.simek@amd.com>, Daniel Schwierzeck
 <daniel.schwierzeck@gmail.com>, Lukasz Majewski <lukma@denx.de>, Sean
 Anderson <seanga2@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Chia-Wei
 Wang <chiawei_wang@aspeedtech.com>, Aspeed BMC SW team
 <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Stefan Roese
 <sr@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>
Date: Fri, 14 Jul 2023 18:24:42 +0300
Message-ID: <20230714152444.24395-6-ivprusov@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714152444.24395-1-ivprusov@sberdevices.ru>
References: <20230714152444.24395-1-ivprusov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178633 [Jul 14 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: IVPrusov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 523 523
 523027ce26ed1d9067f7a52a4756a876e54db27c,
 {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;
 100.64.160.123:7.1.2; p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress:
 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/07/14 10:15:00 #21613471
X-KSMG-AntiVirus-Status: Clean, skipped
Cc: kernel@sberdevices.ru, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, prusovigor@gmail.com,
 Igor Prusov <ivprusov@sberdevices.ru>
Subject: [Uboot-stm32] [PATCH v3 5/7] cmd: clk: Use dump function from
	clk_ops
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

Add another loop to dump additional info from clock providers that
implement dump operation.

Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
---
 cmd/clk.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/cmd/clk.c b/cmd/clk.c
index ff7c7649a1..55fb96e631 100644
--- a/cmd/clk.c
+++ b/cmd/clk.c
@@ -62,6 +62,7 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
 int __weak soc_clk_dump(void)
 {
 	struct udevice *dev;
+	const struct clk_ops *ops;
 
 	printf(" Rate               Usecnt      Name\n");
 	printf("------------------------------------------\n");
@@ -69,6 +70,14 @@ int __weak soc_clk_dump(void)
 	uclass_foreach_dev_probe(UCLASS_CLK, dev)
 		show_clks(dev, -1, 0);
 
+	uclass_foreach_dev_probe(UCLASS_CLK, dev) {
+		ops = dev_get_driver_ops(dev);
+		if (ops && ops->dump) {
+			printf("--------------------------\n");
+			ops->dump(dev);
+		}
+	}
+
 	return 0;
 }
 #else
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
