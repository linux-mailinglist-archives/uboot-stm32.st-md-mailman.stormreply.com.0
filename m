Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FE3113CF
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 09:11:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13638C0B77A
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 07:11:50 +0000 (UTC)
Received: from 8.mo2.mail-out.ovh.net (8.mo2.mail-out.ovh.net [188.165.52.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E74ABC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 16:38:38 +0000 (UTC)
Received: from player773.ha.ovh.net (unknown [10.108.35.13])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id E04B018E312
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 18:38:37 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr
 [90.126.248.179])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id E928154A316D;
 Tue, 30 Apr 2019 16:37:35 +0000 (UTC)
To: Alex Kiernan <alex.kiernan@gmail.com>, u-boot@lists.denx.de
References: <20190419043859.16751-1-alex.kiernan@gmail.com>
From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Openpgp: preference=signencrypt
Message-ID: <63ced8dd-c450-ad67-a778-d3ebe77bf439@armadeus.com>
Date: Tue, 30 Apr 2019 18:37:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190419043859.16751-1-alex.kiernan@gmail.com>
Content-Language: en-US
X-Ovh-Tracer-Id: 8794404176285291562
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrieehgdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Mailman-Approved-At: Thu, 02 May 2019 07:11:48 +0000
Cc: Peng Fan <peng.fan@nxp.com>,
 =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 =?UTF-8?Q?Eric_B=c3=a9nard?= <eric@eukrea.com>,
 Ramon Fried <ramon.fried@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Ken Lin <Ken.Lin@advantech.com.tw>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Chris Packham <judge.packham@gmail.com>,
 Richard Hu <richard.hu@technexion.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Marek Vasut <marex@denx.de>, Akshay Saraswat <akshay.s@samsung.com>,
 Stephen Warren <swarren@nvidia.com>, Otavio Salvador <otavio@ossystems.com.br>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Toradex ARM Support <support.arm@toradex.com>,
 Fabio Estevam <festevam@gmail.com>, Minkyu Kang <mk7.kang@samsung.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Uri Mashiach <uri.mashiach@compulab.co.il>,
 Simone CIANNI <simone.cianni@bticino.it>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chander Kashyap <k.chander@samsung.com>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Stefan Agner <stefan.agner@toradex.com>, Tim Harvey <tharvey@gateworks.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Raffaele RECALCATI <raffaele.recalcati@bticino.it>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Akshay Bhat <akshaybhat@timesys.com>, Ingo Schroeck <open-source@samtec.de>,
 Stefano Babic <sbabic@denx.de>, Dmitry Lifshitz <lifshitz@compulab.co.il>,
 Simon Glass <sjg@chromium.org>, "Andrew F. Davis" <afd@ti.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] Convert CONFIG_SUPPORT_EMMC_BOOT to
	Kconfig
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGksCgpPbiA0LzE5LzE5IDY6MzggQU0sIEFsZXggS2llcm5hbiB3cm90ZToKPiBUaGlzIGNvbnZl
cnRzIHRoZSBmb2xsb3dpbmcgdG8gS2NvbmZpZzoKPiAgICBDT05GSUdfU1VQUE9SVF9FTU1DX0JP
T1QKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEtpZXJuYW4gPGFsZXgua2llcm5hbkBnbWFpbC5j
b20+Cj4gLS0tCj4gR3JlZW4gdHJhdmlzIGJ1aWxkOgo+IAo+IGh0dHBzOi8vdHJhdmlzLWNpLm9y
Zy9ha2llcm5hbi91LWJvb3QvYnVpbGRzLzUyMTkwNjg1MAo+IAo+IFRlc3RpbmcgYWZmZWN0ZWQg
Ym9hcmRzIGZvciBjb25maWd1cmF0aW9uIGNoYW5nZXM6Cj4gCj4gICBib2FyZHMuY2ZnIGlzIHVw
IHRvIGRhdGUuIE5vdGhpbmcgdG8gZG8uCj4gICBTdW1tYXJ5IG9mIDMgY29tbWl0cyBmb3IgOTUg
Ym9hcmRzICg0IHRocmVhZHMsIDEgam9iIHBlciB0aHJlYWQpCj4gICAwMTogTWVyZ2UgdGFnICd1
LWJvb3QtaW14LTIwMTkwNDE1JyBvZiBnaXQ6Ly9naXQuZGVueC5kZS91LWJvb3QtaW14Cj4gICAg
ICBhYXJjaDY0OiAgdysgICB4aWxpbnhfenlucW1wX21pbmlfZW1tYzEgeGlsaW54X3p5bnFtcF9t
aW5pX2VtbWMwIHhpbGlueF96eW5xbXBfbWluaV9xc3BpIGNsZWFyZm9nX2d0XzhrIGlteDhxeHBf
bWVrIHhpbGlueF96eW5xbXBfbWluaSB4aWxpbnhfenlucW1wX21pbmlfbmFuZCBpbXg4bXFfZXZr
Cj4gICAgICAgICAgYXJtOiAgdysgICBjbV90NTQgY2wtc29tLWlteDcgbWFyc2JvYXJkIGNsZWFy
Zm9nIGFwYWxpc19pbXg2IHdhcnA3IHBpY28taG9iYml0LWlteDdkIHBpY28tcGktaW14NnVsIGRt
cy1iYTE2IGFybmRhbGUgcmlvdGJvYXJkIHBpY28taG9iYml0LWlteDZ1bCBjb2xpYnJpX2lteDcg
cGljby1pbXg3ZCB4cHJlc3Nfc3BsIG9wb3M2dWxkZXYgd2FycDdfYmwzMyBpbXg2ZGxfbWFtb2og
Z2VfYng1MHYzIGRpc3BsYXk1IG14N2RzYWJyZXNkX3FzcGkgZGlzcGxheTVfZmFjdG9yeSBjb2xp
YnJpX2lteDdfZW1tYyBnd3ZlbnRhbmFfbmFuZCBteDdkc2FicmVzZCBnd3ZlbnRhbmFfZ3c1OTA0
IGd3dmVudGFuYV9lbW1jIGFtNTd4eF9oc19ldm1fdXNiIG9tYXA1X3Vldm0gYnJwcHQxX3NwaSB4
aWxpbnhfenlucW1wX3I1IHZpbmNvIG14NnNhYnJlc2Qgd2FycCByaW90Ym9hcmRfc3BsIHZpbmlu
Z18yMDAwIHpjNTYwMSB6YzUyMDIgeHByZXNzIHBpY28taW14NnVsIGRtcy1iYTE2LTFnIHBpY28t
cGktaW14N2QKPiAgIDAyOiBjb25maWdzOiBSZXN5bmMgd2l0aCBzYXZlZGVmY29uZmlnCj4gICAw
MzogQ29udmVydCBDT05GSUdfU1VQUE9SVF9FTU1DX0JPT1QgdG8gS2NvbmZpZwo+IAoKPiAgY29u
Zmlncy9vcG9zNnVsZGV2X2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgMSArCgo+ICBp
bmNsdWRlL2NvbmZpZ3Mvb3BvczZ1bGRldi5oICAgICAgICAgICAgICAgICAgICAgfCAzIC0tLQoK
ClRlc3RlZC1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJt
YWRldXMuY29tPgoKUmVnYXJkcywKCgotLSAKU8OpYmFzdGllbiBTenltYW5za2kKU29mdHdhcmUg
ZW5naW5lZXIsIEFybWFkZXVzIFN5c3RlbXMKVGVsOiArMzMgKDApOSA3MiAyOSA0MSA0NApGYXg6
ICszMyAoMCk5IDcyIDI4IDc5IDI2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
