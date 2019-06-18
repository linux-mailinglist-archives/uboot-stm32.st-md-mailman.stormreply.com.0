Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 016F249E8C
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 12:49:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5669AC60C3E
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 10:49:00 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5988DC5CDA1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 10:48:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45SlF64Mmlz1rJCd;
 Tue, 18 Jun 2019 12:48:58 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45SlF63gFfz1qqkT;
 Tue, 18 Jun 2019 12:48:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id X5VHuoSIT8s9; Tue, 18 Jun 2019 12:48:57 +0200 (CEST)
X-Auth-Info: b8RqW/d1s84YSksULyDnfhmleUjZtwiJo2Kaw/5TUw0=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 18 Jun 2019 12:48:57 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <1560510512-15015-1-git-send-email-patrick.delaunay@st.com>
 <7f9736b4-9be1-2b4f-b29b-5f612a092de9@denx.de>
 <82d09e04026247b390ba89690bfdd719@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=marex@denx.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <df98be38-1e69-97c3-244e-5482bc5edf41@denx.de>
Date: Tue, 18 Jun 2019 12:48:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <82d09e04026247b390ba89690bfdd719@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Lukasz Majewski <lukma@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] usb: dwc2: correctly handle binding
 for g-tx-fifo-size
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

T24gNi8xOC8xOSA5OjMyIEFNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpIE1hcmVrLAo+
IAo+PiBGcm9tOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4gU2VudDogbHVuZGkgMTcg
anVpbiAyMDE5IDE3OjU0Cj4+Cj4+IE9uIDYvMTQvMTkgMTowOCBQTSwgUGF0cmljayBEZWxhdW5h
eSB3cm90ZToKPj4+IE1hbmFnZSBnLXR4LWZpZm8tc2l6ZSBhcyBhIGFycmF5IGFzIHNwZWNpZnkg
aW4gdGhlIGJpbmRpbmcuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8
cGF0cmljay5kZWxhdW5heUBzdC5jb20+Cj4+PiAtLS0KPj4+Cj4+PiAgYXJjaC9hcm0vZHRzL3N0
bTMybXAxNTdjLWV2MS11LWJvb3QuZHRzaSB8ICA0IC0tLS0KPj4+ICBkcml2ZXJzL3VzYi9nYWRn
ZXQvZHdjMl91ZGNfb3RnLmMgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKy0KPj4+ICAyIGZp
bGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1ldjEtdS1ib290LmR0c2kKPj4+IGIv
YXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWV2MS11LWJvb3QuZHRzaQo+Pj4gaW5kZXggNWIxOWU0
NC4uOTk0MDkyYSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1ldjEt
dS1ib290LmR0c2kKPj4+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1ldjEtdS1ib290
LmR0c2kKPj4+IEBAIC01NiwxMCArNTYsNiBAQAo+Pj4gIAl9Owo+Pj4gIH07Cj4+Pgo+Pj4gLSZ1
c2JvdGdfaHMgewo+Pj4gLQlnLXR4LWZpZm8tc2l6ZSA9IDw1NzY+Owo+Pgo+PiBTaG91bGQgdGhp
cyByZWFsbHkgYmUgaW4gdGhpcyBwYXRjaCA/Cj4gCj4gQXMgSSBjaGFuZ2UgdGhlIGJpbmRpbmcg
cGFyc2luZywgdGhlIHN0bTMybXAxIHdpbGwgZG9uJ3Qgd29yayB3aXRob3V0IHRoaXMgcGF0Y2gu
Cj4gSSBtYWtlIGEgY29tbXVuIHBhdGNoIG9ubHkgdG8gYWxsb3cgYmlzZWMsIGJ1dCBJIGNhbiBz
cGxpdCB0aGUgc2VyaWUgd2l0aCAyIHBhdGNoZXMuCj4gCj4+Cj4+PiAtfTsKPj4+IC0KPj4+ICAm
djN2MyB7Cj4+PiAgCXJlZ3VsYXRvci1hbHdheXMtb247Cj4+PiAgfTsKPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9nYWRnZXQvZHdjMl91ZGNfb3RnLmMKPj4+IGIvZHJpdmVycy91c2IvZ2Fk
Z2V0L2R3YzJfdWRjX290Zy5jCj4+PiBpbmRleCA0OTRhYjUzLi43ZTZiNWZjIDEwMDY0NAo+Pj4g
LS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRjX290Zy5jCj4+PiArKysgYi9kcml2ZXJz
L3VzYi9nYWRnZXQvZHdjMl91ZGNfb3RnLmMKPj4+IEBAIC0xMDM5LDYgKzEwMzksOCBAQCBzdGF0
aWMgaW50IGR3YzJfdWRjX290Z19vZmRhdGFfdG9fcGxhdGRhdGEoc3RydWN0Cj4+IHVkZXZpY2Ug
KmRldikKPj4+ICAJaW50IG5vZGUgPSBkZXZfb2Zfb2Zmc2V0KGRldik7Cj4+PiAgCXVsb25nIGRy
dmRhdGE7Cj4+PiAgCXZvaWQgKCpzZXRfcGFyYW1zKShzdHJ1Y3QgZHdjMl9wbGF0X290Z19kYXRh
ICpkYXRhKTsKPj4+ICsJdTMyIHR4X2ZpZm9fc3pfYXJyYXlbRFdDMl9NQVhfSFdfRU5EUE9JTlRT
XTsKPj4KPj4gQ2FuJ3QgeW91IGp1c3QgcmVhZCBkaXJlY3RseSBpbnRvIHBsYXRkYXRhLT50eF9m
aWZvX3N6X2FycmF5W10gYmVsb3csIGFuZCB0aHVzIGRyb3AKPj4gdGhpcyB0ZW1wb3JhcnkgdmFy
aWFibGUgPwo+IAo+IEl0IHdhcyB0aGUgY2FzZSBpbiBpbiBteSBmaXJzdCBpbnRlcm5hbCB2ZXJz
aW9uLgo+IAo+IGlmIChwbGF0ZGF0YS0+dHhfZmlmb19zel9uYikgewo+IAkJcmV0ID0gZGV2X3Jl
YWRfdTMyX2FycmF5KGRldiwgImctdHgtZmlmby1zaXplIiwKPiAJCQkJCSAmcGxhdGRhdGEtPnR4
X2ZpZm9fc3pfYXJyYXksCj4gCQkJCQkgcGxhdGRhdGEtPnR4X2ZpZm9fc3pfbmIpOwo+IAkJaWYg
KHJldCkKPiAJCQlyZXR1cm4gcmV0Owo+IAl9Cj4gCj4gQW5kIEkgYWRkIGl0IHRvIGF2b2lkIHRo
ZSB3YXJuaW5nIC8gcG90ZW50aWFsIGlzc3VlOgo+IAo+IC9sb2NhbC9ob21lL2ZycTA3NjMyL3Zp
ZXdzL3UtYm9vdC91LWJvb3QvZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRjX290Zy5jOjEwNjI6
NzogCj4gCXdhcm5pbmc6IHBhc3NpbmcgYXJndW1lbnQgMyBvZiDigJhkZXZfcmVhZF91MzJfYXJy
YXnigJkgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2luY29tcGF0aWJsZS1wb2lu
dGVyLXR5cGVzXQo+ICAgICAgICAmcGxhdGRhdGEtPnR4X2ZpZm9fc3pfYXJyYXksCj4gICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAvbG9j
YWwvaG9tZS9mcnEwNzYzMi92aWV3cy91LWJvb3QvdS1ib290L2luY2x1ZGUvZG0uaDoxMiwKPiAg
ICAgICAgICAgICAgZnJvbSAvbG9jYWwvaG9tZS9mcnEwNzYzMi92aWV3cy91LWJvb3QvdS1ib290
L2RyaXZlcnMvdXNiL2dhZGdldC9kd2MyX3VkY19vdGcuYzoyMjoKPiAJL2xvY2FsL2hvbWUvZnJx
MDc2MzIvdmlld3MvdS1ib290L3UtYm9vdC9pbmNsdWRlL2RtL3JlYWQuaDo3MTA6MTU6IG5vdGU6
IGV4cGVjdGVkIOKAmHUzMiAq4oCZIHtha2Eg4oCYdW5zaWduZWQgaW50ICrigJl9IGJ1dCBhcmd1
bWVudCBpcyBvZiB0eXBlIOKAmHVuc2lnbmVkIGludCAoKilbMTZd4oCZCj4gICAgICAgICAgIHUz
MiAqb3V0X3ZhbHVlcywgc2l6ZV90IHN6KQo+ICAgICAgICAgICB+fn5+fl5+fn5+fn5+fn4KCkxv
b2tzIGxpa2UgR0NDIGlzIGNvbXBsYWluaW5nIGJlY2F1c2UgeW91J3JlIHBhc3NpbmcgYW4gYXJy
YXkgb2YKcG9pbnRlcnMgdG8gZGV2X3JlYWRfdTMyX2FycmF5KCkgLCBpbnN0ZWFkIG9mIHBsYWlu
IHBvaW50ZXIgLgoKVHJ5CgogCQlyZXQgPSBkZXZfcmVhZF91MzJfYXJyYXkoZGV2LCAiZy10eC1m
aWZvLXNpemUiLAotIAkJCQkJICZwbGF0ZGF0YS0+dHhfZmlmb19zel9hcnJheSwKKyAJCQkJCSBw
bGF0ZGF0YS0+dHhfZmlmb19zel9hcnJheSwKIAkJCQkJIHBsYXRkYXRhLT50eF9maWZvX3N6X25i
KTsKCj4+IGJ0dyBpcyB0aGlzIGZpeCBmb3IgY3VycmVudCByZWxlYXNlIG9yIG5leHQgPwo+IAo+
IEkgaG9wZSBpdCBmb3IgdGhlIHYyMDE5LjA3IChhcyBpdCBpcyBvbmx5IGltcGFjdCB0aGUgc3Rt
MzJtcDEgYXJjaC9ib2FyZCkuIAo+IEJ1dCBpdCBpcyBub3QgYmxvY2tpbmcuCgpPSwoKLS0gCkJl
c3QgcmVnYXJkcywKTWFyZWsgVmFzdXQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
