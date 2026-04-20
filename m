Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF5IJuWC5mkIxgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 21:47:49 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947B4336FC
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 21:47:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 443EDC5663A;
	Mon, 20 Apr 2026 19:42:46 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 184ECC56600
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 19:42:43 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b9358dd7f79so609492066b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 12:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776714163; cv=none;
 d=google.com; s=arc-20240605;
 b=jALBd6F4pTeuXM1xnhASBSLE9O5oMXThL2vaJBSs6PeqKGWM3cDPI/S3F4W2n9cnIQ
 BxM8MXymd7DHmese33ZKs2dA+dvryl8iNMX50yY8avZw06IawMvDCetRPGFJZNIcNtbX
 MFCJS2MR9zNVZJIRIix1D3mTgmylBKxNd50u+MGxaQlZA5oQtzT9eNKR0IFiwjEnZHX8
 O0pu26mCDhwMtPSQ9rHGJxL/HJ3du83nQot38vgbJcmq3HBWUdG0HSQwecCaOSk1yq4a
 tuNQ8S034K0if+AZrBjkpd2os8/nBuMfMq8nSNuJ8AOxh6peKpJ9T7FR1XS8kopYtx0F
 j71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ypuw9PF5xi/biZOPZRabWKAPeQ6GuFoWbITRVn4TTmI=;
 fh=vFzYFU09MKsrCHKEtvaDT7ivisQnQz4YLuCWZfWTcqA=;
 b=USO9SaKYy8qazCV5uLFfPiBV4JF1ANiTaBFx3LHD6hQWyO8FfqWXF/WLciQbedkDpf
 SXVWY0tpRekwxv+tzR34rS8aKKRKUe6YpH5YXJwuKV3233/b9G+qeWiNO4fky+mUfAec
 c7AlMHp3gjzGa8Tk39fhG84iMeR8Z0iZdxO9TR9GRkk+wg/yntRanEZBhQn8SmUXxAH7
 /ZSAAlqooo4pmYgTDM/siWAqWk7mOpnnaL9yQb2PtPn1RcRaYK3S06EFTJayYS4NDmLs
 CMr3FXrDMhIC5bY0p8qfPBoaO34IxR12XIB7dz2LpmnFL/9U+dWlPJnSmo3YlSgqr2qU
 ZMbA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1776714163; x=1777318963;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ypuw9PF5xi/biZOPZRabWKAPeQ6GuFoWbITRVn4TTmI=;
 b=A8rskwKvSc2z034ivlgFwtd269uUh1ZzwysCucAIogvrmU11XP/e7uULyp3gNxHCJK
 nmTq5LkoB0rZ3ozgvlw6IBmogvNvJ4UxieE1t+1tWWaC/8mOXdfFDpXbWq/4jcg3PK8r
 eNM67oczWu/kxJk+3nIEX579bQkSBVBPXy/bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776714163; x=1777318963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ypuw9PF5xi/biZOPZRabWKAPeQ6GuFoWbITRVn4TTmI=;
 b=T7RqTw/ShVQOC9VMJHHxS2d0Az7mrbGAoI0LHf8LF+IyA01VapYlPXvL1pS/4C1Lbp
 1gZJCahlb4TBWudLP5KBIdQ8GWU4NZBCz1hmxK+slmGsSGxXl1j1OzZxKVtfdxqZso57
 3vvohzK8L5cEG2SRff2bGBqKI3bnS4nX43Hh+3GfIbL9cnWYquj6cJJlwi33BrLN0Cqf
 HJKGuDJuP0YC4QbSKvL0hfGeGHqRBQCk9BbaPDsxA+htRyYcz3VffJXP6OQlTK/lo7lD
 7QSDfH7Dn7j/zkG13hV0eXvT93gzw9fFLL+hn/GH3pPJLGM57bG6N5DZd1WD80hYdg6e
 RZdw==
X-Forwarded-Encrypted: i=1;
 AFNElJ86fCiMU8BW/TAVRiiYKydVls2LsBu08CFPaj2YSQRdCMHuJfEID5DmlxAKZr30i0iHPMDyW3AXP0mchg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxScHnieXqdKdNHVh7SV9gHDTvRZdYpn62R63TRuk5puoef5deq
 nwg3SMYPaZ7IZkQ+anQKAqdCihMifVkznn+14aV7js6KAztryudM/5ltBhed/MAMrOKMFasS3CO
 V/nBQ46YdnQKx0e0QbCpg/NEIWhyuOHFThA3KDBtO
X-Gm-Gg: AeBDietagG5ad9XeFsBQlgINevcIegdWK8wTP3P1pT8Ga5AwN1+D8omtuR8yIJph/0f
 cG7otE/YhIyFzwsoJEYnjPnQMzNtJk6sv8+QVxEsTawIb5bL9VeqmNZCPvDNomylqidPq3PVas2
 rvvQ/YXBpycCam0XbaBWlYoQLKjroLE1PGLIyy6HhmwEFFwLd2eZKqEjxg6W13SZgkZMylIjc0V
 dGLS/NYPOBOqz9slXePyw4sI6UOvrugAM81LVCEhkUH5F2OIS9BaETU1HgJGo2DwdG8seOXdkLH
 JagfkoD5zn08jJWlCVnfrEa6nNvpkq8=
X-Received: by 2002:a17:906:7946:b0:ba2:7010:c535 with SMTP id
 a640c23a62f3a-ba41c0bb9c2mr677898266b.47.1776714163159; Mon, 20 Apr 2026
 12:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
 <20260420-net-kconfig-v1-2-9900002d8e72@cherry.de>
In-Reply-To: <20260420-net-kconfig-v1-2-9900002d8e72@cherry.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Apr 2026 07:42:29 +1200
X-Gm-Features: AQROBzDznf7kDxkVeaGLIG0V-FmjUP2E_ft52nSwIy0O1aD65pjfMq1tnx7ViT8
Message-ID: <CAFLszTgZC1FGy8965pHiG-u=FhrguftRv41ghQ_Qb_RRXx6tyg@mail.gmail.com>
To: foss+uboot@0leil.net
Cc: Peng Fan <peng.fan@nxp.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
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
 u-boot@lists.denx.de, "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sky Huang <SkyLake.Huang@mediatek.com>, Adriano Cordova <adrianox@gmail.com>,
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
 Paul Barker <paul.barker.ct@bp.renesas.com>, George Chan <gchan9527@gmail.com>,
 Simon Glass <sjg@chromium.org>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Kongyang Liu <seashell11234455@gmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 uboot-stm32@st-md-mailman.stormreply.com, Marek Vasut <marex@denx.de>,
 Weijie Gao <weijie.gao@mediatek.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>, Benjamin Hahn <B.Hahn@phytec.de>,
 Matteo Lisi <matteo.lisi@engicam.com>, Andre Przywara <andre.przywara@arm.com>,
 Beiyan Yun <root@infi.wang>, Julien Stephan <jstephan@baylibre.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Martyn Welch <martyn.welch@collabora.com>, Andrew Davis <afd@ti.com>,
 Alexey Charkov <alchark@gmail.com>, Pramod Kumar <pramod.kumar_1@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Hrushikesh Salunke <h-salunke@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 2/6] rename NET to NET_LEGACY
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[chromium.org:s=google];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:foss+uboot@0leil.net,m:peng.fan@nxp.com,m:mkorpershoek@kernel.org,m:jan.kiszka@siemens.com,m:alvin@pqrs.dk,m:jerome.forissier@arm.com,m:neil.armstrong@linaro.org,m:lukma@denx.de,m:s-vadapalli@ti.com,m:dlechner@baylibre.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:i@shantur.com,m:c-vankar@ti.com,m:semen.protsenko@linaro.org,m:anshuld@ti.com,m:mingkai.hu@nxp.com,m:dannenberg@ti.com,m:hs@nabladev.com,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:padmarao.begari@amd.com,m:bb@ti.com,m:alice.guo@nxp.com,m:kever.yang@rock-chips.com,m:dev@benjarobin.fr,m:lucienzx159@gmail.com,m:u-boot@lists.denx.de,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:SkyLake.Huang@mediatek.com,m:adrianox@gmail.com,m:ansuelsmth@gmail.com,m:cniedermaier@dh-electronics.com,m:seanedmond@microsoft.com,m:tien.fong.chee@altera.com,m:msp@baylibre.com,m:Max.Merchel@ew.tq-group.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,
 m:mikhail.kshevetskiy@iopsys.eu,m:briansune@gmail.com,m:ycliang@andestech.com,m:m.schwan@phytec.de,m:dimorinny@google.com,m:sughosh.ganu@arm.com,m:quentin.schulz@cherry.de,m:sr@denx.de,m:festevam@gmail.com,m:vigneshr@ti.com,m:trini@konsulko.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:le.jin@siemens.com,m:abbaraju.manojsai@amarulasolutions.com,m:jonas@kwiboo.se,m:tharvey@gateworks.com,m:Maarten.Brock@sttls.nl,m:mbrugger@suse.com,m:francesco.dolcini@toradex.com,m:robert.marko@sartura.hr,m:aford173@gmail.com,m:j-choudhary@ti.com,m:vaishnav.a@ti.com,m:paul.barker.ct@bp.renesas.com,m:gchan9527@gmail.com,m:sjg@chromium.org,m:ariel.dalessandro@collabora.com,m:seashell11234455@gmail.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:uboot-stm32@st-md-mailman.stormreply.com,m:marex@denx.de,m:weijie.gao@mediatek.com,m:ben.dooks@codethink.co.uk,m:balaji.selvanathan@oss.qualcomm.com,m:pbrobinson@gmail.com,m:B.Hahn@phytec.de,m:matteo.lisi@engicam.com,m:andre.przywara@a
 rm.com,m:root@infi.wang,m:jstephan@baylibre.com,m:kory.maincent@bootlin.com,m:martyn.welch@collabora.com,m:afd@ti.com,m:alchark@gmail.com,m:pramod.kumar_1@nxp.com,m:patrick.delaunay@foss.st.com,m:h-salunke@ti.com,m:foss@0leil.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[91];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,siemens.com,pqrs.dk,arm.com,linaro.org,denx.de,ti.com,baylibre.com,mailbox.org,shantur.com,nabladev.com,gmail.com,amd.com,rock-chips.com,benjarobin.fr,lists.denx.de,amarulasolutions.com,mediatek.com,dh-electronics.com,microsoft.com,altera.com,ew.tq-group.com,iopsys.eu,andestech.com,phytec.de,google.com,cherry.de,konsulko.com,bootlin.com,gmx.de,kwiboo.se,gateworks.com,sttls.nl,suse.com,toradex.com,sartura.hr,bp.renesas.com,chromium.org,collabora.com,ziyao.cc,st-md-mailman.stormreply.com,codethink.co.uk,oss.qualcomm.com,engicam.com,infi.wang,foss.st.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,uboot,renesas];
	NEURAL_SPAM(0.00)[0.116];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,cherry.de:email,stm-ict-prod-mailman-01.stormreply.prv:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1947B4336FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Quentin,

On 2026-04-20T11:36:06, Quentin Schulz <foss+uboot@0leil.net> wrote:
> rename NET to NET_LEGACY
>
> Highlight that NET really is the legacy networking stack by renaming the
> option to NET_LEGACY.
>
> This requires us to add an SPL_NET_LEGACY alias to SPL_NET as otherwise
> CONFIG_IS_ENABLED(NET_LEGACY) will not work for SPL.
>
> The "depends on !NET_LWIP" for SPL_NET clearly highlights that it is
> using the legacy networking app so this seems fine to do.
>
> This also has the benefit of removing potential confusion on NET being a
> specific networking stack instead of 'any' network stack.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

> diff --git a/doc/develop/bootstd/overview.rst b/doc/develop/bootstd/overview.rst
> @@ -422,7 +422,7 @@ includes the full set of commands, more error messages when things go wrong and
> -several filesystem and network features (if CONFIG_NET is enabled) so that
> +several filesystem and network features (if CONFIG_NET_LEGACY is enabled) so that

Shouldn't this be left alone? Or perhaps restored in patch 4?

BOOTSTD_DEFAULTS selects BOOT_DEFAULTS which enables network commands
conditionally on !NO_NET, meaning any network stack.

> diff --git a/cmd/ufetch.c b/cmd/ufetch.c
> @@ -159,7 +159,7 @@ static int do_ufetch(struct cmd_tbl *cmdtp, int flag, int argc,
> -                     if (IS_ENABLED(CONFIG_NET))
> +                     if (IS_ENABLED(CONFIG_NET_LEGACY))
>                               printf('Net');

Similar question here.

> diff --git a/board/siemens/iot2050/board.c b/board/siemens/iot2050/board.c
> @@ -232,7 +232,7 @@ void set_board_info_env(void)
> -     if (IS_ENABLED(CONFIG_NET)) {
> +     if (IS_ENABLED(CONFIG_NET_LEGACY)) {

and here

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
