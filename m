Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R1pXLKImPWrixwgAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 15:01:22 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6546C5DBC
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 15:01:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=nabladev.com header.s=dkim header.b=D8+30Trc;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=nabladev.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48DECC424DB;
	Thu, 25 Jun 2026 13:01:14 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8A08C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 13:01:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E28C117E50; Thu, 25 Jun 2026 15:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1782392465;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=iBN3p3oV6p8B8VxWuZOChaUrZ/MS+9QNW4z95J+FmU4=;
 b=D8+30TrcF7yhGtGVpYixFs0vlz3IuRNwD0PrrlcMCoR/UwkP0OGG9nYHdLf/Wy3QzsFHOk
 cJKTL143NH8tfUbly+H08OaKCzI1R7kzwI1nnhMr0RpVZKAV/gIshugCmkH0qEmeSEuoAI
 FMpAzXHEAlDmOi+pjIMp1qwOamu+Z0BXRUq/ca8q1r0P6C4MKtwbHFy50amIkj+qIU59/r
 CA+XLmjUvTe6Ej4svNM+W4zQUMMS7BeZgqrM875B4TxDB54gtBGl/kedijCzAGJlmY3BYa
 wYxPKduExn6Iv0Ourf4ob85ezibSWgoqXVtaOSxf/tSxFN5Y6Qs2XutTjK8xAg==
Message-ID: <55cf3846-702e-f0d0-5534-ef76acc8dd29@nabladev.com>
Date: Thu, 25 Jun 2026 15:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Anshul Dalal <anshuld@ti.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@lists.denx.de
References: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Peng Fan <peng.fan@nxp.com>, Yegor Yefremov <yegorslists@googlemail.com>,
 Tuyen Dang <tuyen.dang.xa@renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Jimmy Ho <jimmy.ho@sifive.com>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 Jerome Forissier <jerome.forissier@arm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Alice Guo <alice.guo@nxp.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 Nick Hu <nick.hu@sifive.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Peter Robinson <pbrobinson@gmail.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Mateus Lima Alves <mateuslima.ti@gmail.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Beiyan Yun <root@infi.wang>, Jonathan Stroud <jonathan.stroud@amd.com>,
 Justin Swartz <justin.swartz@risingedge.co.za>,
 Bhupesh Sharma <bhupesh.linux@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dinesh <dinesh.maniyam@altera.com>,
 "Kory Maincent \(TI.com\)" <kory.maincent@bootlin.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Neha Malcom Francis <n-francis@ti.com>,
 Angelo Dureghello <angelo@kernel-space.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Padmarao Begari <padmarao.begari@amd.com>, Alexey Charkov <alchark@gmail.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] treewide: Kconfig: use bool instead of
	tristate
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.80 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nabladev.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,nabladev.com:email,nabladev.com:mid,nabladev.com:from_mime];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[st-md-mailman.stormreply.com:query timed out,stormreply.com:query timed out,nabladev.com:query timed out];
	TAGGED_RCPT(0.00)[uboot-stm32];
	ALIAS_RESOLVED(0.00)[];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:query timed out];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hs@nabladev.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[nabladev.com:-]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D6546C5DBC

SGVsbG8gQW5zaHVsLAoKT24gMjUuMDYuMjYgMDU6MTcsIEFuc2h1bCBEYWxhbCB3cm90ZToKPiBV
LUJvb3QgZG9lcyBub3Qgc3VwcG9ydCBtb2R1bGVzLCBzbyBoYXZpbmcgdHJpc3RhdGUgb3B0aW9u
cyBpcyB1c2VsZXNzLgo+IAo+IFRoZXJlZm9yZSB0aGlzIHBhdGNoIGRvZXMgYSBibGluZCByZXBs
YWNlIG9mIGFsbCB0cmlzdGF0ZSBvcHRpb25zIHRvCj4gYm9vbCB0cmVlLXdpZGUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5zaHVsIERhbGFsIDxhbnNodWxkQHRpLmNvbT4KPiAtLS0KPiBDSTogaHR0
cHM6Ly9naXRodWIuY29tL3UtYm9vdC91LWJvb3QvcHVsbC85OTgKPiAtLS0KPiAgIGJvYXJkL3N0
L2NvbW1vbi9LY29uZmlnICAgICAgfCAyICstCj4gICBjbWQvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgIHwgNCArKy0tCj4gICBkcml2ZXJzL2NhY2hlL0tjb25maWcgICAgICAgIHwgMiArLQo+ICAg
ZHJpdmVycy9jbGsvS2NvbmZpZyAgICAgICAgICB8IDIgKy0KPiAgIGRyaXZlcnMvZmlybXdhcmUv
S2NvbmZpZyAgICAgfCAyICstCj4gICBkcml2ZXJzL2kyYy9LY29uZmlnICAgICAgICAgIHwgNiAr
KystLS0KPiAgIGRyaXZlcnMvaTJjL211eGVzL0tjb25maWcgICAgfCA2ICsrKy0tLQo+ICAgZHJp
dmVycy9pM2MvS2NvbmZpZyAgICAgICAgICB8IDIgKy0KPiAgIGRyaXZlcnMvaTNjL21hc3Rlci9L
Y29uZmlnICAgfCAyICstCj4gICBkcml2ZXJzL21lbW9yeS9LY29uZmlnICAgICAgIHwgMiArLQo+
ICAgZHJpdmVycy9taXNjL0tjb25maWcgICAgICAgICB8IDIgKy0KPiAgIGRyaXZlcnMvbW1jL0tj
b25maWcgICAgICAgICAgfCA0ICsrLS0KPiAgIGRyaXZlcnMvbXRkL25hbmQvS2NvbmZpZyAgICAg
fCAyICstCj4gICBkcml2ZXJzL25ldC9waHkvS2NvbmZpZyAgICAgIHwgNCArKy0tCj4gICBkcml2
ZXJzL3NwaS9LY29uZmlnICAgICAgICAgIHwgMiArLQo+ICAgZHJpdmVycy91ZnMvS2NvbmZpZyAg
ICAgICAgICB8IDIgKy0KPiAgIGRyaXZlcnMvdXNiL2NkbnMzL0tjb25maWcgICAgfCA2ICsrKy0t
LQo+ICAgZHJpdmVycy91c2IvbXVzYi1uZXcvS2NvbmZpZyB8IDIgKy0KPiAgIGRyaXZlcnMvdXNi
L3RjcG0vS2NvbmZpZyAgICAgfCA0ICsrLS0KPiAgIDE5IGZpbGVzIGNoYW5nZWQsIDI5IGluc2Vy
dGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKVGhhbmtzIQoKZm9yIHRoZSBpMmMgcGFydHM6CgpS
ZXZpZXdlZC1ieTogSGVpa28gU2Nob2NoZXIgPGhzQG5hYmxhZGV2LmNvbT4KCmJ5ZSwKSGVpa28K
LS0gCk5hYmxhIFNvZnR3YXJlIEVuZ2luZWVyaW5nCkhSQiA0MDUyMiBBdWdzYnVyZwpQaG9uZTog
KzQ5IDgyMSA0NTU5MjU5NgpFLU1haWw6IG9mZmljZUBuYWJsYWRldi5jb20KR2VzY2jDpGZ0c2bD
vGhyZXIgOiBTdGVmYW5vIEJhYmljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
