Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DiSGLqI72kNCgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2026 18:03:06 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED88475EA0
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2026 18:03:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E34D1C7A835;
	Mon, 27 Apr 2026 15:56:04 +0000 (UTC)
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch
 [45.157.188.15])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93FDEC56612
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 11:36:44 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fzk3J2Gjcz1BmD;
 Mon, 20 Apr 2026 13:36:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
 s=20231125; t=1776685002;
 bh=XgLf/F/wbNP+WXg68PpYUiopWVPmIV82B2DEj0wYHFo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=W/MKYkLyDVa13N3TWZLA5ZQa+eL1nQS2vsOCc8GF8BASWm5GMJucr1XhEEikc4UVw
 M6jc56LFwR23JWSFvzouXWYLu8ItpD7C4wxmquN/inSiJGwHdRNW3RsOWjhkrVpBUs
 ZQFLQkyBRELquEZlthuVw/LU0x0HClaudwdDDI63itqDvo99gGh1/okFNEKFxg8Dqq
 0YIV5o5uVpyOVSElCYnmNzAsOi+MwM69ihXLogJ+xj8c3rU0gtkWkj4bgHcoUMUtcN
 3KvcQBbTepdA2eNIoQ9dEi+9RYCgXJzm3HgHMAlUXVZy1yXygKL0VxcBkCiO/BuPC6
 wkMyo4mnCXa0g==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fzk3811NFzWPl; Mon, 20 Apr 2026 13:36:36 +0200 (CEST)
From: Quentin Schulz <foss+uboot@0leil.net>
Date: Mon, 20 Apr 2026 13:36:08 +0200
MIME-Version: 1.0
Message-Id: <20260420-net-kconfig-v1-2-9900002d8e72@cherry.de>
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
In-Reply-To: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 Paul Barker <paul.barker.ct@bp.renesas.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:56:03 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
 Jerome Forissier <jerome.forissier@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 David Lechner <dlechner@baylibre.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 Shantur Rathore <i@shantur.com>, Chintan Vankar <c-vankar@ti.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Anshul Dalal <anshuld@ti.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Heiko Schocher <hs@nabladev.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gilles Talis <gilles.talis@gmail.com>,
 Padmarao Begari <padmarao.begari@amd.com>, Bryan Brattlof <bb@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Kever Yang <kever.yang@rock-chips.com>,
 Benjamin ROBIN <dev@benjarobin.fr>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sky Huang <SkyLake.Huang@mediatek.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Sean Edmond <seanedmond@microsoft.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 "Markus Schneider-Pargmann \(TI.com\)" <msp@baylibre.com>,
 Max Merchel <Max.Merchel@ew.tq-group.com>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Brian Sune <briansune@gmail.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Martin Schwan <m.schwan@phytec.de>, Dmitrii Merkurev <dimorinny@google.com>,
 Sughosh Ganu <sughosh.ganu@arm.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tom Rini <trini@konsulko.com>,
 Udit Kumar <u-kumar1@ti.com>, Romain Gantois <romain.gantois@bootlin.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Le Jin <le.jin@siemens.com>,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Harvey <tharvey@gateworks.com>,
 Maarten Brock <Maarten.Brock@sttls.nl>, Matthias Brugger <mbrugger@suse.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Robert Marko <robert.marko@sartura.hr>, Adam Ford <aford173@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>,
 George Chan <gchan9527@gmail.com>, Simon Glass <sjg@chromium.org>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Kongyang Liu <seashell11234455@gmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 Marek Vasut <marex@denx.de>, Weijie Gao <weijie.gao@mediatek.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>, Benjamin Hahn <B.Hahn@phytec.de>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adriano Cordova <adrianox@gmail.com>,
 Beiyan Yun <root@infi.wang>, Julien Stephan <jstephan@baylibre.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Martyn Welch <martyn.welch@collabora.com>, Andrew Davis <afd@ti.com>,
 Alexey Charkov <alchark@gmail.com>, Pramod Kumar <pramod.kumar_1@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Hrushikesh Salunke <h-salunke@ti.com>
Subject: [Uboot-stm32] [PATCH 2/6] rename NET to NET_LEGACY
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
X-Rspamd-Queue-Id: 3ED88475EA0
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[0leil.net : SPF not aligned (strict),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[172];
	R_DKIM_REJECT(1.00)[0leil.net:s=20231125];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[uboot];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:paul.barker.ct@bp.renesas.com,m:peng.fan@nxp.com,m:mkorpershoek@kernel.org,m:jan.kiszka@siemens.com,m:alvin@pqrs.dk,m:jerome.forissier@arm.com,m:neil.armstrong@linaro.org,m:lukma@denx.de,m:s-vadapalli@ti.com,m:dlechner@baylibre.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:i@shantur.com,m:c-vankar@ti.com,m:semen.protsenko@linaro.org,m:anshuld@ti.com,m:mingkai.hu@nxp.com,m:dannenberg@ti.com,m:hs@nabladev.com,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:padmarao.begari@amd.com,m:bb@ti.com,m:alice.guo@nxp.com,m:kever.yang@rock-chips.com,m:dev@benjarobin.fr,m:lucienzx159@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:SkyLake.Huang@mediatek.com,m:andre.przywara@arm.com,m:ansuelsmth@gmail.com,m:cniedermaier@dh-electronics.com,m:seanedmond@microsoft.com,m:tien.fong.chee@altera.com,m:msp@baylibre.com,m:Max.Merchel@ew.tq-group.com,m:michal.simek@amd.com,m
 :andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:mikhail.kshevetskiy@iopsys.eu,m:briansune@gmail.com,m:ycliang@andestech.com,m:m.schwan@phytec.de,m:dimorinny@google.com,m:sughosh.ganu@arm.com,m:quentin.schulz@cherry.de,m:sr@denx.de,m:festevam@gmail.com,m:vigneshr@ti.com,m:trini@konsulko.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:le.jin@siemens.com,m:abbaraju.manojsai@amarulasolutions.com,m:jonas@kwiboo.se,m:tharvey@gateworks.com,m:Maarten.Brock@sttls.nl,m:mbrugger@suse.com,m:francesco.dolcini@toradex.com,m:robert.marko@sartura.hr,m:aford173@gmail.com,m:j-choudhary@ti.com,m:vaishnav.a@ti.com,m:gchan9527@gmail.com,m:sjg@chromium.org,m:ariel.dalessandro@collabora.com,m:seashell11234455@gmail.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:marex@denx.de,m:weijie.gao@mediatek.com,m:ben.dooks@codethink.co.uk,m:balaji.selvanathan@oss.qualcomm.com,m:pbrobinson@gmail.com,m:B.Hahn@phytec.de,m:matteo.lisi@engicam.com,m:adrianox@gmail.com,m:root@infi.wang
 ,m:jstephan@baylibre.com,m:kory.maincent@bootlin.com,m:martyn.welch@collabora.com,m:afd@ti.com,m:alchark@gmail.com,m:pramod.kumar_1@nxp.com,m:patrick.delaunay@foss.st.com,m:h-salunke@ti.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[foss@0leil.net,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[0leil.net:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[90];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[foss@0leil.net,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,siemens.com,pqrs.dk,arm.com,linaro.org,denx.de,ti.com,baylibre.com,mailbox.org,shantur.com,nabladev.com,gmail.com,amd.com,rock-chips.com,benjarobin.fr,amarulasolutions.com,mediatek.com,dh-electronics.com,microsoft.com,altera.com,ew.tq-group.com,iopsys.eu,andestech.com,phytec.de,google.com,cherry.de,konsulko.com,bootlin.com,gmx.de,kwiboo.se,gateworks.com,sttls.nl,suse.com,toradex.com,sartura.hr,chromium.org,collabora.com,ziyao.cc,codethink.co.uk,oss.qualcomm.com,engicam.com,infi.wang,foss.st.com];
	NEURAL_HAM(-0.00)[-0.833];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,nongnu.org:url]
X-Spam: Yes

From: Quentin Schulz <quentin.schulz@cherry.de>

Highlight that NET really is the legacy networking stack by renaming the
option to NET_LEGACY.

This requires us to add an SPL_NET_LEGACY alias to SPL_NET as otherwise
CONFIG_IS_ENABLED(NET_LEGACY) will not work for SPL.

The "depends on !NET_LWIP" for SPL_NET clearly highlights that it is
using the legacy networking app so this seems fine to do.

This also has the benefit of removing potential confusion on NET being a
specific networking stack instead of "any" network stack.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 Makefile                                             |  4 ++--
 arch/arm/mach-stm32mp/soc.c                          |  2 +-
 board/beacon/imx8mp/imx8mp_beacon.c                  |  2 +-
 board/engicam/imx8mp/icore_mx8mp.c                   |  2 +-
 board/gateworks/venice/venice.c                      |  4 ++--
 board/nxp/ls1043ardb/Makefile                        |  2 +-
 board/nxp/ls1046afrwy/Makefile                       |  2 +-
 board/nxp/ls1046ardb/Makefile                        |  2 +-
 .../imx8mp_debix_model_a/imx8mp_debix_model_a.c      |  2 +-
 board/siemens/iot2050/board.c                        |  2 +-
 board/sophgo/milkv_duo/Makefile                      |  2 +-
 board/sophgo/milkv_duo/board.c                       |  2 +-
 board/theadorable/theadorable.c                      |  4 ++--
 board/ti/am335x/board.c                              |  2 +-
 board/toradex/verdin-imx8mp/verdin-imx8mp.c          |  2 +-
 board/xilinx/common/board.c                          |  2 +-
 cmd/Kconfig                                          | 12 ++++++------
 cmd/Makefile                                         |  2 +-
 cmd/bdinfo.c                                         |  6 +++---
 cmd/fastboot.c                                       |  4 ++--
 cmd/ufetch.c                                         |  2 +-
 common/Kconfig                                       |  2 +-
 common/board_r.c                                     |  4 ++--
 common/spl/Kconfig                                   |  5 ++++-
 configs/am62px_evm_r5_ethboot_defconfig              |  2 +-
 configs/j722s_evm_r5_ethboot_defconfig               |  2 +-
 doc/develop/bootstd/overview.rst                     |  2 +-
 doc/develop/pytest/usage.rst                         |  4 ++--
 doc/usage/cmd/bdinfo.rst                             |  6 +++---
 doc/usage/cmd/sntp.rst                               |  2 +-
 doc/usage/cmd/wget.rst                               |  2 +-
 drivers/dfu/Kconfig                                  |  2 +-
 drivers/fastboot/Kconfig                             |  4 ++--
 drivers/fastboot/fb_common.c                         |  4 ++--
 drivers/net/Kconfig                                  |  6 +++---
 drivers/net/phy/Kconfig                              |  4 ++--
 drivers/net/sandbox.c                                |  2 +-
 drivers/usb/gadget/Kconfig                           |  2 +-
 env/flags.c                                          | 10 +++++-----
 include/configs/stm32mp15_common.h                   |  2 +-
 include/configs/stm32mp23_common.h                   |  2 +-
 include/configs/stm32mp25_common.h                   |  2 +-
 include/env_callback.h                               |  2 +-
 include/env_flags.h                                  |  6 +++---
 include/net-common.h                                 |  4 ++--
 include/net-legacy.h                                 |  2 +-
 lib/Kconfig                                          |  2 +-
 lib/efi_loader/Kconfig                               |  4 ++--
 net/Kconfig                                          | 20 ++++++++++----------
 net/Makefile                                         |  6 +++---
 test/cmd/Makefile                                    |  2 +-
 test/cmd/bdinfo.c                                    |  6 +++---
 test/dm/eth.c                                        |  6 +++---
 test/py/tests/test_efi_fit.py                        |  2 +-
 test/py/tests/test_efi_loader.py                     |  2 +-
 test/py/tests/test_fpga.py                           |  4 ++--
 test/py/tests/test_net.py                            |  2 +-
 57 files changed, 104 insertions(+), 101 deletions(-)

diff --git a/Makefile b/Makefile
index dfc95d314dd..285a9e2beed 100644
--- a/Makefile
+++ b/Makefile
@@ -1081,7 +1081,7 @@ libs-$(CONFIG_OF_EMBED) += dts/
 libs-y += env/
 libs-y += lib/
 libs-y += fs/
-libs-$(filter y,$(CONFIG_NET) $(CONFIG_NET_LWIP)) += net/
+libs-$(filter y,$(CONFIG_NET_LEGACY) $(CONFIG_NET_LWIP)) += net/
 libs-y += disk/
 libs-y += drivers/
 libs-$(CONFIG_SYS_FSL_DDR) += drivers/ddr/fsl/
@@ -1373,7 +1373,7 @@ expect = $(foreach cfg,$(1),y)
 # 1: List of options to migrate to (e.g. "CONFIG_DM_MMC CONFIG_BLK")
 # 2: Name of component (e.g . "Ethernet drivers")
 # 3: Release deadline (e.g. "v202.07")
-# 4: Condition to require before checking (e.g. "$(CONFIG_NET)")
+# 4: Condition to require before checking (e.g. "$(CONFIG_NET_LEGACY)")
 # Note: Script avoids bash construct, hence the strange double 'if'
 # (patches welcome!)
 define deprecated
diff --git a/arch/arm/mach-stm32mp/soc.c b/arch/arm/mach-stm32mp/soc.c
index fa56b0d2e0f..67be55e3381 100644
--- a/arch/arm/mach-stm32mp/soc.c
+++ b/arch/arm/mach-stm32mp/soc.c
@@ -64,7 +64,7 @@ __weak int setup_mac_address(void)
 	struct udevice *dev;
 	int nb_eth, nb_otp, index;
 
-	if (!IS_ENABLED(CONFIG_NET))
+	if (!IS_ENABLED(CONFIG_NET_LEGACY))
 		return 0;
 
 	nb_eth = get_eth_nb();
diff --git a/board/beacon/imx8mp/imx8mp_beacon.c b/board/beacon/imx8mp/imx8mp_beacon.c
index dd74e7c0f75..541a4b00eba 100644
--- a/board/beacon/imx8mp/imx8mp_beacon.c
+++ b/board/beacon/imx8mp/imx8mp_beacon.c
@@ -14,7 +14,7 @@ static void setup_fec(void)
 	setbits_le32(&gpr->gpr[1], BIT(22));
 }
 
-#if IS_ENABLED(CONFIG_NET)
+#if IS_ENABLED(CONFIG_NET_LEGACY)
 int board_phy_config(struct phy_device *phydev)
 {
 	if (phydev->drv->config)
diff --git a/board/engicam/imx8mp/icore_mx8mp.c b/board/engicam/imx8mp/icore_mx8mp.c
index 864afa92aee..f01da961235 100644
--- a/board/engicam/imx8mp/icore_mx8mp.c
+++ b/board/engicam/imx8mp/icore_mx8mp.c
@@ -30,7 +30,7 @@ static void setup_fec(void)
 	setbits_le32(&gpr->gpr[1], BIT(22));
 }
 
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 int board_phy_config(struct phy_device *phydev)
 {
 	if (phydev->drv->config)
diff --git a/board/gateworks/venice/venice.c b/board/gateworks/venice/venice.c
index 6a24f618ae2..aeb401b1210 100644
--- a/board/gateworks/venice/venice.c
+++ b/board/gateworks/venice/venice.c
@@ -47,7 +47,7 @@ int board_fit_config_name_match(const char *path)
 	return -1;
 }
 
-#if (IS_ENABLED(CONFIG_NET))
+#if (IS_ENABLED(CONFIG_NET_LEGACY))
 int board_phy_config(struct phy_device *phydev)
 {
 	unsigned short val;
@@ -71,7 +71,7 @@ int board_phy_config(struct phy_device *phydev)
 
 	return 0;
 }
-#endif // IS_ENABLED(CONFIG_NET)
+#endif // IS_ENABLED(CONFIG_NET_LEGACY)
 
 int board_init(void)
 {
diff --git a/board/nxp/ls1043ardb/Makefile b/board/nxp/ls1043ardb/Makefile
index 95745bf3a9c..3f651b41606 100644
--- a/board/nxp/ls1043ardb/Makefile
+++ b/board/nxp/ls1043ardb/Makefile
@@ -5,6 +5,6 @@
 obj-y += ddr.o
 obj-y += ls1043ardb.o
 ifndef CONFIG_XPL_BUILD
-obj-$(CONFIG_NET) += eth.o
+obj-$(CONFIG_NET_LEGACY) += eth.o
 obj-y += cpld.o
 endif
diff --git a/board/nxp/ls1046afrwy/Makefile b/board/nxp/ls1046afrwy/Makefile
index c70f5cda797..8594658d2fb 100644
--- a/board/nxp/ls1046afrwy/Makefile
+++ b/board/nxp/ls1046afrwy/Makefile
@@ -4,4 +4,4 @@
 
 obj-y += ddr.o
 obj-y += ls1046afrwy.o
-obj-$(CONFIG_NET) += eth.o
+obj-$(CONFIG_NET_LEGACY) += eth.o
diff --git a/board/nxp/ls1046ardb/Makefile b/board/nxp/ls1046ardb/Makefile
index 9e5d24f53c8..355ccf59257 100644
--- a/board/nxp/ls1046ardb/Makefile
+++ b/board/nxp/ls1046ardb/Makefile
@@ -5,6 +5,6 @@
 obj-y += ddr.o
 obj-y += ls1046ardb.o
 ifndef CONFIG_XPL_BUILD
-obj-$(CONFIG_NET) += eth.o
+obj-$(CONFIG_NET_LEGACY) += eth.o
 obj-y += cpld.o
 endif
diff --git a/board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c b/board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c
index 7f0925074fa..cff9383bad4 100644
--- a/board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c
+++ b/board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c
@@ -26,7 +26,7 @@ static void setup_fec(void)
 	setbits_le32(&gpr->gpr[1], BIT(22));
 }
 
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 int board_phy_config(struct phy_device *phydev)
 {
 	if (phydev->drv->config)
diff --git a/board/siemens/iot2050/board.c b/board/siemens/iot2050/board.c
index c75f4a0d084..79cf34b40eb 100644
--- a/board/siemens/iot2050/board.c
+++ b/board/siemens/iot2050/board.c
@@ -232,7 +232,7 @@ void set_board_info_env(void)
 		env_set("seboot_version", buf);
 	env_set("fw_version", PLAIN_VERSION);
 
-	if (IS_ENABLED(CONFIG_NET)) {
+	if (IS_ENABLED(CONFIG_NET_LEGACY)) {
 		int mac_cnt;
 
 		mac_cnt = sysinfo_get_item_count(sysinfo, SYSID_BOARD_MAC_ADDR);
diff --git a/board/sophgo/milkv_duo/Makefile b/board/sophgo/milkv_duo/Makefile
index d0525eba853..18ada7d72ff 100644
--- a/board/sophgo/milkv_duo/Makefile
+++ b/board/sophgo/milkv_duo/Makefile
@@ -3,4 +3,4 @@
 # Copyright (c) 2024, Kongyang Liu <seashell11234455@gmail.com>
 
 obj-y += board.o
-obj-$(CONFIG_NET) += ethernet.o
+obj-$(CONFIG_NET_LEGACY) += ethernet.o
diff --git a/board/sophgo/milkv_duo/board.c b/board/sophgo/milkv_duo/board.c
index 9adbb08f5ce..f0944859b58 100644
--- a/board/sophgo/milkv_duo/board.c
+++ b/board/sophgo/milkv_duo/board.c
@@ -12,7 +12,7 @@ int board_init(void)
 	if (IS_ENABLED(CONFIG_SYSRESET_CV1800B))
 		device_bind_driver(gd->dm_root, "cv1800b_sysreset", "sysreset", NULL);
 
-	if (IS_ENABLED(CONFIG_NET))
+	if (IS_ENABLED(CONFIG_NET_LEGACY))
 		cv1800b_ephy_init();
 
 	return 0;
diff --git a/board/theadorable/theadorable.c b/board/theadorable/theadorable.c
index 2f5ad769b9b..e5c78e9c064 100644
--- a/board/theadorable/theadorable.c
+++ b/board/theadorable/theadorable.c
@@ -20,7 +20,7 @@
 #include <asm/arch/soc.h>
 #include <linux/delay.h>
 #include <linux/mbus.h>
-#ifdef CONFIG_NET
+#ifdef CONFIG_NET_LEGACY
 #include <netdev.h>
 #endif
 #include <u-boot/crc.h>
@@ -244,7 +244,7 @@ int checkboard(void)
 	return 0;
 }
 
-#ifdef CONFIG_NET
+#ifdef CONFIG_NET_LEGACY
 int board_eth_init(struct bd_info *bis)
 {
 	cpu_eth_init(bis); /* Built in controller(s) come first */
diff --git a/board/ti/am335x/board.c b/board/ti/am335x/board.c
index 90e37a8d913..4b7aa5c8586 100644
--- a/board/ti/am335x/board.c
+++ b/board/ti/am335x/board.c
@@ -911,7 +911,7 @@ int board_late_init(void)
 #endif
 
 /* CPSW plat */
-#if (CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)) && \
+#if (CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)) && \
     !CONFIG_IS_ENABLED(OF_CONTROL)
 struct cpsw_slave_data slave_data[] = {
 	{
diff --git a/board/toradex/verdin-imx8mp/verdin-imx8mp.c b/board/toradex/verdin-imx8mp/verdin-imx8mp.c
index 59b4607f065..69c3408fbba 100644
--- a/board/toradex/verdin-imx8mp/verdin-imx8mp.c
+++ b/board/toradex/verdin-imx8mp/verdin-imx8mp.c
@@ -46,7 +46,7 @@ static void setup_fec(void)
 	setbits_le32(&gpr->gpr[1], BIT(22));
 }
 
-#if IS_ENABLED(CONFIG_NET)
+#if IS_ENABLED(CONFIG_NET_LEGACY)
 int board_phy_config(struct phy_device *phydev)
 {
 	if (phydev->drv->config)
diff --git a/board/xilinx/common/board.c b/board/xilinx/common/board.c
index d022308f943..b21a1361137 100644
--- a/board/xilinx/common/board.c
+++ b/board/xilinx/common/board.c
@@ -508,7 +508,7 @@ int board_late_init_xilinx(void)
 				ret |= env_set_by_index("uuid", id, uuid);
 			}
 
-			if (!(CONFIG_IS_ENABLED(NET) ||
+			if (!(CONFIG_IS_ENABLED(NET_LEGACY) ||
 			      CONFIG_IS_ENABLED(NET_LWIP)))
 				continue;
 
diff --git a/cmd/Kconfig b/cmd/Kconfig
index 9b8a13c3446..f19a656146a 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -1946,7 +1946,7 @@ config CMD_XXD
 
 endmenu
 
-if NET || NET_LWIP
+if NET_LEGACY || NET_LWIP
 
 menuconfig CMD_NET
 	bool "Network commands"
@@ -1954,7 +1954,7 @@ menuconfig CMD_NET
 
 if CMD_NET
 
-if NET
+if NET_LEGACY
 
 config CMD_BOOTP
 	bool "bootp"
@@ -2198,12 +2198,12 @@ config CMD_WOL
 	help
 	  Wait for wake-on-lan Magic Packet
 
-endif  # if NET
+endif  # if NET_LEGACY
 
 config CMD_DHCP
 	bool "dhcp"
 	select PROT_DHCP_LWIP if NET_LWIP
-	select CMD_BOOTP if NET
+	select CMD_BOOTP if NET_LEGACY
 	help
 	  Boot image via network using DHCP/TFTP protocol
 
@@ -2259,7 +2259,7 @@ config CMD_PING
 
 config CMD_SNTP
 	bool "sntp"
-	select PROT_UDP if NET
+	select PROT_UDP if NET_LEGACY
 	select PROT_UDP_LWIP if NET_LWIP
 	help
 	  Synchronize RTC via network
@@ -2329,7 +2329,7 @@ config CMD_PXE
 
 endif  # if CMD_NET
 
-endif # NET || NET_LWIP
+endif # NET_LEGACY || NET_LWIP
 
 menu "Misc commands"
 
diff --git a/cmd/Makefile b/cmd/Makefile
index 6b69da1f2b0..bbbdfcc4ded 100644
--- a/cmd/Makefile
+++ b/cmd/Makefile
@@ -131,7 +131,7 @@ obj-y += legacy-mtd-utils.o
 endif
 obj-$(CONFIG_CMD_MUX) += mux.o
 obj-$(CONFIG_CMD_NAND) += nand.o
-ifdef CONFIG_NET
+ifdef CONFIG_NET_LEGACY
 obj-$(CONFIG_CMD_NET) += net.o net-common.o
 else ifdef CONFIG_NET_LWIP
 obj-$(CONFIG_CMD_NET) += net-common.o
diff --git a/cmd/bdinfo.c b/cmd/bdinfo.c
index dc7c2c3c853..39e7bec3885 100644
--- a/cmd/bdinfo.c
+++ b/cmd/bdinfo.c
@@ -152,7 +152,7 @@ static int bdinfo_print_all(struct bd_info *bd)
 	bdinfo_print_num_l("relocaddr", gd->relocaddr);
 	bdinfo_print_num_l("reloc off", gd->reloc_off);
 	printf("%-12s= %u-bit\n", "Build", (uint)sizeof(void *) * 8);
-	if (IS_ENABLED(CONFIG_NET) || IS_ENABLED(CONFIG_NET_LWIP))
+	if (IS_ENABLED(CONFIG_NET_LEGACY) || IS_ENABLED(CONFIG_NET_LWIP))
 		print_eth();
 	bdinfo_print_num_l("fdt_blob", (ulong)map_to_sysmem(gd->fdt_blob));
 	if (IS_ENABLED(CONFIG_VIDEO))
@@ -194,7 +194,7 @@ int do_bdinfo(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
 		case 'a':
 			return bdinfo_print_all(bd);
 		case 'e':
-			if (!IS_ENABLED(CONFIG_NET) &&
+			if (!IS_ENABLED(CONFIG_NET_LEGACY) &&
 			    !IS_ENABLED(CONFIG_NET_LWIP))
 				return CMD_RET_USAGE;
 			print_eth();
@@ -221,7 +221,7 @@ U_BOOT_CMD(
 	"  - print all Board Info structure"
 #if CONFIG_IS_ENABLED(GETOPT)
 	"\n"
-#if IS_ENABLED(CONFIG_NET) || IS_ENABLED(CONFIG_NET_LWIP)
+#if IS_ENABLED(CONFIG_NET_LEGACY) || IS_ENABLED(CONFIG_NET_LWIP)
 	"bdinfo -e\n"
 	"  - print Board Info related to network\n"
 #endif
diff --git a/cmd/fastboot.c b/cmd/fastboot.c
index be84a482b81..e71f873527b 100644
--- a/cmd/fastboot.c
+++ b/cmd/fastboot.c
@@ -16,7 +16,7 @@
 #include <linux/printk.h>
 #include <linux/stringify.h>
 
-#if CONFIG_IS_ENABLED(NET)
+#if CONFIG_IS_ENABLED(NET_LEGACY)
 static int do_fastboot_udp(int argc, char *const argv[],
 			   uintptr_t buf_addr, size_t buf_size)
 {
@@ -162,7 +162,7 @@ NXTARG:
 
 	fastboot_init((void *)buf_addr, buf_size);
 
-#if CONFIG_IS_ENABLED(NET)
+#if CONFIG_IS_ENABLED(NET_LEGACY)
 	if (!strcmp(argv[1], "udp"))
 		return do_fastboot_udp(argc, argv, buf_addr, buf_size);
 	if (!strcmp(argv[1], "tcp"))
diff --git a/cmd/ufetch.c b/cmd/ufetch.c
index bc5db08eee1..f8dc904bdd0 100644
--- a/cmd/ufetch.c
+++ b/cmd/ufetch.c
@@ -159,7 +159,7 @@ static int do_ufetch(struct cmd_tbl *cmdtp, int flag, int argc,
 			break;
 		case FEATURES:
 			printf("Features:" RESET " ");
-			if (IS_ENABLED(CONFIG_NET))
+			if (IS_ENABLED(CONFIG_NET_LEGACY))
 				printf("Net");
 			if (IS_ENABLED(CONFIG_EFI_LOADER))
 				printf(", EFI");
diff --git a/common/Kconfig b/common/Kconfig
index 2a167ec3ad3..3c3af0e3647 100644
--- a/common/Kconfig
+++ b/common/Kconfig
@@ -425,7 +425,7 @@ config LOGF_FUNC_PAD
 
 config LOG_SYSLOG
 	bool "Log output to syslog server"
-	depends on NET || NET_LWIP
+	depends on NET_LEGACY || NET_LWIP
 	help
 	  Enables a log driver which broadcasts log records via UDP port 514
 	  to syslog servers.
diff --git a/common/board_r.c b/common/board_r.c
index 8cf0e14679c..37e6f51c7a7 100644
--- a/common/board_r.c
+++ b/common/board_r.c
@@ -495,7 +495,7 @@ static int initr_boot_led_on(void)
 	return 0;
 }
 
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 static int initr_net(void)
 {
 	puts("Net:   ");
@@ -756,7 +756,7 @@ static void initcall_run_r(void)
 #if CONFIG_IS_ENABLED(PCI_ENDPOINT)
 	INITCALL(pci_ep_init);
 #endif
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 	WATCHDOG_RESET();
 	INITCALL(initr_net);
 #endif
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index a21b71ad5d1..5fa94098e49 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -1151,7 +1151,7 @@ config SPL_DM_SPI_FLASH
 
 config SPL_NET
 	bool "Support networking"
-	depends on NET
+	depends on NET_LEGACY
 	select SPL_USE_TINY_PRINTF_POINTER_SUPPORT if SPL_USE_TINY_PRINTF
 	help
 	  Enable support for network devices (such as Ethernet) in SPL.
@@ -1160,6 +1160,9 @@ config SPL_NET
 	  the network stack uses a number of environment variables. See also
 	  SPL_ETH.
 
+config SPL_NET_LEGACY
+	def_bool y if SPL_NET
+
 config SPL_NET_VCI_STRING
 	string "BOOTP Vendor Class Identifier string sent by SPL"
 	depends on SPL_NET
diff --git a/configs/am62px_evm_r5_ethboot_defconfig b/configs/am62px_evm_r5_ethboot_defconfig
index dfd944ad7c0..8baec9d43ff 100644
--- a/configs/am62px_evm_r5_ethboot_defconfig
+++ b/configs/am62px_evm_r5_ethboot_defconfig
@@ -5,7 +5,7 @@ CONFIG_ARCH_K3=y
 CONFIG_SOC_K3_AM62P5=y
 CONFIG_TARGET_AM62P5_R5_EVM=y
 CONFIG_DEFAULT_DEVICE_TREE="k3-am62p5-r5-sk"
-CONFIG_NET=y
+CONFIG_NET_LEGACY=y
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_DMA=y
 CONFIG_SPL_ENV_SUPPORT=y
diff --git a/configs/j722s_evm_r5_ethboot_defconfig b/configs/j722s_evm_r5_ethboot_defconfig
index 68237f7d8c3..e4682edb455 100644
--- a/configs/j722s_evm_r5_ethboot_defconfig
+++ b/configs/j722s_evm_r5_ethboot_defconfig
@@ -5,7 +5,7 @@ CONFIG_ARCH_K3=y
 CONFIG_SOC_K3_J722S=y
 CONFIG_TARGET_J722S_R5_EVM=y
 CONFIG_DEFAULT_DEVICE_TREE="k3-j722s-r5-evm"
-CONFIG_NET=y
+CONFIG_NET_LEGACY=y
 CONFIG_SPL_DRIVERS_MISC=y
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_DMA=y
diff --git a/doc/develop/bootstd/overview.rst b/doc/develop/bootstd/overview.rst
index 397f6db18b4..99ff7d6192d 100644
--- a/doc/develop/bootstd/overview.rst
+++ b/doc/develop/bootstd/overview.rst
@@ -422,7 +422,7 @@ includes the full set of commands, more error messages when things go wrong and
 bootmeth ordering with the bootmeths environment variable.
 
 You should probably also enable `CONFIG_BOOTSTD_DEFAULTS`, which provides
-several filesystem and network features (if `CONFIG_NET` is enabled) so that
+several filesystem and network features (if `CONFIG_NET_LEGACY` is enabled) so that
 a good selection of boot options is available.
 
 Some devicetree properties are supported in the bootstd node when
diff --git a/doc/develop/pytest/usage.rst b/doc/develop/pytest/usage.rst
index e9296fd1f44..6002244d608 100644
--- a/doc/develop/pytest/usage.rst
+++ b/doc/develop/pytest/usage.rst
@@ -546,11 +546,11 @@ following annotation for a test requires ``CONFIG_EFI_LOADER=y``:
 Sometimes multiple configuration option supply the same functionality. If
 multiple arguments are passed to ``buildconfigspec()``, only one of the
 configuration options needs to be set. The following annotation requires that
-either of ``CONFIG_NET`` or ``CONFIG_NET_LWIP`` is set:
+either of ``CONFIG_NET_LEGACY`` or ``CONFIG_NET_LWIP`` is set:
 
 .. code-block:: python
 
-    @pytest.mark.buildconfigspec('net', 'net_lwip')
+    @pytest.mark.buildconfigspec('net_legacy', 'net_lwip')
 
 The ``notbuildconfigspec()`` annotation can be used to require a configuration
 option not to be set. The following annotation requires ``CONFIG_RISCV=n``:
diff --git a/doc/usage/cmd/bdinfo.rst b/doc/usage/cmd/bdinfo.rst
index 46046e55e06..09db9101bd1 100644
--- a/doc/usage/cmd/bdinfo.rst
+++ b/doc/usage/cmd/bdinfo.rst
@@ -124,12 +124,12 @@ Build
 current eth
     name of the active network device
 
-    Only shown if CONFIG_NET=y or CONFIG_NET_LWIP=y.
+    Only shown if CONFIG_NET_LEGACY=y or CONFIG_NET_LWIP=y.
 
 IP addr
     network address, value of the environment variable *ipaddr*
 
-    Only shown if CONFIG_NET=y or CONFIG_NET_LWIP=y.
+    Only shown if CONFIG_NET_LEGACY=y or CONFIG_NET_LWIP=y.
 
 fdt_blob
     address of U-Boot's own device tree, NULL if none
@@ -173,5 +173,5 @@ The bdinfo command is available if CONFIG_CMD_BDI=y.
 
 The options to bdinfo are only available if CONFIG_GETOPT=y.
 
-The ``-e`` option is additionally only available if CONFIG_NET=y or
+The ``-e`` option is additionally only available if CONFIG_NET_LEGACY=y or
 CONFIG_NET_LWIP=y.
diff --git a/doc/usage/cmd/sntp.rst b/doc/usage/cmd/sntp.rst
index 2046828130d..433884f18b2 100644
--- a/doc/usage/cmd/sntp.rst
+++ b/doc/usage/cmd/sntp.rst
@@ -24,7 +24,7 @@ the server's IP address to be given on the command line or via the
 `ntpserverip` environment variable.
 
 The address of the NTP server does not need to be given if the DHCP server
-provides one. The legacy network stack (`CONFIG_NET=y`) can only use the
+provides one. The legacy network stack (`CONFIG_NET_LEGACY=y`) can only use the
 first NTP server provided in the `ntp-servers` DHCP option.
 
 When the network stack is lwIP (`CONFIG_NET_LWIP=y`) and DNS resolution
diff --git a/doc/usage/cmd/wget.rst b/doc/usage/cmd/wget.rst
index e6c42f967b9..f661d739a19 100644
--- a/doc/usage/cmd/wget.rst
+++ b/doc/usage/cmd/wget.rst
@@ -26,7 +26,7 @@ In order to use HTTPS you will need to compile wget with lwIP support.
 Legacy syntax
 ~~~~~~~~~~~~~
 
-The legacy syntax is supported by the legacy network stack (CONFIG_NET=y)
+The legacy syntax is supported by the legacy network stack (CONFIG_NET_LEGACY=y)
 as well as by the lwIP base network stack (CONFIG_NET_LWIP=y). It supports HTTP
 only.
 
diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
index 962bda40ad2..eeae2fd65ad 100644
--- a/drivers/dfu/Kconfig
+++ b/drivers/dfu/Kconfig
@@ -11,7 +11,7 @@ config DFU_OVER_USB
 
 config DFU_OVER_TFTP
 	bool
-	depends on NET
+	depends on NET_LEGACY
 
 config DFU_WRITE_ALT
 	bool
diff --git a/drivers/fastboot/Kconfig b/drivers/fastboot/Kconfig
index 576c3ef8a45..90212fcf9ef 100644
--- a/drivers/fastboot/Kconfig
+++ b/drivers/fastboot/Kconfig
@@ -27,7 +27,7 @@ config USB_FUNCTION_FASTBOOT
 	  This enables the USB part of the fastboot gadget.
 
 config UDP_FUNCTION_FASTBOOT
-	depends on NET
+	depends on NET_LEGACY
 	select FASTBOOT
 	bool "Enable fastboot protocol over UDP"
 	help
@@ -41,7 +41,7 @@ config UDP_FUNCTION_FASTBOOT_PORT
 	  The fastboot protocol requires a UDP port number.
 
 config TCP_FUNCTION_FASTBOOT
-	depends on NET
+	depends on NET_LEGACY
 	select FASTBOOT
 	bool "Enable fastboot protocol over TCP"
 	help
diff --git a/drivers/fastboot/fb_common.c b/drivers/fastboot/fb_common.c
index dac5528f809..9c52e004588 100644
--- a/drivers/fastboot/fb_common.c
+++ b/drivers/fastboot/fb_common.c
@@ -191,13 +191,13 @@ void fastboot_handle_boot(int command, bool success)
 	switch (command) {
 	case FASTBOOT_COMMAND_BOOT:
 		fastboot_boot();
-#if CONFIG_IS_ENABLED(NET)
+#if CONFIG_IS_ENABLED(NET_LEGACY)
 		net_set_state(NETLOOP_SUCCESS);
 #endif
 		break;
 
 	case FASTBOOT_COMMAND_CONTINUE:
-#if CONFIG_IS_ENABLED(NET)
+#if CONFIG_IS_ENABLED(NET_LEGACY)
 		net_set_state(NETLOOP_SUCCESS);
 #endif
 		break;
diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index ed07e286676..f0288387aed 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -339,7 +339,7 @@ config ESSEDMA
 
 config ETH_SANDBOX
 	depends on SANDBOX
-	depends on NET || NET_LWIP
+	depends on NET_LEGACY || NET_LWIP
 	default y
 	bool "Sandbox: Mocked Ethernet driver"
 	help
@@ -350,7 +350,7 @@ config ETH_SANDBOX
 
 config ETH_SANDBOX_RAW
 	depends on SANDBOX
-	depends on NET
+	depends on NET_LEGACY
 	default y
 	bool "Sandbox: Bridge to Linux Raw Sockets"
 	help
@@ -476,7 +476,7 @@ config FTMAC100
 config FTGMAC100
 	bool "Ftgmac100 Ethernet Support"
 	select PHYLIB
-	depends on NET
+	depends on NET_LEGACY
 	help
 	  This driver supports the Faraday's FTGMAC100 Gigabit SoC
 	  Ethernet controller that can be found on Aspeed SoCs (which
diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 5d2277a4602..93f32aea595 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -7,7 +7,7 @@ config MV88E6352_SWITCH
 
 menuconfig PHYLIB
 	bool "Ethernet PHY (physical media interface) support"
-	depends on NET || NET_LWIP
+	depends on NET_LEGACY || NET_LWIP
 	help
 	  Enable Ethernet PHY (physical media interface) support.
 
@@ -381,7 +381,7 @@ config PHY_FIXED
 
 config PHY_NCSI
 	bool "NC-SI based PHY"
-	depends on NET
+	depends on NET_LEGACY
 
 endif #PHYLIB
 
diff --git a/drivers/net/sandbox.c b/drivers/net/sandbox.c
index 0ea50c484c0..e1daeb6c1e6 100644
--- a/drivers/net/sandbox.c
+++ b/drivers/net/sandbox.c
@@ -15,7 +15,7 @@
 
 /*
  * Structure definitions for network protocols. Since this file is used for
- * both NET and NET_LWIP, and given that the two network stacks do have
+ * both NET_LEGACY and NET_LWIP, and given that the two network stacks do have
  * conflicting types (for instance struct icmp_hdr), it is on purpose that the
  * structures are defined locally with minimal dependencies -- <asm/types.h> is
  * included for the bit types and that's it.
diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index baa2eb61ea3..d4ffc24c063 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -232,7 +232,7 @@ endif # USB_GADGET_DOWNLOAD
 
 config USB_ETHER
 	bool "USB Ethernet Gadget"
-	depends on NET || NET_LWIP
+	depends on NET_LEGACY || NET_LWIP
 	default y if ARCH_SUNXI && USB_MUSB_GADGET
 	help
 	  Creates an Ethernet network device through a USB peripheral
diff --git a/env/flags.c b/env/flags.c
index f734fda50c2..45eb9820d9f 100644
--- a/env/flags.c
+++ b/env/flags.c
@@ -22,7 +22,7 @@
 #include <env_internal.h>
 #endif
 
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 #define ENV_FLAGS_NET_VARTYPE_REPS "im"
 #else
 #define ENV_FLAGS_NET_VARTYPE_REPS ""
@@ -57,7 +57,7 @@ static const char * const env_flags_vartype_names[] = {
 	"decimal",
 	"hexadecimal",
 	"boolean",
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 	"IP address",
 	"MAC address",
 #endif
@@ -211,7 +211,7 @@ static void skip_num(int hex, const char *value, const char **end,
 		*end = value;
 }
 
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 int eth_validate_ethaddr_str(const char *addr)
 {
 	const char *end;
@@ -244,7 +244,7 @@ static int _env_flags_validate_type(const char *value,
 	enum env_flags_vartype type)
 {
 	const char *end;
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 	const char *cur;
 	int i;
 #endif
@@ -273,7 +273,7 @@ static int _env_flags_validate_type(const char *value,
 		if (value[1] != '\0')
 			return -1;
 		break;
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 	case env_flags_vartype_ipaddr:
 		cur = value;
 		for (i = 0; i < 4; i++) {
diff --git a/include/configs/stm32mp15_common.h b/include/configs/stm32mp15_common.h
index 9cac31bcf47..9a87b479176 100644
--- a/include/configs/stm32mp15_common.h
+++ b/include/configs/stm32mp15_common.h
@@ -41,7 +41,7 @@
 #define BOOT_TARGET_MMC2(func)
 #endif
 
-#ifdef CONFIG_NET
+#ifdef CONFIG_NET_LEGACY
 #define BOOT_TARGET_PXE(func)	func(PXE, pxe, na)
 #else
 #define BOOT_TARGET_PXE(func)
diff --git a/include/configs/stm32mp23_common.h b/include/configs/stm32mp23_common.h
index 7285886b822..392d779ec16 100644
--- a/include/configs/stm32mp23_common.h
+++ b/include/configs/stm32mp23_common.h
@@ -29,7 +29,7 @@
 #ifdef CONFIG_DISTRO_DEFAULTS
 /*****************************************************************************/
 
-#ifdef CONFIG_NET
+#ifdef CONFIG_NET_LEGACY
 #define BOOT_TARGET_PXE(func)	func(PXE, pxe, na)
 #else
 #define BOOT_TARGET_PXE(func)
diff --git a/include/configs/stm32mp25_common.h b/include/configs/stm32mp25_common.h
index b42316fd8ac..a334b47b555 100644
--- a/include/configs/stm32mp25_common.h
+++ b/include/configs/stm32mp25_common.h
@@ -25,7 +25,7 @@
 #ifdef CONFIG_DISTRO_DEFAULTS
 /*****************************************************************************/
 
-#ifdef CONFIG_NET
+#ifdef CONFIG_NET_LEGACY
 #define BOOT_TARGET_PXE(func)	func(PXE, pxe, na)
 #else
 #define BOOT_TARGET_PXE(func)
diff --git a/include/env_callback.h b/include/env_callback.h
index 918ccb3b14f..f7bb23df569 100644
--- a/include/env_callback.h
+++ b/include/env_callback.h
@@ -32,7 +32,7 @@
 #define DNS_CALLBACK
 #endif
 
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 #define NET_CALLBACKS \
 	"bootfile:bootfile," \
 	"ipaddr:ipaddr," \
diff --git a/include/env_flags.h b/include/env_flags.h
index 0c48874690f..85721a89cfb 100644
--- a/include/env_flags.h
+++ b/include/env_flags.h
@@ -14,7 +14,7 @@ enum env_flags_vartype {
 	env_flags_vartype_decimal,
 	env_flags_vartype_hex,
 	env_flags_vartype_bool,
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 	env_flags_vartype_ipaddr,
 	env_flags_vartype_macaddr,
 #endif
@@ -41,7 +41,7 @@ enum env_flags_varaccess {
 #define CFG_ENV_FLAGS_LIST_STATIC ""
 #endif
 
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 #ifdef CONFIG_REGEX
 #define ETHADDR_WILDCARD "\\d*"
 #else
@@ -123,7 +123,7 @@ enum env_flags_varaccess env_flags_parse_varaccess(const char *flags);
  */
 enum env_flags_varaccess env_flags_parse_varaccess_from_binflags(int binflags);
 
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 /*
  * Check if a string has the format of an Ethernet MAC address
  */
diff --git a/include/net-common.h b/include/net-common.h
index f293b21bc0b..0cbdf344664 100644
--- a/include/net-common.h
+++ b/include/net-common.h
@@ -235,7 +235,7 @@ int eth_rx(void);			/* Check for received packets */
  */
 void reset_phy(void);
 
-#if CONFIG_IS_ENABLED(NET) || CONFIG_IS_ENABLED(NET_LWIP)
+#if CONFIG_IS_ENABLED(NET_LEGACY) || CONFIG_IS_ENABLED(NET_LWIP)
 /**
  * eth_set_enable_bootdevs() - Enable or disable binding of Ethernet bootdevs
  *
@@ -485,7 +485,7 @@ int net_init(void);
 /* Called when a network operation fails to know if it should be re-tried */
 int net_start_again(void);
 
-/* NET compatibility */
+/* NET_LEGACY compatibility */
 enum proto_t;
 int net_loop(enum proto_t protocol);
 
diff --git a/include/net-legacy.h b/include/net-legacy.h
index d489c2480cd..d3b122c9062 100644
--- a/include/net-legacy.h
+++ b/include/net-legacy.h
@@ -281,7 +281,7 @@ extern struct in_addr net_dns_server2;
 #endif
 extern char	net_nis_domain[32];	/* Our IS domain */
 extern char	net_hostname[32];	/* Our hostname */
-#ifdef CONFIG_NET
+#ifdef CONFIG_NET_LEGACY
 extern char	net_root_path[CONFIG_BOOTP_MAX_ROOT_PATH_LEN];	/* Our root path */
 #endif
 /** END OF BOOTP EXTENTIONS **/
diff --git a/lib/Kconfig b/lib/Kconfig
index 4e6a0c6a1b6..b2ffa2c4ef2 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -285,7 +285,7 @@ config PANIC_HANG
 
 config REGEX
 	bool "Enable regular expression support"
-	default y if NET
+	default y if NET_LEGACY
 	help
 	  If this variable is defined, U-Boot is linked against the
 	  SLRE (Super Light Regular Expression) library, which adds
diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
index b5f81e0ff53..495a85fa869 100644
--- a/lib/efi_loader/Kconfig
+++ b/lib/efi_loader/Kconfig
@@ -517,7 +517,7 @@ config EFI_RISCV_BOOT_PROTOCOL
 config EFI_IP4_CONFIG2_PROTOCOL
 	bool "EFI_IP4_CONFIG2_PROTOCOL support"
 	default y if ARCH_QEMU || SANDBOX
-	depends on NET || NET_LWIP
+	depends on NET_LEGACY || NET_LWIP
 	help
 	  Provides an implementation of the EFI_IP4_CONFIG2_PROTOCOL, this
 	  protocol can be used to set and get the current ip address and
@@ -599,7 +599,7 @@ config EFI_BOOTMGR
 
 config EFI_HTTP_BOOT
 	bool "EFI HTTP Boot support"
-	depends on NET || NET_LWIP
+	depends on NET_LEGACY || NET_LWIP
 	select CMD_NET
 	select CMD_DHCP
 	select CMD_DNS
diff --git a/net/Kconfig b/net/Kconfig
index 249c27c115d..89d949b5f2c 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -6,14 +6,14 @@ menu "Networking"
 
 choice
 	prompt "Networking stack"
-	default NET
+	default NET_LEGACY
 
 config NO_NET
 	bool "No networking support"
 	help
 	  Do not include networking support
 
-config NET
+config NET_LEGACY
 	bool "Legacy U-Boot networking stack"
 	select NETDEVICES
 	help
@@ -27,14 +27,14 @@ config NET_LWIP
 	  Include networking support based on the lwIP (lightweight IP)
 	  TCP/IP stack (https://nongnu.org/lwip). This is a replacement for
 	  the default U-Boot network stack and applications located in net/
-	  and enabled via CONFIG_NET as well as other pieces of code that
-	  depend on CONFIG_NET (such as cmd/net.c enabled via CONFIG_CMD_NET).
-	  Therefore the two symbols CONFIG_NET and CONFIG_NET_LWIP are mutually
+	  and enabled via CONFIG_NET_LEGACY as well as other pieces of code that
+	  depend on CONFIG_NET_LEGACY (such as cmd/net.c enabled via CONFIG_CMD_NET).
+	  Therefore the two symbols CONFIG_NET_LEGACY and CONFIG_NET_LWIP are mutually
 	  exclusive.
 
 endchoice
 
-if NET
+if NET_LEGACY
 
 config ARP_TIMEOUT
 	int "Milliseconds before trying ARP again"
@@ -227,11 +227,11 @@ config IPV6
 	  ip6addr, serverip6. If a u-boot command is capable to parse an IPv6
 	  address and find it, it will force using IPv6 in the network stack.
 
-endif   # if NET
+endif   # if NET_LEGACY
 
 source "net/lwip/Kconfig"
 
-if NET || NET_LWIP
+if NET_LEGACY || NET_LWIP
 
 config BOOTDEV_ETH
 	bool "Enable bootdev for ethernet"
@@ -260,7 +260,7 @@ config DNS
 
 config WGET
 	bool "Enable wget"
-	select PROT_TCP if NET
+	select PROT_TCP if NET_LEGACY
 	select PROT_TCP_LWIP if NET_LWIP
 	help
 	  Selecting this will enable wget, an interface to send HTTP requests
@@ -276,7 +276,7 @@ config TFTP_BLOCKSIZE
 	  almost-MTU block sizes.
 	  You can also activate CONFIG_IP_DEFRAG to set a larger block.
 
-endif   # if NET || NET_LWIP
+endif   # if NET_LEGACY || NET_LWIP
 
 config SYS_RX_ETH_BUFFER
         int "Number of receive packet buffers"
diff --git a/net/Makefile b/net/Makefile
index 3a32bc8b0e7..a9323ceb40b 100644
--- a/net/Makefile
+++ b/net/Makefile
@@ -5,9 +5,9 @@
 
 #ccflags-y += -DDEBUG
 
-ifeq ($(CONFIG_NET),y)
+ifeq ($(CONFIG_NET_LEGACY),y)
 
-obj-$(CONFIG_NET)      += arp.o
+obj-$(CONFIG_NET_LEGACY)      += arp.o
 obj-$(CONFIG_CMD_BOOTP) += bootp.o
 obj-$(CONFIG_CMD_CDP)  += cdp.o
 obj-$(CONFIG_DNS)  += dns.o
@@ -37,7 +37,7 @@ CFLAGS_eth_common.o += -Wno-format-extra-args
 
 endif
 
-ifeq ($(filter y,$(CONFIG_NET) $(CONFIG_NET_LWIP)),y)
+ifeq ($(filter y,$(CONFIG_NET_LEGACY) $(CONFIG_NET_LWIP)),y)
 obj-$(CONFIG_DM_DSA)   += dsa-uclass.o
 obj-$(CONFIG_$(PHASE_)DM_ETH) += eth-uclass.o
 obj-$(CONFIG_$(PHASE_)BOOTDEV_ETH) += eth_bootdev.o
diff --git a/test/cmd/Makefile b/test/cmd/Makefile
index 8c9f112782d..5f2815b1bb6 100644
--- a/test/cmd/Makefile
+++ b/test/cmd/Makefile
@@ -39,7 +39,7 @@ obj-$(CONFIG_CMD_PWM) += pwm.o
 obj-$(CONFIG_CMD_READ) += rw.o
 obj-$(CONFIG_CMD_SETEXPR) += setexpr.o
 obj-$(CONFIG_CMD_TEMPERATURE) += temperature.o
-ifdef CONFIG_NET
+ifdef CONFIG_NET_LEGACY
 obj-$(CONFIG_CMD_WGET) += wget.o
 endif
 obj-$(CONFIG_ARM_FFA_TRANSPORT) += armffa.o
diff --git a/test/cmd/bdinfo.c b/test/cmd/bdinfo.c
index c3a3519d16d..3233a0a6a51 100644
--- a/test/cmd/bdinfo.c
+++ b/test/cmd/bdinfo.c
@@ -172,7 +172,7 @@ static int bdinfo_test_all(struct unit_test_state *uts)
 	ut_assertok(test_num_l(uts, "reloc off", gd->reloc_off));
 	ut_assert_nextline("%-12s= %u-bit", "Build", (uint)sizeof(void *) * 8);
 
-	if (IS_ENABLED(CONFIG_NET) || IS_ENABLED(CONFIG_NET_LWIP))
+	if (IS_ENABLED(CONFIG_NET_LEGACY) || IS_ENABLED(CONFIG_NET_LWIP))
 		ut_assertok(test_eth(uts));
 
 	/*
@@ -314,7 +314,7 @@ static int bdinfo_test_help(struct unit_test_state *uts)
 			ut_assert_nextlinen("bdinfo -a");
 		ut_assert_nextlinen("  - print all Board Info structure");
 		if (CONFIG_IS_ENABLED(GETOPT)) {
-			if (IS_ENABLED(CONFIG_NET) || IS_ENABLED(CONFIG_NET_LWIP)) {
+			if (IS_ENABLED(CONFIG_NET_LEGACY) || IS_ENABLED(CONFIG_NET_LWIP)) {
 				ut_assert_nextlinen("bdinfo -e");
 				ut_assert_nextlinen("  - print Board Info related to network");
 			}
@@ -348,7 +348,7 @@ static int bdinfo_test_eth(struct unit_test_state *uts)
 	ut_assertok(run_commandf("bdinfo -e"));
 	if (!CONFIG_IS_ENABLED(GETOPT))
 		ut_assertok(bdinfo_test_all(uts));
-	else if (IS_ENABLED(CONFIG_NET) || IS_ENABLED(CONFIG_NET_LWIP))
+	else if (IS_ENABLED(CONFIG_NET_LEGACY) || IS_ENABLED(CONFIG_NET_LWIP))
 		ut_assertok(test_eth(uts));
 	ut_assert_console_end();
 
diff --git a/test/dm/eth.c b/test/dm/eth.c
index 1087ae9572d..ed0b57d8861 100644
--- a/test/dm/eth.c
+++ b/test/dm/eth.c
@@ -449,7 +449,7 @@ static int dm_test_net_retry(struct unit_test_state *uts)
 }
 DM_TEST(dm_test_net_retry, UTF_SCAN_FDT);
 
-#if CONFIG_IS_ENABLED(NET)
+#if CONFIG_IS_ENABLED(NET_LEGACY)
 static int sb_check_arp_reply(struct udevice *dev, void *packet,
 			      unsigned int len)
 {
@@ -517,7 +517,7 @@ static int sb_with_async_arp_handler(struct udevice *dev, void *packet,
 }
 #endif
 
-#if CONFIG_IS_ENABLED(NET)
+#if CONFIG_IS_ENABLED(NET_LEGACY)
 static int dm_test_eth_async_arp_reply(struct unit_test_state *uts)
 {
 	net_ping_ip = string_to_ip("1.1.2.2");
@@ -537,7 +537,7 @@ static int dm_test_eth_async_arp_reply(struct unit_test_state *uts)
 DM_TEST(dm_test_eth_async_arp_reply, UTF_SCAN_FDT);
 #endif
 
-#if CONFIG_IS_ENABLED(NET)
+#if CONFIG_IS_ENABLED(NET_LEGACY)
 static int sb_check_ping_reply(struct udevice *dev, void *packet,
 			       unsigned int len)
 {
diff --git a/test/py/tests/test_efi_fit.py b/test/py/tests/test_efi_fit.py
index 63ee8e6cef2..409cfdfd56f 100644
--- a/test/py/tests/test_efi_fit.py
+++ b/test/py/tests/test_efi_fit.py
@@ -225,7 +225,7 @@ def test_efi_fit_launch(ubman):
 
         has_dhcp = ubman.config.buildconfig.get('config_cmd_dhcp', 'n') == 'y'
         if not has_dhcp:
-            ubman.log.warning('CONFIG_NET != y: Skipping static network setup')
+            ubman.log.warning('CONFIG_NET_LEGACY != y: Skipping static network setup')
             return False
 
         env_vars = ubman.config.env.get('env__net_static_env_vars', None)
diff --git a/test/py/tests/test_efi_loader.py b/test/py/tests/test_efi_loader.py
index dc58c0d4dbd..fc45209a581 100644
--- a/test/py/tests/test_efi_loader.py
+++ b/test/py/tests/test_efi_loader.py
@@ -98,7 +98,7 @@ def test_efi_setup_dhcp(ubman):
     global net_set_up
     net_set_up = True
 
-@pytest.mark.buildconfigspec('net', 'net_lwip')
+@pytest.mark.buildconfigspec('net_legacy', 'net_lwip')
 def test_efi_setup_static(ubman):
     """Set up the network using a static IP configuration.
 
diff --git a/test/py/tests/test_fpga.py b/test/py/tests/test_fpga.py
index 299a8653f74..0ab47c0bde5 100644
--- a/test/py/tests/test_fpga.py
+++ b/test/py/tests/test_fpga.py
@@ -506,7 +506,7 @@ def test_fpga_loadfs(ubman):
 @pytest.mark.buildconfigspec('cmd_fpga_load_secure')
 @pytest.mark.buildconfigspec('cmd_net')
 @pytest.mark.buildconfigspec('cmd_dhcp')
-@pytest.mark.buildconfigspec('net', 'net_lwip')
+@pytest.mark.buildconfigspec('net_legacy', 'net_lwip')
 def test_fpga_secure_bit_auth(ubman):
 
     test_net.test_net_dhcp(ubman)
@@ -534,7 +534,7 @@ def test_fpga_secure_bit_auth(ubman):
 @pytest.mark.buildconfigspec('cmd_fpga_load_secure')
 @pytest.mark.buildconfigspec('cmd_net')
 @pytest.mark.buildconfigspec('cmd_dhcp')
-@pytest.mark.buildconfigspec('net', 'net_lwip')
+@pytest.mark.buildconfigspec('net_legacy', 'net_lwip')
 def test_fpga_secure_bit_img_auth_kup(ubman):
 
     test_net.test_net_dhcp(ubman)
diff --git a/test/py/tests/test_net.py b/test/py/tests/test_net.py
index 6ef02e53389..4f899530060 100644
--- a/test/py/tests/test_net.py
+++ b/test/py/tests/test_net.py
@@ -201,7 +201,7 @@ def test_net_dhcp6(ubman):
     global net6_set_up
     net6_set_up = True
 
-@pytest.mark.buildconfigspec('net', 'net_lwip')
+@pytest.mark.buildconfigspec('net_legacy', 'net_lwip')
 def test_net_setup_static(ubman):
     """Set up a static IP configuration.
 

-- 
2.53.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
