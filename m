Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAKzIoqM5mmryAEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 22:28:58 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21991433BD5
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 22:28:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5018DC57A51;
	Mon, 20 Apr 2026 20:28:57 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B219CC56600
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1776716823; x=1777321623; i=xypron.glpk@gmx.de;
 bh=9qtUMKQFeKQ42GCQ9iJiLXbHUhxtANzjQMUWDWswegE=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tV7R/hD1kkkkliOocVkSXILyxAxkRkIODoavg9pdM0qPgRjAqnJkMJFvvBSM47a2
 1mEb9ipTIvwJnc4UuRQpiTStXMkN9+YKzIF2ModiHYRkrMnl6woxo7Ra+RTAJuhAW
 4Ywq2iTXEI6NSRm2Jafg3D6cbD4+fg23UD0auC/sbbWyGaL0uOoWfCKQZESXhPyBV
 H+VeiPugXKBkAb79G7D7zYI4IkN97ZJd/iD9Z+VJ/HnaxRE1KmS6acTe03TKRKw9D
 U9TXzuRUzT3asKqStuPMUCWSJTIckulPUdQwzTdbmx5KClgLFKmJtIAIcYO8D71hL
 4Z6+qls4x+Nq+fJcfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbRm-1wB73g3sQo-003ahq; Mon, 20
 Apr 2026 22:27:03 +0200
Date: Mon, 20 Apr 2026 22:24:48 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Quentin Schulz <foss+uboot@0leil.net>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Paul Barker <paul.barker.ct@bp.renesas.com>
User-Agent: Thunderbird for Android
In-Reply-To: <20260420-net-kconfig-v1-3-9900002d8e72@cherry.de>
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
 <20260420-net-kconfig-v1-3-9900002d8e72@cherry.de>
Message-ID: <18031190-2B66-4DEF-8382-6CB9DCCFA3A1@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:xHByMy9Ja4wdTxfxkuIBnccoTecaDz3eQULuxnvXVmoIcgQpsmd
 7thJp8H/tnPGq0PNPIlt1WCiMJIK74xXiKrLtGsTNIwniffaoAe35+oQ1KDjVZu6/TQcJe6
 ZjDODhEqqfNM2mB/FPfdMg4Ew6+dkpsz9+2oYhA423KbRbfgHYE+V8LemHKTC8i6KGmGHnm
 j5rkG8BFIAaHdl/lZBLCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rZRGvyzcuMk=;yPyb4dnPCd9Pg/uFF842RBZVj1Z
 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
 no84tvkKdGQpVgRNLd9TfS9pz3y8P3d7WRJk=
Cc: Peng Fan <peng.fan@nxp.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
 Jerome Forissier <jerome.forissier@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 David Lechner <dlechner@baylibre.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 Shantur Rathore <i@shantur.com>, Chintan Vankar <c-vankar@ti.com>,
 Anshul Dalal <anshuld@ti.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Andreas Dannenberg <dannenberg@ti.com>, Heiko Schocher <hs@nabladev.com>,
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
 Max Merchel <Max.Merchel@ew.tq-group.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Brian Sune <briansune@gmail.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Martin Schwan <m.schwan@phytec.de>, Dmitrii Merkurev <dimorinny@google.com>,
 Sughosh Ganu <sughosh.ganu@arm.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tom Rini <trini@konsulko.com>,
 Udit Kumar <u-kumar1@ti.com>, Romain Gantois <romain.gantois@bootlin.com>,
 Michal Simek <michal.simek@amd.com>, Le Jin <le.jin@siemens.com>,
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
Subject: Re: [Uboot-stm32] [PATCH 3/6] net: make NET a menuconfig (and
 downgrade NO_NET to a simple config)
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
X-Spamd-Result: default: False [4.80 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[gmx.de : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmx.de:s=s31663417];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[xypron.glpk@gmx.de,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_RECIPIENTS(0.00)[m:foss+uboot@0leil.net,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:paul.barker.ct@bp.renesas.com,m:peng.fan@nxp.com,m:mkorpershoek@kernel.org,m:jan.kiszka@siemens.com,m:alvin@pqrs.dk,m:jerome.forissier@arm.com,m:neil.armstrong@linaro.org,m:lukma@denx.de,m:s-vadapalli@ti.com,m:dlechner@baylibre.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:i@shantur.com,m:c-vankar@ti.com,m:anshuld@ti.com,m:mingkai.hu@nxp.com,m:dannenberg@ti.com,m:hs@nabladev.com,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:padmarao.begari@amd.com,m:bb@ti.com,m:alice.guo@nxp.com,m:kever.yang@rock-chips.com,m:dev@benjarobin.fr,m:lucienzx159@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:SkyLake.Huang@mediatek.com,m:andre.przywara@arm.com,m:ansuelsmth@gmail.com,m:cniedermaier@dh-electronics.com,m:seanedmond@microsoft.com,m:tien.fong.chee@altera.com,m:msp@baylibre.com,m:Max.Merchel@ew.tq-group.com,m:semen.protsenko@linaro.org,m
 :andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:mikhail.kshevetskiy@iopsys.eu,m:briansune@gmail.com,m:ycliang@andestech.com,m:m.schwan@phytec.de,m:dimorinny@google.com,m:sughosh.ganu@arm.com,m:quentin.schulz@cherry.de,m:sr@denx.de,m:festevam@gmail.com,m:vigneshr@ti.com,m:trini@konsulko.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:michal.simek@amd.com,m:le.jin@siemens.com,m:abbaraju.manojsai@amarulasolutions.com,m:jonas@kwiboo.se,m:tharvey@gateworks.com,m:Maarten.Brock@sttls.nl,m:mbrugger@suse.com,m:francesco.dolcini@toradex.com,m:robert.marko@sartura.hr,m:aford173@gmail.com,m:j-choudhary@ti.com,m:vaishnav.a@ti.com,m:gchan9527@gmail.com,m:sjg@chromium.org,m:ariel.dalessandro@collabora.com,m:seashell11234455@gmail.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:marex@denx.de,m:weijie.gao@mediatek.com,m:ben.dooks@codethink.co.uk,m:balaji.selvanathan@oss.qualcomm.com,m:pbrobinson@gmail.com,m:B.Hahn@phytec.de,m:matteo.lisi@engicam.com,m:adrianox@gmail.com,m:root@infi.wa
 ng,m:jstephan@baylibre.com,m:kory.maincent@bootlin.com,m:martyn.welch@collabora.com,m:afd@ti.com,m:alchark@gmail.com,m:pramod.kumar_1@nxp.com,m:patrick.delaunay@foss.st.com,m:h-salunke@ti.com,m:foss@0leil.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:-];
	RCPT_COUNT_GT_50(0.00)[90];
	NEURAL_HAM(-0.00)[-0.892];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[xypron.glpk@gmx.de,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,siemens.com,pqrs.dk,arm.com,linaro.org,denx.de,ti.com,baylibre.com,mailbox.org,shantur.com,nabladev.com,gmail.com,amd.com,rock-chips.com,benjarobin.fr,amarulasolutions.com,mediatek.com,dh-electronics.com,microsoft.com,altera.com,ew.tq-group.com,iopsys.eu,andestech.com,phytec.de,google.com,cherry.de,konsulko.com,bootlin.com,kwiboo.se,gateworks.com,sttls.nl,suse.com,toradex.com,sartura.hr,chromium.org,collabora.com,ziyao.cc,codethink.co.uk,oss.qualcomm.com,engicam.com,infi.wang,foss.st.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,uboot,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 21991433BD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am 20. April 2026 13:36:09 MESZ schrieb Quentin Schulz <foss+uboot@0leil.net>:
>From: Quentin Schulz <quentin.schulz@cherry.de>
>
>This will allow a bunch of simplifications across the code base.
>Disabling NET is the equivalent of today's NO_NET choice. This means
>that if NET is enabled, either the legacy or lwIP stack is necessarily
>selected, which allows us to simplify if NET_LEGACY || NET_LWIP into
>if NET in a later commit.
>
>Config fragments - or defconfigs including other defconfigs - setting
>the network stack (NET_LEGACY or NET_LWIP) must also set NET (or unset
>NO_NET) if the config they apply to - or the included defconfigs -
>unsets NET (or selects NO_NET) as otherwise the NET_LEGACY and NET_LWIP
>symbols are unreachable. This is the case for the two defconfig modified
>in this commit.
>
>NO_NET is now a convenience symbol which hides NET entirely to avoid
>modifying many defconfigs. If one selected NO_NET to disable the
>networking stack in the past, this will still work for now. Technically,
>we should be using the "transitional" Kconfig attribute but that is only
>available since Kconfig from Linux kernel v6.18 and we're on 6.1 right
>now.
>
>Note that this moves CONFIG_SYS_RX_ETH_BUFFER from under the Network
>menu back into the main menu as it seems like it needs to be defined
>even when there's no need for NET support at all and menuconfig option
>doesn't work the same way as a menu.
>
>Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>---
>
>I'd say we should have everything net-related depends on NET as well,
>so that disabling networking support with NET=n is also disabling
>anything related (e.g. Ethernet controller and PHY drivers, USB
>Ethernet, USB gadget CDC/RNDIS, network CLI commands, etc.).
>---
> configs/am62px_evm_r5_ethboot_defconfig |  2 +-
> configs/j722s_evm_r5_ethboot_defconfig  |  2 +-
> net/Kconfig                             | 23 ++++++++++++-----------
> 3 files changed, 14 insertions(+), 13 deletions(-)
>
>diff --git a/configs/am62px_evm_r5_ethboot_defconfig b/configs/am62px_evm_r5_ethboot_defconfig
>index 8baec9d43ff..df49324b25a 100644
>--- a/configs/am62px_evm_r5_ethboot_defconfig
>+++ b/configs/am62px_evm_r5_ethboot_defconfig
>@@ -5,7 +5,7 @@ CONFIG_ARCH_K3=y
> CONFIG_SOC_K3_AM62P5=y
> CONFIG_TARGET_AM62P5_R5_EVM=y
> CONFIG_DEFAULT_DEVICE_TREE="k3-am62p5-r5-sk"
>-CONFIG_NET_LEGACY=y
>+# CONFIG_NO_NET is not set

Does this imply that NET_LEGACY is the default? Choosing LEGACY as default would not be plausible to me. We should use LWIP as default. Then every new board will use it, hopefully.

Best regards

Heinrich


> CONFIG_SPL_BOARD_INIT=y
> CONFIG_SPL_DMA=y
> CONFIG_SPL_ENV_SUPPORT=y
>diff --git a/configs/j722s_evm_r5_ethboot_defconfig b/configs/j722s_evm_r5_ethboot_defconfig
>index e4682edb455..cc71f913d3c 100644
>--- a/configs/j722s_evm_r5_ethboot_defconfig
>+++ b/configs/j722s_evm_r5_ethboot_defconfig
>@@ -5,7 +5,7 @@ CONFIG_ARCH_K3=y
> CONFIG_SOC_K3_J722S=y
> CONFIG_TARGET_J722S_R5_EVM=y
> CONFIG_DEFAULT_DEVICE_TREE="k3-j722s-r5-evm"
>-CONFIG_NET_LEGACY=y
>+# CONFIG_NO_NET is not set
> CONFIG_SPL_DRIVERS_MISC=y
> CONFIG_SPL_BOARD_INIT=y
> CONFIG_SPL_DMA=y
>diff --git a/net/Kconfig b/net/Kconfig
>index 89d949b5f2c..e712a0dd2ac 100644
>--- a/net/Kconfig
>+++ b/net/Kconfig
>@@ -2,17 +2,22 @@
> # Network configuration
> #
> 
>-menu "Networking"
>+config NO_NET
>+	bool "Disable networking"
>+	help
>+	  Transitional variable. Equivalent to setting NET=n.
>+
>+menuconfig NET
>+	bool "Networking"
>+	depends on !NO_NET
>+	default y
>+
>+if NET
> 
> choice
> 	prompt "Networking stack"
> 	default NET_LEGACY
> 
>-config NO_NET
>-	bool "No networking support"
>-	help
>-	  Do not include networking support
>-
> config NET_LEGACY
> 	bool "Legacy U-Boot networking stack"
> 	select NETDEVICES
>@@ -231,8 +236,6 @@ endif   # if NET_LEGACY
> 
> source "net/lwip/Kconfig"
> 
>-if NET_LEGACY || NET_LWIP
>-
> config BOOTDEV_ETH
> 	bool "Enable bootdev for ethernet"
> 	depends on BOOTSTD
>@@ -276,7 +279,7 @@ config TFTP_BLOCKSIZE
> 	  almost-MTU block sizes.
> 	  You can also activate CONFIG_IP_DEFRAG to set a larger block.
> 
>-endif   # if NET_LEGACY || NET_LWIP
>+endif   # if NET
> 
> config SYS_RX_ETH_BUFFER
>         int "Number of receive packet buffers"
>@@ -286,5 +289,3 @@ config SYS_RX_ETH_BUFFER
>           controllers it is recommended to set this value to 8 or even higher,
>           since all buffers can be full shortly after enabling the interface on
>           high Ethernet traffic.
>-
>-endmenu
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
