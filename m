Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN7mFnNS52mn6gEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2026 12:33:23 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03952439955
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2026 12:33:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9739AC8F275;
	Tue, 21 Apr 2026 10:33:22 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A57A6C8F274
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1776767522; x=1777372322; i=xypron.glpk@gmx.de;
 bh=8xNFAn7MIQPylTVh6diuDjgBIl+Xr2Cbnji/q8ZfF/E=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DB+ohToWTL3qQZbpIWGbr7Sj9GQL2czFXzzmh9+Nga+DvF57CZW6ruYaR2kw7HL9
 oBVIq4FdghyiSu/+uv+lUrX+eT+OzWd2kx5ETWvcvL8sOPj5vEwMTQ7rxYDeb1S6G
 RNUT5+a32QnUTnBvNPoleA9Ug3dcfh5TDg4FGHlXusUHf14T/aX1h5LMTxy+E1EmB
 g5kNAyq81lRADLY34DuWD79OWg1nXduU8gXRzT+DOv3SiOaySSZOyqw2npbnF3Q0H
 SF+CN/vkajmze5fcXuhyp0Z7wRI25OFvUUBTYvxFgkj+wkfg6eO2Vm7xRwPpvqOYP
 n80wtBxRt8LExWcafA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89Gt-1wIguA1wg7-00BErg; Tue, 21
 Apr 2026 12:32:02 +0200
Date: Tue, 21 Apr 2026 12:31:30 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Quentin Schulz <foss+uboot@0leil.net>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Paul Barker <paul.barker.ct@bp.renesas.com>
User-Agent: Thunderbird for Android
In-Reply-To: <4bc9cdaf-38bc-4edf-b19f-d7301c84b49c@cherry.de>
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
 <20260420-net-kconfig-v1-3-9900002d8e72@cherry.de>
 <18031190-2B66-4DEF-8382-6CB9DCCFA3A1@gmx.de>
 <4bc9cdaf-38bc-4edf-b19f-d7301c84b49c@cherry.de>
Message-ID: <F8BBB1E8-BD83-4D66-9D27-6C109ADCCB63@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1FZkZEMrGCy4Jj1S/4e1P9sX2e3Az9RpnAjbFZ973p8AzwHq1Ki
 3woaf7djBzQTtv55BErwRt2gne+g+S3t2CWM21q2W8fkp245fr2usrTx5P4iXXzX8mujIVe
 YRt1jLoA70z0xg45rIZ6erzI1Afc4pvfzMSKVxp35nvfY74dPirVP5HRxSErjeCYoKphlxe
 SP0cuc8B1/QFKoVB97RjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:l9t6g3ROakY=;OM2HATVPdAR3mEbf8sb6P1Xtw8e
 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
 JO72og==
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
 Sughosh Ganu <sughosh.ganu@arm.com>, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tom Rini <trini@konsulko.com>, Udit Kumar <u-kumar1@ti.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
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
	FORGED_RECIPIENTS(0.00)[m:quentin.schulz@cherry.de,m:foss+uboot@0leil.net,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:paul.barker.ct@bp.renesas.com,m:peng.fan@nxp.com,m:mkorpershoek@kernel.org,m:jan.kiszka@siemens.com,m:alvin@pqrs.dk,m:jerome.forissier@arm.com,m:neil.armstrong@linaro.org,m:lukma@denx.de,m:s-vadapalli@ti.com,m:dlechner@baylibre.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:i@shantur.com,m:c-vankar@ti.com,m:anshuld@ti.com,m:mingkai.hu@nxp.com,m:dannenberg@ti.com,m:hs@nabladev.com,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:padmarao.begari@amd.com,m:bb@ti.com,m:alice.guo@nxp.com,m:kever.yang@rock-chips.com,m:dev@benjarobin.fr,m:lucienzx159@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:SkyLake.Huang@mediatek.com,m:andre.przywara@arm.com,m:ansuelsmth@gmail.com,m:cniedermaier@dh-electronics.com,m:seanedmond@microsoft.com,m:tien.fong.chee@altera.com,m:msp@baylibre.com,m:Max.Merchel@ew.tq-group.com,m:s
 emen.protsenko@linaro.org,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:mikhail.kshevetskiy@iopsys.eu,m:briansune@gmail.com,m:ycliang@andestech.com,m:m.schwan@phytec.de,m:dimorinny@google.com,m:sughosh.ganu@arm.com,m:sr@denx.de,m:festevam@gmail.com,m:vigneshr@ti.com,m:trini@konsulko.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:michal.simek@amd.com,m:le.jin@siemens.com,m:abbaraju.manojsai@amarulasolutions.com,m:jonas@kwiboo.se,m:tharvey@gateworks.com,m:Maarten.Brock@sttls.nl,m:mbrugger@suse.com,m:francesco.dolcini@toradex.com,m:robert.marko@sartura.hr,m:aford173@gmail.com,m:j-choudhary@ti.com,m:vaishnav.a@ti.com,m:gchan9527@gmail.com,m:sjg@chromium.org,m:ariel.dalessandro@collabora.com,m:seashell11234455@gmail.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:marex@denx.de,m:weijie.gao@mediatek.com,m:ben.dooks@codethink.co.uk,m:balaji.selvanathan@oss.qualcomm.com,m:pbrobinson@gmail.com,m:B.Hahn@phytec.de,m:matteo.lisi@engicam.com,m:adrianox@gmail.com,m:root@infi.wa
 ng,m:jstephan@baylibre.com,m:kory.maincent@bootlin.com,m:martyn.welch@collabora.com,m:afd@ti.com,m:alchark@gmail.com,m:pramod.kumar_1@nxp.com,m:patrick.delaunay@foss.st.com,m:h-salunke@ti.com,m:foss@0leil.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:-];
	RCPT_COUNT_GT_50(0.00)[90];
	NEURAL_HAM(-0.00)[-0.984];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[xypron.glpk@gmx.de,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,siemens.com,pqrs.dk,arm.com,linaro.org,denx.de,ti.com,baylibre.com,mailbox.org,shantur.com,nabladev.com,gmail.com,amd.com,rock-chips.com,benjarobin.fr,amarulasolutions.com,mediatek.com,dh-electronics.com,microsoft.com,altera.com,ew.tq-group.com,iopsys.eu,andestech.com,phytec.de,google.com,konsulko.com,bootlin.com,kwiboo.se,gateworks.com,sttls.nl,suse.com,toradex.com,sartura.hr,chromium.org,collabora.com,ziyao.cc,codethink.co.uk,oss.qualcomm.com,engicam.com,infi.wang,foss.st.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,uboot,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:email,st-md-mailman.stormreply.com:rdns,cherry.de:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 03952439955
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am 21. April 2026 10:37:54 MESZ schrieb Quentin Schulz <quentin.schulz@cherry.de>:
>Hi Heinrich,
>
>On 4/20/26 10:24 PM, Heinrich Schuchardt wrote:
>> Am 20. April 2026 13:36:09 MESZ schrieb Quentin Schulz <foss+uboot@0leil.net>:
>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>> 
>>> This will allow a bunch of simplifications across the code base.
>>> Disabling NET is the equivalent of today's NO_NET choice. This means
>>> that if NET is enabled, either the legacy or lwIP stack is necessarily
>>> selected, which allows us to simplify if NET_LEGACY || NET_LWIP into
>>> if NET in a later commit.
>>> 
>>> Config fragments - or defconfigs including other defconfigs - setting
>>> the network stack (NET_LEGACY or NET_LWIP) must also set NET (or unset
>>> NO_NET) if the config they apply to - or the included defconfigs -
>>> unsets NET (or selects NO_NET) as otherwise the NET_LEGACY and NET_LWIP
>>> symbols are unreachable. This is the case for the two defconfig modified
>>> in this commit.
>>> 
>>> NO_NET is now a convenience symbol which hides NET entirely to avoid
>>> modifying many defconfigs. If one selected NO_NET to disable the
>>> networking stack in the past, this will still work for now. Technically,
>>> we should be using the "transitional" Kconfig attribute but that is only
>>> available since Kconfig from Linux kernel v6.18 and we're on 6.1 right
>>> now.
>>> 
>>> Note that this moves CONFIG_SYS_RX_ETH_BUFFER from under the Network
>>> menu back into the main menu as it seems like it needs to be defined
>>> even when there's no need for NET support at all and menuconfig option
>>> doesn't work the same way as a menu.
>>> 
>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>> ---
>>> 
>>> I'd say we should have everything net-related depends on NET as well,
>>> so that disabling networking support with NET=n is also disabling
>>> anything related (e.g. Ethernet controller and PHY drivers, USB
>>> Ethernet, USB gadget CDC/RNDIS, network CLI commands, etc.).
>>> ---
>>> configs/am62px_evm_r5_ethboot_defconfig |  2 +-
>>> configs/j722s_evm_r5_ethboot_defconfig  |  2 +-
>>> net/Kconfig                             | 23 ++++++++++++-----------
>>> 3 files changed, 14 insertions(+), 13 deletions(-)
>>> 
>>> diff --git a/configs/am62px_evm_r5_ethboot_defconfig b/configs/am62px_evm_r5_ethboot_defconfig
>>> index 8baec9d43ff..df49324b25a 100644
>>> --- a/configs/am62px_evm_r5_ethboot_defconfig
>>> +++ b/configs/am62px_evm_r5_ethboot_defconfig
>>> @@ -5,7 +5,7 @@ CONFIG_ARCH_K3=y
>>> CONFIG_SOC_K3_AM62P5=y
>>> CONFIG_TARGET_AM62P5_R5_EVM=y
>>> CONFIG_DEFAULT_DEVICE_TREE="k3-am62p5-r5-sk"
>>> -CONFIG_NET_LEGACY=y
>>> +# CONFIG_NO_NET is not set
>> 
>> Does this imply that NET_LEGACY is the default? Choosing LEGACY as default would not be plausible to me. We should use LWIP as default. Then every new board will use it, hopefully.
>> 
>
>(below, "current" means the value in master branch, so before this series is applied).
>
>(current) CONFIG_NET is the default already, see https://source.denx.de/u-boot/u-boot/-/blob/master/Kconfig#L794-L824. This series does not aim to change anything but the name of the symbols. Yes, we could make NET_LWIP the new default stack, but not in this series. Also, we have an issue that if you enable SPL_NET you need the legacy stack, even in proper (according to https://source.denx.de/u-boot/u-boot/-/blob/master/common/spl/Kconfig#L1152-L1154). So we would need to tackle this first (we don't necessarily need to support lwIP in SPL, just that the choice in SPL shouldn't impact the choice in proper).
>
>If you're asking about this defconfig specifically, it's simply because it is not a typical defconfig. It includes configs/am62px_evm_r5_defconfig which sets CONFIG_NO_NET=y. Because NO_NET used to (before this series) be a choice with (current) NET and NET_LWIP, am62px_evm_r5_ethboot_defconfig needed to override it with another choice, namely (current) NET. Because NET_LEGACY is automatically selected when NO_NET is unset (due to NET default y), we only need to unset NO_NET in configs/am62px_evm_r5_ethboot_defconfig to restore the current state of enabling the legacy stack (current NET, now NET_LEGACY). This is not changing anything, just moving things around.
>
>Does this answer your question?
>
>Cheers,
>Quentin


Acked-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
