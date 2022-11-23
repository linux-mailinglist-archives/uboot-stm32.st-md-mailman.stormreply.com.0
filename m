Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B19763689E
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Nov 2022 19:23:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F40F5C6507C;
	Wed, 23 Nov 2022 18:22:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 147F9C65071
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 18:22:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB92861E52;
 Wed, 23 Nov 2022 18:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E952BC433D7;
 Wed, 23 Nov 2022 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669227776;
 bh=rUvR8yimH8HEHjI2DkXovfpRW7/lioMYLXSZiuY2Ip4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S//n2z0xtvASq3mr7PlF+XVJM8iS7HjZcgVPzjMVu5zZO3A7tmaqJ/27tjm8sBWBF
 B/3IAJAMKz/hgCqMJ0KH4zc6TpdiP4UqQBAt9Xi0TREWxQT7Tc2Ghx4BZllH1Pu4Fl
 xSwN5GN+aTFWyB3b+2hpypeaMWPLlgBMit+tf2wx3MsmNSuNl8r08rpJiq7Ry7LXz8
 O3DcP93GAf05Vg1okj34lI0Ybjnv+/NQgQNsusLnQrCXsy0X67UfOC0Np7Yxizix8T
 F/NdQS7txECEpkVNSJVT6lndnMXmKx0qlzsT5lZgZbsKbYKIQIowsc0K2ZvdSdhjHK
 dq1EYDPxEuCHw==
Received: by pali.im (Postfix)
 id E4D0C3F6; Wed, 23 Nov 2022 19:22:52 +0100 (CET)
Date: Wed, 23 Nov 2022 19:22:52 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20221123182252.d256feeti4iuaf63@pali>
References: <20221108085222.1378781-1-max.oss.09@gmail.com>
 <20221108085222.1378781-2-max.oss.09@gmail.com>
 <20221123181840.GA1482451@bill-the-cat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221123181840.GA1482451@bill-the-cat>
User-Agent: NeoMutt/20180716
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Du Huanpeng <dhu@hodcarrier.org>, Max Krummenacher <max.oss.09@gmail.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Heiko Thiery <heiko.thiery@gmail.com>,
 Stefan Roese <sr@denx.de>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/1] u-boot-initial-env: rework make
	target
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

T24gV2VkbmVzZGF5IDIzIE5vdmVtYmVyIDIwMjIgMTM6MTg6NDAgVG9tIFJpbmkgd3JvdGU6Cj4g
T24gVHVlLCBOb3YgMDgsIDIwMjIgYXQgMDk6NTI6MjJBTSArMDEwMCwgTWF4IEtydW1tZW5hY2hl
ciB3cm90ZToKPiAKPiA+IEZyb206IE1heCBLcnVtbWVuYWNoZXIgPG1heC5rcnVtbWVuYWNoZXJA
dG9yYWRleC5jb20+Cj4gPiAKPiA+IFdpdGggTFRPIGVuYWJsZWQgdGhlIFUtQm9vdCBpbml0aWFs
IGVudmlyb25tZW50IGlzIG5vIGxvbmdlciBzdG9yZWQKPiA+IGluIGFuIGVhc3kgYWNjZXNzaWJs
ZSBzZWN0aW9uIGluIGVudi9jb21tb24uby4gSS5lLiB0aGUgc2VjdGlvbiBuYW1lCj4gPiBjaGFu
Z2VzIGZyb20gYnVpbGQgdG8gYnVpbGQsIGl0cyBjb250ZW50IG1heWJlIGNvbXByZXNzZWQgYW5k
IGl0IGlzCj4gPiBhbm5vdGF0ZWQgd2l0aCBhZGRpdGlvbmFsIGRhdGEuCj4gPiAKPiA+IERyb3Ag
dHJ5aW5nIHRvIHJlYWQgdGhlIGluaXRpYWwgZW52IHdpdGggZWxmIHRvb2xzIGZyb20gdGhlIGNv
bXBpbGVyCj4gPiBzcGVjaWZpYyBvYmplY3QgZmlsZSBpbiBmYXZvdXIgb2YgYWRkaW5nIGFuZCB1
c2luZyBhIGhvc3QgdG9vbCB3aXRoCj4gPiB0aGUgb25seSBmdW5jdGlvbmFsaXR5IG9mIHByaW50
aW5nIHRoZSBpbml0aWFsIGVudiB0byBzdGRvdXQuCj4gPiAKPiA+IFNlZSBhbHNvOgo+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzkyN2IxMjJlLTFmNjItZTc5MC1mNWNhLTMwYmFlNDMz
MmM3N0Bmb3NzLnN0LmNvbS8KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWF4IEtydW1tZW5hY2hl
ciA8bWF4LmtydW1tZW5hY2hlckB0b3JhZGV4LmNvbT4KPiA+IEFja2VkLWJ5OiBQYWxpIFJvaMOh
ciA8cGFsaUBrZXJuZWwub3JnPgo+IAo+IEFscmlnaHQsIHNvICdtYWtlIHRvb2xzLW9ubHlfZGVm
Y29uZmlnIHRvb2xzLW9ubHknIG5vdyBmYWlscyB0byBidWlsZAo+IGJlY2F1c2Ugd2UncmUgbWlz
c2luZyB0aGUgZGVwZW5kZW5jaWVzIHRvIG1ha2Ugc3VyZSB0aGF0IHdlIGhhdmUKPiBnZW5lcmF0
ZWQvZW52aXJvbm1lbnQuaCBhdmFpbGFibGUuCj4gaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJv
b3QvdS1ib290Ly0vam9icy81MzIxODYKCldlIGNhbm5vdCBnZW5lcmF0ZSBnZW5lcmF0ZWQvZW52
aXJvbm1lbnQuaCBpbiB0b29scy1vbmx5IG1vZGUgd2l0aG91dApyZWFsIGJvYXJkIGJlY2F1c2Ug
ZW52aXJvbm1lbnQgaXMgYWx3YXlzIGJvYXJkIGRlcGVuZGVudC4KClRoZXJlZm9yZSB0aGF0IG5l
dyBlbnYgdG9vbCBoYXMgdG8gYmUgY29tcGlsZWQgb25seSB3aGVuIGRvaW5nIGZ1bGwgcmVhbApi
b2FyZCBidWlsZCwgbm90IGp1c3QgdG9vbHMtb25seSBidWlsZC4KClNvIEkgd291bGQgc3VnZ2Vz
dCB0byBleHRlbmQgTWFrZWZpbGUgcHV0IHRoYXQgbmV3IHRvb2wgdW5kZXIgc29tZSAiaWYiCnRv
IGV4Y2x1ZGUgY29tcGlsYXRpb24gaW4gdG9vbHMtb25seSBtb2RlLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
