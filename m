Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P6tAOaC5mkIxgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 21:47:50 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 201C44336FD
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 21:47:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 144A3C56612;
	Mon, 20 Apr 2026 19:40:39 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 279BDC56600
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 19:40:37 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6714f678bdaso5748139a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 12:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776714037; cv=none;
 d=google.com; s=arc-20240605;
 b=PGb0QOCZ0/zm0941iPakBuKC4AfYc2URc9ZnyTzxKy6l100asT05eetkwnG0KIN1Sh
 kWPgFGt1cpauszW2gPEf2xymr5GsnAERkem05r02ls850DWG9B5yHD5v85SQb7LYTCK8
 g6hY430QfcyMzvh5a2HK+sPbZYF/p5BVGrcDLvp90ViFqe9PT11Zz2RvibryOrYTuuHE
 8nlL75Jfx74smGMUVwR+bwtTtRgZhfx1SaK3GLf4CdL95Ba7qxDORFDnyYLKZyYo+tef
 LnZmpQgrhvdgz8keOjoWjayvckdqqhIUrSvTbA17RIfTHJvquR6b1DBXMPo36xjwx6Sj
 8vHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=QJwjcDEyqhG1S/OzWjzm3dFd7n+vldv03RfUC4xxhKc=;
 fh=FCOLG0AW3SMyoEc8pVQuLhNfQbTQYAH6RjsdIfgpNA8=;
 b=ZHZ0lixEU+Wg36pIRlido6MTT6lDXqWDf3J+Ii6q3PtwqZ3n7piDMqr03RQw37PI/u
 MD+AEigiSqg1DdBax6lWQh7IIrPEObGndDfftg6ALKkKA4x/fZhiyEeQgM5DRm9M1zoO
 +KdNC+vkPiVKsC1t4itgjm4Xp+NyV2DcwOc6SwScdBFT/mkyC2leA3k/KQqgXOH8JZKP
 9/ghRBaqwdodIpwpxaRcIF5JMV4+mztcZ3VI6uyYP6noy/VfqAkN/qZ9mrUOI0/0Z6oQ
 d1VpeDDvf9FoIXuVy1JDzucHidHmjL0hnklW7gmWSpbIPJr5tSwrcejokdw/Ol6VJuYf
 uzPA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1776714037; x=1777318837;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QJwjcDEyqhG1S/OzWjzm3dFd7n+vldv03RfUC4xxhKc=;
 b=jo194S3TxswyQCj4C3dL1Obd98v+EHrA9+tjMjGxFFOwCMB/OFiyY9w4GITEW1LkYD
 HQqjbM8I5Y1pMlpUxja+CNaybP+li/EsCCa971iUNy9QlgB7o3N3BFYY8V8XhgBT5I7s
 nFwsWSW1Hmzn2JGSSNRsPjU0rm5A1ibTIAVr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776714037; x=1777318837;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJwjcDEyqhG1S/OzWjzm3dFd7n+vldv03RfUC4xxhKc=;
 b=eiCRSc9/O4ZIYxKLyPXWqkuzJz/UScGpEu/99OemQfYjDMJTJKY7rYprmyTP0gEnE4
 6epZfA830omVQ8kHlfnWgu2MvW3LWunqqcDD1kpl7CPeYPozlrF2K10R+n/Tg/srTFga
 XHU0yRI9LpxzpGodwRRL549m6Y8FW7tByOyBu82qw9kC+Rd+TaxBgo49z3G8X8+6ZoVo
 QJI2NPXXlK5SJ0uGJQDkiNVYI0Y27iHYt30mfwfmt3dEZ8gGqBpPOm0wue/ST7KukiPE
 e9xvVHH/EE2mgkZWxXjwoE9qVl6thFdgaaW1OzDbIgarbcchdrdHC0aVovnEhaNvLLTD
 yDtA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/09cWKmQuMgBPVwvBonKnyks/f7gnU6+Lh07opUx7e961x/hbD1S+4hBT5DNj6GzrKydz1Ag3UzmTTUA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywv+e6JVpK3vhgf5VQQsy7GFbVil/KTrz2HoJMFZRpBV7v+y7Ht
 TOqmwbWy/5Xr1cRX/4RH13CRcoNIkzFvlkoOcune9QyDO94PieG6wKTR2Zn4F5QTlrSGi69i0Va
 6D68R5B3G6LgPf6jjNvfaNWEGA9FHIz6UWbQa/C9M
X-Gm-Gg: AeBDietT1hZMwh3O5oNO7u0jClPvsAngVubGrZhvXnT2Wyxj8lC5ND0nLkO1WsKTQtY
 egnPDU5FvOkBYO/WmAVhIqgVbXTWJxHRKF0qPD/BDYmxSiACqGMe3U12DuI1rCBXfq/TYfATsyI
 TFoIadbyEtFM2y5r4PXlpaPTj7iuFVVdtDhZ16ZJhajylC3UnGi3w+7EIpELxFaMQmbrce1bP2I
 BtRJQbzjCFg7pPDbFMx0rZ0MdKLlcdWvm34MOAMUjAIS8jLg9WEZswivfIlQtldTzA324i04CGv
 Exs2fSWouxcrn1oZheeWQH0ZePJX4Mo=
X-Received: by 2002:a17:907:a0c9:b0:ba6:22e8:69d2 with SMTP id
 a640c23a62f3a-ba622e8756emr459285866b.34.1776714037247; Mon, 20 Apr 2026
 12:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
 <20260420-net-kconfig-v1-1-9900002d8e72@cherry.de>
In-Reply-To: <20260420-net-kconfig-v1-1-9900002d8e72@cherry.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Apr 2026 07:40:24 +1200
X-Gm-Features: AQROBzDUeSZ552s_5UcnC26YGPQFwsBXLfN8KgMOXexznubb8hQQvhSyobCeg4I
Message-ID: <CAFLszTio+y35wxBcDTpmERV1Xg+cY895QESUWdu8+vg+P61STA@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH 1/6] move networking menu in net/Kconfig
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:foss+uboot@0leil.net,m:peng.fan@nxp.com,m:mkorpershoek@kernel.org,m:jan.kiszka@siemens.com,m:alvin@pqrs.dk,m:jerome.forissier@arm.com,m:neil.armstrong@linaro.org,m:lukma@denx.de,m:s-vadapalli@ti.com,m:dlechner@baylibre.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:i@shantur.com,m:c-vankar@ti.com,m:semen.protsenko@linaro.org,m:anshuld@ti.com,m:mingkai.hu@nxp.com,m:dannenberg@ti.com,m:hs@nabladev.com,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:padmarao.begari@amd.com,m:bb@ti.com,m:alice.guo@nxp.com,m:kever.yang@rock-chips.com,m:dev@benjarobin.fr,m:lucienzx159@gmail.com,m:u-boot@lists.denx.de,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:SkyLake.Huang@mediatek.com,m:adrianox@gmail.com,m:ansuelsmth@gmail.com,m:cniedermaier@dh-electronics.com,m:seanedmond@microsoft.com,m:tien.fong.chee@altera.com,m:msp@baylibre.com,m:Max.Merchel@ew.tq-group.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,
 m:mikhail.kshevetskiy@iopsys.eu,m:briansune@gmail.com,m:ycliang@andestech.com,m:m.schwan@phytec.de,m:dimorinny@google.com,m:sughosh.ganu@arm.com,m:quentin.schulz@cherry.de,m:sr@denx.de,m:festevam@gmail.com,m:vigneshr@ti.com,m:trini@konsulko.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:le.jin@siemens.com,m:abbaraju.manojsai@amarulasolutions.com,m:jonas@kwiboo.se,m:tharvey@gateworks.com,m:Maarten.Brock@sttls.nl,m:mbrugger@suse.com,m:francesco.dolcini@toradex.com,m:robert.marko@sartura.hr,m:aford173@gmail.com,m:j-choudhary@ti.com,m:vaishnav.a@ti.com,m:paul.barker.ct@bp.renesas.com,m:gchan9527@gmail.com,m:sjg@chromium.org,m:ariel.dalessandro@collabora.com,m:seashell11234455@gmail.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:uboot-stm32@st-md-mailman.stormreply.com,m:marex@denx.de,m:weijie.gao@mediatek.com,m:ben.dooks@codethink.co.uk,m:balaji.selvanathan@oss.qualcomm.com,m:pbrobinson@gmail.com,m:B.Hahn@phytec.de,m:matteo.lisi@engicam.com,m:andre.przywara@a
 rm.com,m:root@infi.wang,m:jstephan@baylibre.com,m:kory.maincent@bootlin.com,m:martyn.welch@collabora.com,m:afd@ti.com,m:alchark@gmail.com,m:pramod.kumar_1@nxp.com,m:patrick.delaunay@foss.st.com,m:h-salunke@ti.com,m:foss@0leil.net,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[91];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,siemens.com,pqrs.dk,arm.com,linaro.org,denx.de,ti.com,baylibre.com,mailbox.org,shantur.com,nabladev.com,gmail.com,amd.com,rock-chips.com,benjarobin.fr,lists.denx.de,amarulasolutions.com,mediatek.com,dh-electronics.com,microsoft.com,altera.com,ew.tq-group.com,iopsys.eu,andestech.com,phytec.de,google.com,cherry.de,konsulko.com,bootlin.com,gmx.de,kwiboo.se,gateworks.com,sttls.nl,suse.com,toradex.com,sartura.hr,bp.renesas.com,chromium.org,collabora.com,ziyao.cc,st-md-mailman.stormreply.com,codethink.co.uk,oss.qualcomm.com,engicam.com,infi.wang,foss.st.com];
	NEURAL_HAM(-0.00)[-0.040];
	TAGGED_RCPT(0.00)[uboot-stm32,uboot,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,chromium.org:email,cherry.de:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 201C44336FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-20T11:36:06, Quentin Schulz <foss+uboot@0leil.net> wrote:
> move networking menu in net/Kconfig
>
> In the main Kconfig, there are only two more menus, General Setup and
> Expert, in addition to the net menu. Since the part in the main Kconfig
> is mostly about selecting the network stack (legacy or lwIP), and that
> we already have a net/Kconfig, let's move those to net/Kconfig to have
> everything in the same place.
>
> No intended change in behavior.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Kconfig     | 34 ----------------------------------
>  net/Kconfig | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 34 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
