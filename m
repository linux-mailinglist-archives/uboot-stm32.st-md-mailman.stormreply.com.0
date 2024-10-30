Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8CF9B6562
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2024 15:12:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFA30C78027;
	Wed, 30 Oct 2024 14:12:53 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15D3FC78023
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 14:12:47 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XdpxB3JmLz9sl9;
 Wed, 30 Oct 2024 15:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1730297566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEj7Qbpcyt9cUZBHjoOobVEQSG+xLa4B1wowBfHWqe8=;
 b=krrtr67lnh7USIUJtM+oLwyxh1OFbUrjXhDxSOics0z813xlszusfVWPotUhshWcL9wQ9c
 RdT5nqKcIeqtnAHx0mMutdy34jnkwHptYa7kywhRHBCOJddCKYIjVmttJOQKR1fYOde9W5
 35Tq3djs1JNfK8qM1r6AIxLBoArYeXz4An5HoQgHbQK61cbgPkuez5/wpbOTWBSmGSlBDQ
 cUA5G3foY0gzS6XxUvNYXfesD1ZfeXVgG2SASUTkB420JvDymCkuCn7RFLi6FVRZNaP+bY
 8nniTki3PGdVa8012UkdCL560ero8YUdkPa2I50jNRC2LckkGNY4VMH6wqgzkg==
Message-ID: <b3a4cfdd-f503-465d-915a-1094e7146927@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1730297564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEj7Qbpcyt9cUZBHjoOobVEQSG+xLa4B1wowBfHWqe8=;
 b=dhVAZC7+rDzrFktXO7cw11AQgAfLaT/FlhpJyZTknK+riQZM7ELCYw6+CV5PdRBWYTolSJ
 ttyiAMuOMjDqFmoxdoSR7tl5N8VaGZ547/L74SNZUzD0vbO+gLbc9Q7/0KDg+R6nhFr5NZ
 fszewh0fivkfklmOxrNl6VMdeR2K/O1gTppGqZiAK+F/r9MV2N6Ln/6HEiccIcB/XQbkbI
 peQp2eqaVvlB3Ni+X1dZI1KcK1nyBNTXviXxHdoKQYeQPITALzArcbGqn9JynTq6TSgIud
 coerjHASnb8FLBhTKjppXr3NFEVcZ5tMMy/ZFdcMObngIEItyXcWqf3B/FNhRA==
Date: Wed, 30 Oct 2024 15:12:40 +0100
MIME-Version: 1.0
To: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
 <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
X-MBO-RS-ID: 1e98fe816c5662a518a
X-MBO-RS-META: 1hjxko88cqf11z65wset4xkt891ypajs
Cc: Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, u-boot@lists.denx.de,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/9] mtd: spi-nor: Remove recently added
 nor->addr_width == 3 test
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

T24gMTAvMzAvMjQgMTE6MzMgQU0sIEphZ2FuIFRla2kgd3JvdGU6Cj4gSGkgTWFyZWssCgpIaSwK
Cj4gT24gU3VuLCBPY3QgMjcsIDIwMjQgYXQgMTo0OOKAr0FNIE1hcmVrIFZhc3V0Cj4gPG1hcmVr
LnZhc3V0K3JlbmVzYXNAbWFpbGJveC5vcmc+IHdyb3RlOgo+Pgo+PiBSZW1vdmUgdW5kb2N1bWVu
dGVkIG5vci0+YWRkcl93aWR0aCA9PSAzIHRlc3QuIFRoaXMgd2FzIGFkZGVkIGluIGNvbW1pdAo+
PiA1ZDQwYjNkMzg0ZGMgKCJtdGQ6IHNwaS1ub3I6IEFkZCBwYXJhbGxlbCBhbmQgc3RhY2tlZCBt
ZW1vcmllcyBzdXBwb3J0IikKPj4gd2l0aG91dCBhbnkgZXhwbGFuYXRpb24gaW4gdGhlIGNvbW1p
dCBtZXNzYWdlLiBSZW1vdmUgaXQuCj4+Cj4+IFRoaXMgYWxzbyBoYXMgYSBiYWQgc2lkZS1lZmZl
Y3Qgd2hpY2ggYnJlYWtzIFJFQUQgb3BlcmF0aW9uIG9mIGV2ZXJ5IFNQSSBOT1IKPj4gd2hpY2gg
ZG9lcyBub3QgdXNlIGFkZHJfd2lkdGggPT0gMywgZS5nLiBzMjVmczUxMnMgZG9lcyBub3Qgd29y
ayBhdCBhbGwuIFRoaXMKPj4gaXMgYmVjYXVzZSBpZiBhZGRyX3dpZHRoICE9IDMsIHJlbV9iYW5r
X2xlbiBpcyBhbHdheXMgMCwgYW5kIGlmIHJlbV9iYW5rX2xlbgo+PiBpcyAwLCB0aGVuIHJlYWRf
bGVuIGlzIDAgYW5kIGlmIHJlYWRfbGVuIGlzIDAsIHRoZW4gdGhlIHNwaV9ub3JfcmVhZCgpIHJl
dHVybnMKPj4gLUVJTy4KPj4KPj4gQmFzaWMgcmVwcm9kdWNlciBpcyBhcyBmb2xsb3dzOgo+PiAi
Cj4+ID0+IHNmIHByb2JlIDsgc2YgcmVhZCAweDUwMDAwMDAwIDAgMHgxMDAwMAo+PiBTRjogRGV0
ZWN0ZWQgczI1ZnM1MTJzIHdpdGggcGFnZSBzaXplIDI1NiBCeXRlcywgZXJhc2Ugc2l6ZSAyNTYg
S2lCLCB0b3RhbCA2NCBNaUIKPj4gZGV2aWNlIDAgb2Zmc2V0IDB4MCwgc2l6ZSAweDEwMDAwCj4+
IFNGOiA2NTUzNiBieXRlcyBAIDB4MCBSZWFkOiBFUlJPUiAtNQo+PiAiCj4+Cj4+IEZpeGVzOiA1
ZDQwYjNkMzg0ZGMgKCJtdGQ6IHNwaS1ub3I6IEFkZCBwYXJhbGxlbCBhbmQgc3RhY2tlZCBtZW1v
cmllcyBzdXBwb3J0IikKPj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0
K3JlbmVzYXNAbWFpbGJveC5vcmc+Cj4+IC0tLQo+PiBDYzogQW5kcmUgUHJ6eXdhcmEgPGFuZHJl
LnByenl3YXJhQGFybS5jb20+Cj4+IENjOiBBc2hvayBSZWRkeSBTb21hIDxhc2hvay5yZWRkeS5z
b21hQGFtZC5jb20+Cj4+IENjOiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNv
bT4KPj4gQ2M6IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPgo+PiBDYzogTWljaGFs
IFNpbWVrIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4KPj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0
cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmlj
ay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gQ2M6IFByYXR5dXNoIFlhZGF2IDxwLnlhZGF2QHRp
LmNvbT4KPj4gQ2M6IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBjaGVycnkuZGU+Cj4+
IENjOiBTZWFuIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT4KPj4gQ2M6IFNpbW9uIEdsYXNz
IDxzamdAY2hyb21pdW0ub3JnPgo+PiBDYzogVGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdh
bm9AaW5maW5lb24uY29tPgo+PiBDYzogVG9tIFJpbmkgPHRyaW5pQGtvbnN1bGtvLmNvbT4KPj4g
Q2M6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KPj4gQ2M6IFZlbmth
dGVzaCBZYWRhdiBBYmJhcmFwdSA8dmVua2F0ZXNoLmFiYmFyYXB1QGFtZC5jb20+Cj4+IENjOiB1
LWJvb3RAbGlzdHMuZGVueC5kZQo+PiBDYzogdWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQo+PiAtLS0KPiAKPiBJcyB0aGlzIHBhdGNoLXNldCBuZXh0IHZlcnNpb24gZm9y
ICdwcmV2aW91cycgcmV2ZXJ0ZWQgc2VyaWVzPwpZZXMsIHRoaXMgaXMgdHJ5aW5nIHRvIGZpeCB0
aGUgaXNzdWVzIGludHJvZHVjZWQgYnkgdGhlIHN0YWNrZWQvcGFyYWxsZWwgCnN0dWZmIGluIGEg
bGVzcyBibHVudCBtYW5uZXIgdGhhbiBmdWxsIHJldmVydC4KCklucHV0IGZyb20gVHVkb3IgaXMg
cHJvYmFibHkgbW9yZSB1c2VmdWwsIHNpbmNlIHRoZXkgZG8gd29yayBvbiB0aGUgCmtlcm5lbCBT
UEkgTk9SIHN0dWZmIGFuZCBoYXZlIGJldHRlciBpZGVhIHdoZXJlIHRoYXQgaXMgZ29pbmcgL3dy
dCB0aGUgCnN0YWNrZWQvcGFyYWxsZWwgc3R1ZmYgdG9vLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
