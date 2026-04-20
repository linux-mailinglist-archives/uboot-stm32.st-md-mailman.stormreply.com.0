Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPH3FrqI72mtCQEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2026 18:03:06 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC1C475E9F
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2026 18:03:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00F09C7A837;
	Mon, 27 Apr 2026 15:56:05 +0000 (UTC)
Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch
 [83.166.143.173])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0F4FC56612
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 11:36:51 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6b])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fzk3R3cChz1C3v;
 Mon, 20 Apr 2026 13:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
 s=20231125; t=1776685009;
 bh=sMhlt6JOPSP6rQAmuvvk6YnnTwj4XeAR93xEmHCzgbQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JSUUqbqKlAjLt0VBKPOWblqvm1FsLrzkiXgBCbR8/F1AcrA0DvuyoxYez2bma+cKa
 uDPXD6DYMr5X8rK/bIkQG7D6mQjY8+XYN+VLSU3s2853NC6aYF7DuB8Tao9D1CHHZ6
 PYTDmGnjuzx/VteIi6OgWOjMSUO4/2SgCbX73NXgKK1DseLO2vu+Hf6u3oirBt2hnh
 4t2ARN91McAm/nC6Cpq6CvHgg+diFRBFAMDr14iYaIbHkXGtkdKW/neaPETXsVbinA
 4A3yuXeB9urL0t5KczxhRlDvf/B2gUJIVUIyPhmYdT3zMnnWfe4D+JYq5/IZ0y1VYz
 KIt2FbDJ0pBog==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fzk3H1ZdLzVpn; Mon, 20 Apr 2026 13:36:43 +0200 (CEST)
From: Quentin Schulz <foss+uboot@0leil.net>
Date: Mon, 20 Apr 2026 13:36:09 +0200
MIME-Version: 1.0
Message-Id: <20260420-net-kconfig-v1-3-9900002d8e72@cherry.de>
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
Subject: [Uboot-stm32] [PATCH 3/6] net: make NET a menuconfig (and downgrade
 NO_NET to a simple config)
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
X-Rspamd-Queue-Id: 3EC1C475E9F
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
	NEURAL_HAM(-0.00)[-0.776];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Spam: Yes

From: Quentin Schulz <quentin.schulz@cherry.de>

This will allow a bunch of simplifications across the code base.
Disabling NET is the equivalent of today's NO_NET choice. This means
that if NET is enabled, either the legacy or lwIP stack is necessarily
selected, which allows us to simplify if NET_LEGACY || NET_LWIP into
if NET in a later commit.

Config fragments - or defconfigs including other defconfigs - setting
the network stack (NET_LEGACY or NET_LWIP) must also set NET (or unset
NO_NET) if the config they apply to - or the included defconfigs -
unsets NET (or selects NO_NET) as otherwise the NET_LEGACY and NET_LWIP
symbols are unreachable. This is the case for the two defconfig modified
in this commit.

NO_NET is now a convenience symbol which hides NET entirely to avoid
modifying many defconfigs. If one selected NO_NET to disable the
networking stack in the past, this will still work for now. Technically,
we should be using the "transitional" Kconfig attribute but that is only
available since Kconfig from Linux kernel v6.18 and we're on 6.1 right
now.

Note that this moves CONFIG_SYS_RX_ETH_BUFFER from under the Network
menu back into the main menu as it seems like it needs to be defined
even when there's no need for NET support at all and menuconfig option
doesn't work the same way as a menu.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---

I'd say we should have everything net-related depends on NET as well,
so that disabling networking support with NET=n is also disabling
anything related (e.g. Ethernet controller and PHY drivers, USB
Ethernet, USB gadget CDC/RNDIS, network CLI commands, etc.).
---
 configs/am62px_evm_r5_ethboot_defconfig |  2 +-
 configs/j722s_evm_r5_ethboot_defconfig  |  2 +-
 net/Kconfig                             | 23 ++++++++++++-----------
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/configs/am62px_evm_r5_ethboot_defconfig b/configs/am62px_evm_r5_ethboot_defconfig
index 8baec9d43ff..df49324b25a 100644
--- a/configs/am62px_evm_r5_ethboot_defconfig
+++ b/configs/am62px_evm_r5_ethboot_defconfig
@@ -5,7 +5,7 @@ CONFIG_ARCH_K3=y
 CONFIG_SOC_K3_AM62P5=y
 CONFIG_TARGET_AM62P5_R5_EVM=y
 CONFIG_DEFAULT_DEVICE_TREE="k3-am62p5-r5-sk"
-CONFIG_NET_LEGACY=y
+# CONFIG_NO_NET is not set
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_DMA=y
 CONFIG_SPL_ENV_SUPPORT=y
diff --git a/configs/j722s_evm_r5_ethboot_defconfig b/configs/j722s_evm_r5_ethboot_defconfig
index e4682edb455..cc71f913d3c 100644
--- a/configs/j722s_evm_r5_ethboot_defconfig
+++ b/configs/j722s_evm_r5_ethboot_defconfig
@@ -5,7 +5,7 @@ CONFIG_ARCH_K3=y
 CONFIG_SOC_K3_J722S=y
 CONFIG_TARGET_J722S_R5_EVM=y
 CONFIG_DEFAULT_DEVICE_TREE="k3-j722s-r5-evm"
-CONFIG_NET_LEGACY=y
+# CONFIG_NO_NET is not set
 CONFIG_SPL_DRIVERS_MISC=y
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_DMA=y
diff --git a/net/Kconfig b/net/Kconfig
index 89d949b5f2c..e712a0dd2ac 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -2,17 +2,22 @@
 # Network configuration
 #
 
-menu "Networking"
+config NO_NET
+	bool "Disable networking"
+	help
+	  Transitional variable. Equivalent to setting NET=n.
+
+menuconfig NET
+	bool "Networking"
+	depends on !NO_NET
+	default y
+
+if NET
 
 choice
 	prompt "Networking stack"
 	default NET_LEGACY
 
-config NO_NET
-	bool "No networking support"
-	help
-	  Do not include networking support
-
 config NET_LEGACY
 	bool "Legacy U-Boot networking stack"
 	select NETDEVICES
@@ -231,8 +236,6 @@ endif   # if NET_LEGACY
 
 source "net/lwip/Kconfig"
 
-if NET_LEGACY || NET_LWIP
-
 config BOOTDEV_ETH
 	bool "Enable bootdev for ethernet"
 	depends on BOOTSTD
@@ -276,7 +279,7 @@ config TFTP_BLOCKSIZE
 	  almost-MTU block sizes.
 	  You can also activate CONFIG_IP_DEFRAG to set a larger block.
 
-endif   # if NET_LEGACY || NET_LWIP
+endif   # if NET
 
 config SYS_RX_ETH_BUFFER
         int "Number of receive packet buffers"
@@ -286,5 +289,3 @@ config SYS_RX_ETH_BUFFER
           controllers it is recommended to set this value to 8 or even higher,
           since all buffers can be full shortly after enabling the interface on
           high Ethernet traffic.
-
-endmenu

-- 
2.53.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
