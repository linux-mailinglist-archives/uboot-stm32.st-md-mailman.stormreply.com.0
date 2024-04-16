Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B22F8A713A
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Apr 2024 18:21:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B85EC6B45B;
	Tue, 16 Apr 2024 16:21:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE1C5C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 16:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713284412; x=1713889212; i=xypron.glpk@gmx.de;
 bh=6MivIWAskDkTnfCkpEL05lkh0YuHw6lkxje4i2lUcCU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=a7vKatEk5MMTR6dKOlYU5I8Jt4b1hUlrZ4oth6JMhwQJTyVkzatAl268Oh4mIaLo
 7v1sM8X/f8Ife72RU9UHpxMgQVBw6RA42b2mdPJejL/f2/RhznGQPp6RlkFDOHaum
 tfwzQQ/DOYZKZP7akDkzMs78z8kvocP2J3Yg/8E5Z3FSy4CTBrcGtfXh/sIcZily7
 G6R5e4vFuArYuG8BXwZ83Kv5so02A8MqxswpecA2BkqATTi7+VViZyDmlRXMuLhbh
 sUjQxWezT7fjoVl/LTsO0TPDtcUVvO593DXY8L4YnFDxdOPJPvsOnFMk0QpXyXens
 TocwlCOEqZzv2JR2OA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.126] ([62.143.245.32]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZCb5-1sJ5dV2aOX-00VAHD; Tue, 16
 Apr 2024 18:20:12 +0200
Message-ID: <58f122b7-e9b4-4028-941a-0f1b647ffe4e@gmx.de>
Date: Tue, 16 Apr 2024 18:19:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>
References: <cover.1713250508.git.michal.simek@amd.com>
 <abe7e535b9e4ee13cea1e6d1c37c8f1f6e6014e3.1713250508.git.michal.simek@amd.com>
 <20240416160631.GO1054907@bill-the-cat>
Content-Language: en-US
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20240416160631.GO1054907@bill-the-cat>
X-Provags-ID: V03:K1:E/tn4fCtbNK59ah0buIGEzkjRN+LrPJ/aIWAg6tNiqAL2lcb9/8
 8Hcmdr8m4DoGiGAmVvD7gapx0yfhHZBdtCLDOVcPhq6Vd1ZqSqcEN3dPkOYnEX1WfgWGI54
 J9nrQfrNJ9SZHeYIK5zgMnLYCxkGzGkFUtxcR03nkyagGQewezMtKAYL9yGBYIPc1biOP4f
 NHMaTd09bbxCPDhV1X4cQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AonO1huSYZY=;nnPH+QyQAberWkauphdDX1oGC6P
 NjtHRkD8/TRlwJcoNIH2CbKZXaeB8TC62UYwYE4B4Lru7GCevSYQJlnpsVEVDsOE8tkQwz+JI
 m/4/SelW1EMl95XoXrUG6vO/CzH7Tr2XN6mqSC1eYM/fs8DPCAFcBBi6/pCjuQevTAhS9ajGT
 TDdOsFpRNNvDSSO/lSKPC4AgUhB4spzixdIiuAtw9Nb8Hs4zHoQx5MUMw8XWOlDwBJYYJY9z3
 fizvhvIlvxnI2X5aOTZ+S6APSXBrwDhDGgkr7NX+qI9R+Hsfz6u9/n4kHg6l9JBAcfQQWE9Lr
 KNLi7hIpKHgITNDvOOF9fYWpuTBJoo4vGOztKCzfrZ20CL9fl1UV2DAIo42n4ixLvw/A2+85a
 gWzW070VrHkSVQZbZNoq07U4bNzY+Mtt4u5VobtRm4SQgIbO4Go96JPZ2Um7g2t5fMedfzzAR
 vr4AkW33x1LVrS3HPJ5248sPz4AmLcMpr6sN/FQBsusiqW5A48MFj86D9UH/n59mKi8FE32A9
 OUfITyWrs0rLTZi4LtJhUR8mK3GGtHDH1P3FhLee43c4fNjBQGRxDAZOXF7cbhFNeDTr5j4ag
 brtB17cs9Cu4vta0NhxDMbnFEuxUXldM7F/U0Q5J4YMMJ/UnpbVoe9gWywssBAmIXfCeWhcum
 bQeGnW60+YXffBMLW/wmqu60FQ3uuE/OxBE7ouBb5W8F+cZLCtkL54BLyabdToVeDwmen76yq
 zfCvI1CFhSMIj5+Z5CmfcEXVBPqON3jMQ3G+G94BmNJhGifQr3zHnmknmE6+d3q1mPYhUr7Cn
 m/lu35TwA/bLoEsoMbtzpUaIsTb9crfDD26HPRAN/6tQU=
Cc: Nishanth Menon <nm@ti.com>, Peng Fan <peng.fan@nxp.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 "moderated list:ST BOARDS" <uboot-stm32@st-md-mailman.stormreply.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Aaron Williams <awilliams@marvell.com>, Viacheslav Bocharov <adeep@lexina.in>,
 Stefan Roese <sr@denx.de>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Lukasz Majewski <lukma@denx.de>,
 Shiji Yang <yangshiji66@outlook.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Doug Zobel <douglas.zobel@climate.com>, Stefano Babic <sbabic@denx.de>,
 Heiko Schocher <hs@denx.de>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 =?UTF-8?Q?Pawe=C5=82_Jarosz?= <paweljarosz3691@gmail.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Enrico Leto <enrico.leto@siemens.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Philip Oberfichtner <pro@denx.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>, git@xilinx.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Johan Jonker <jbx6244@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Anatolij Gustschin <agust@denx.de>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Simon Glass <sjg@chromium.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "open list:VIM3" <u-boot-amlogic@groups.io>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Matthias Winker <matthias.winker@de.bosch.com>
Subject: Re: [Uboot-stm32] [PATCH v2 5/5] common: Convert *.c/h from UTF-8
 to ASCII enconfing
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

T24gMTYuMDQuMjQgMTg6MDYsIFRvbSBSaW5pIHdyb3RlOgo+IE9uIFR1ZSwgQXByIDE2LCAyMDI0
IGF0IDA4OjU1OjE5QU0gKzAyMDAsIE1pY2hhbCBTaW1layB3cm90ZToKPgo+PiBDb252ZXJ0IFVU
Ri04IGNoYXJzIHRvIEFTQ0lJIGluIGNhc2VzIHdoZXJlIG1ha2Ugc2Vuc2UuIE5vIENvcHlyaWdo
dCBvcgo+PiBuYW1lcyBhcmUgY29udmVydGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwg
U2ltZWsgPG1pY2hhbC5zaW1la0BhbWQuY29tPgo+Pgo+Cj4gUmV2aWV3ZWQtYnk6IFRvbSBSaW5p
IDx0cmluaUBrb25zdWxrby5jb20+Cj4KPiBOb3csIGhvdyBkaWQgeW91IHRlc3QgLyBmaW5kIHRo
ZXNlPyBHaXZlbiBuYW1lcyBhIENJIHRlc3QgaXMgdW5saWtlbHkKPiB0byBiZSBkb2FibGUgYnV0
IGlmIGl0J3Mgb3RoZXJ3aXNlIHNjcmlwdGFibGUgSSBjYW4gcHV0IGl0IGluIG15IGxvb3BzCj4g
YW5kIGp1c3QgZml4dXAgYXMgbmVlZGVkIChsaWtlIEkgZG8gdG9kYXkgZm9yIGFkZGluZyA8Y29t
bW9uLmg+IGZvcgo+IGV4YW1wbGUpLgo+CgpUaGVyZSBzZWVtIG5vIHRvIGJlIHRvbyBtYW55IG5v
bi1BU0NJIHN0cmluZ3Mgb3V0c2lkZSBvZiBjb21tZW50cy4KU2hvdWxkIHdlIGNhcmUgYWJvdXQg
bm9uLUFTQ0lJIGNvbW1lbnRzPwoKJCBmaW5kIC4gLW5hbWUgJyouaCcgLWV4ZWMgZ3JlcCAtUCAt
SG4gIlteXHgwMC1ceDdGXSIge30gXDsgfCBncmVwIC12Cic6XHMqW1wvXConXQouL2luY2x1ZGUv
Y29uZmlncy90ZWMtbmcuaDoxMzojZGVmaW5lIENGR19URUdSQV9CT0FSRF9TVFJJTkcgICAgIkF2
aW9uaWMKRGVzaWduIFRhbW9udGVu4oSiIE5HIEV2YWx1YXRpb24gQ2FycmllciIKLi9hcmNoL21p
cHMvbWFjaC1vY3Rlb24vaW5jbHVkZS9tYWNoL2N2bXgtcGtvMy5oOjM2OTogICBNRU1BTEdfU1VC
ID0gOSwKICAgICAgLyogbWVtID0gbWVtIOKAkyBQS09fU0VORF9NRU1fU1tPRkZTRVRdICovCgok
IGZpbmQgLiAtbmFtZSAnKi5jJyAtZXhlYyBncmVwIC1QIC1IbiAiW15ceDAwLVx4N0ZdIiB7fSBc
OyB8IGdyZXAgLXYKJzpccypbXC9cKiddCi4vZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9pZHMu
Yzo2NTogICB7IkgyN1FDRzhUMkU1UuKAkEJDRiA2NEcgMy4zViA4LWJpdCIsCi4vZHJpdmVycy92
aWRlby9kd19taXBpX2RzaS5jOjg2MTpNT0RVTEVfQVVUSE9SKCJZYW5uaWNrIEZlcnRyw6kKPHlh
bm5pY2suZmVydHJlQHN0LmNvbT4iKTsKLi9ib2FyZC9ib3NjaC9hY2MvYWNjLmM6NDQwOiAgICAu
U1JUID0gMCwgLy8gU2V0IHRvIDEgZm9yIHRlbXBlcmF0dXJlcwphYm92ZSA4NcKwQwouL2NtZC8y
MDQ4LmM6NjU6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcmludGYoIiAgIMK3ICAg
Iik7Ci4vY21kLzIwNDguYzo3OTogICAgICAgIHByaW50ZigiICAgICAgICDihpAsIOKGkSwg4oaS
LCDihpMgb3IgcSAgICAgICAgXG4iKTsKCkJlc3QgcmVnYXJkcwoKSGVpbnJpY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
