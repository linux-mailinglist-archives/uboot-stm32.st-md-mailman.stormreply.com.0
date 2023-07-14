Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5116B753EC0
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jul 2023 17:25:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4A93C6B452;
	Fri, 14 Jul 2023 15:25:03 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2DDDC6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 15:25:02 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id CCB4E10000D;
 Fri, 14 Jul 2023 18:25:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru CCB4E10000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1689348301;
 bh=7Boj5ot2jlMfSigNogS64kIZimaHIUmFZ008sTIzy2U=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=IEKpECDTnkB52y3AEiKDnOinWffwoFFCq6WlZfIROHpCwMHGV2kAwQmXY4RfgtLGP
 fvMwWzUOeCBeaKp3JETWFlAUyM4sEyVNehF9Nc11FPG66lxqXAjfE9KKJfeki1XKsd
 xESdq9FcR8hysE6WoUTBYaGkagaL+d13biL9PMS6SxybzxNgjKwdNbT/uYzA4owYsU
 qRYFTkCDwDtYQF6R157cmkcsj3Z1XZmewpfzN9KwLN6HziwFKNeEwgCK8J921J4xE6
 k6eoUpltuLRZKSeWXdwgHBbaw0rOJ3UNU80IhHhL5UAgFpbE34410lmgVIP/spK9ZJ
 xK8KdhjFEzPxA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Fri, 14 Jul 2023 18:25:01 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 14 Jul 2023 18:24:28 +0300
From: Igor Prusov <ivprusov@sberdevices.ru>
To: Michal Simek <michal.simek@amd.com>, Daniel Schwierzeck
 <daniel.schwierzeck@gmail.com>, Lukasz Majewski <lukma@denx.de>, Sean
 Anderson <seanga2@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Chia-Wei
 Wang <chiawei_wang@aspeedtech.com>, Aspeed BMC SW team
 <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Stefan Roese
 <sr@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>
Date: Fri, 14 Jul 2023 18:24:37 +0300
Message-ID: <20230714152444.24395-1-ivprusov@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
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
 {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;
 p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1; sberdevices.ru:7.1.1,5.0.1;
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
Subject: [Uboot-stm32] [PATCH v3 0/7] clk: Switch from soc_clk_dump to
	clk_ops function
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

Currently clock providers may override default implementation of
soc_clk_dump function to replace clk dump command output. This causes
confusing behaviour when u-boot is built with one of such drivers
enabled but still has clocks defined using CCF. For example, enabling
CMD_CLK and using clk dump on sandbox target will not show CCF clocks
because k210 driver overrides common soc_clk_dump.

Changelog:
 v1 -> v2:
 - Add missing static to dump functions
 v2 -> v3:
 - Make soc_clk_dump in cmd/clk.c static instead of removing __weak

Igor Prusov (7):
  clk: zynq: Move soc_clk_dump to Zynq clock driver
  clk: ast2600: Move soc_clk_dump function
  clk: k210: Move soc_clk_dump function
  clk: Add dump operation to clk_ops
  cmd: clk: Use dump function from clk_ops
  clk: treewide: switch to clock dump from clk_ops
  cmd: clk: Make soc_clk_dump static

 arch/arm/mach-zynq/clk.c               |  57 --------------
 arch/mips/mach-pic32/cpu.c             |  23 ------
 cmd/clk.c                              |  13 +++-
 drivers/clk/aspeed/clk_ast2600.c       |  83 ++++++++++----------
 drivers/clk/clk_k210.c                 | 103 ++++++++++++-------------
 drivers/clk/clk_pic32.c                |  39 ++++++++++
 drivers/clk/clk_versal.c               |   7 +-
 drivers/clk/clk_zynq.c                 |  51 ++++++++++++
 drivers/clk/clk_zynqmp.c               |  13 ++--
 drivers/clk/imx/clk-imx8.c             |  11 +--
 drivers/clk/mvebu/armada-37xx-periph.c |   5 +-
 drivers/clk/stm32/clk-stm32mp1.c       |  29 ++-----
 include/clk-uclass.h                   |   3 +
 include/clk.h                          |   2 -
 14 files changed, 223 insertions(+), 216 deletions(-)

-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
