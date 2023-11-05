Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 251AF7E12A1
	for <lists+uboot-stm32@lfdr.de>; Sun,  5 Nov 2023 09:38:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8E46C6B47C;
	Sun,  5 Nov 2023 08:38:31 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB558C6B47A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Nov 2023 08:38:30 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 4688C12000B;
 Sun,  5 Nov 2023 11:38:30 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4688C12000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1699173510;
 bh=U5a1PcgFW0qYF5fotPS0ChxNWPV54cgX4f6A4PxugzY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=RHcL+7r11BJmU+DqjzSfIGcIZx5/8B5pP3YVcuj/tzRPlJeD7T0TXTSrtVvJxtXh3
 Ti/SpXPvbHvYfPiAIVRbz4ACkGyTNDOr2KVcsddrlPZ4MVjpwYUQ4oUOzl95/ZMo5p
 5Na5ByHgclsBqxN1lUVqX1BkSaKWE/Sh62rkjJOZUH8va5zdn8R/vr7Dzx6BNvGqoY
 ns0zVgV7qnrcZsJIGGOlSK+61/i0+K27KjggHUogjs455UHXrsFEC1+VuOmWPiVrHu
 GSzuCLzQT93kb1hbx1MwrkJN8Oa/NX0sY+oPMi6LI26YFCe2wi6GNyQ6ZAvAc/TeG5
 +Zl4AUFSjI9JQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Sun,  5 Nov 2023 11:38:30 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Sun, 5 Nov 2023 11:38:29 +0300
From: Igor Prusov <ivprusov@sberdevices.ru>
To: <u-boot@lists.denx.de>, Michal Simek <michal.simek@amd.com>, Daniel
 Schwierzeck <daniel.schwierzeck@gmail.com>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Stefan Roese <sr@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Patrice Chotard <patrice.chotard@foss.st.com>
Date: Sun, 5 Nov 2023 11:38:07 +0300
Message-ID: <20231105083809.3293-7-ivprusov@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105083809.3293-1-ivprusov@sberdevices.ru>
References: <20231105083809.3293-1-ivprusov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181122 [Nov 03 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ivprusov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_smtp_not_equal_from},
 {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;
 p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1; salutedevices.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 100.64.160.123:7.1.2;
 127.0.0.199:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/11/05 03:40:00 #22405617
X-KSMG-AntiVirus-Status: Clean, skipped
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 uboot-stm32@st-md-mailman.stormreply.com, Joel Stanley <joel@jms.id.au>,
 kernel@sberdevices.ru, Igor Prusov <ivprusov@sberdevices.ru>,
 prusovigor@gmail.com
Subject: [Uboot-stm32] [PATCH v6 6/8] cmd: clk: Use dump function from
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
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 cmd/clk.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/cmd/clk.c b/cmd/clk.c
index c7c379d7a6..4b9709d3ff 100644
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
+			printf("\n%s %s:\n", dev->driver->name, dev->name);
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
