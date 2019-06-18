Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9C64A347
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 16:04:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C848ECAD68F
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 14:04:05 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3DD5CAD68E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 14:04:02 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45SqZB0WPmz1rK4C;
 Tue, 18 Jun 2019 16:04:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45SqZ96RPmz1qqkT;
 Tue, 18 Jun 2019 16:04:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Rcmu8sQ3x0d3; Tue, 18 Jun 2019 16:04:00 +0200 (CEST)
X-Auth-Info: zU80CMK2rbSKyNgslMU3WvJZR3SNGc3dql7E50cslS4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 18 Jun 2019 16:04:00 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <1560510512-15015-1-git-send-email-patrick.delaunay@st.com>
 <7f9736b4-9be1-2b4f-b29b-5f612a092de9@denx.de>
 <82d09e04026247b390ba89690bfdd719@SFHDAG6NODE3.st.com>
 <df98be38-1e69-97c3-244e-5482bc5edf41@denx.de>
 <b01140936fb0479697d5347e9e0bd6b4@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=marex@denx.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b9beaa8e-fdf2-3ca3-c582-235f65ef16cf@denx.de>
Date: Tue, 18 Jun 2019 16:04:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b01140936fb0479697d5347e9e0bd6b4@SFHDAG6NODE3.st.com>
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

T24gNi8xOC8xOSAzOjMzIFBNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpIE1hcmVrCj4g
Cj4+IEZyb206IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiBTZW50OiBtYXJkaSAxOCBq
dWluIDIwMTkgMTI6NDkKPj4KPj4gT24gNi8xOC8xOSA5OjMyIEFNLCBQYXRyaWNrIERFTEFVTkFZ
IHdyb3RlOgo+Pj4gSGkgTWFyZWssCj4+Pgo+Pj4+IEZyb206IE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPgo+Pj4+IFNlbnQ6IGx1bmRpIDE3IGp1aW4gMjAxOSAxNzo1NAo+Pj4+Cj4+Pj4gT24g
Ni8xNC8xOSAxOjA4IFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+Pj4+PiBNYW5hZ2UgZy10
eC1maWZvLXNpemUgYXMgYSBhcnJheSBhcyBzcGVjaWZ5IGluIHRoZSBiaW5kaW5nLgo+Pj4+Pgo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0
LmNvbT4KPj4+Pj4gLS0tCj4+Pj4+Cj4+Pj4+ICBhcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZXYx
LXUtYm9vdC5kdHNpIHwgIDQgLS0tLQo+Pj4+PiAgZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRj
X290Zy5jICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKystCj4+Pj4+ICAyIGZpbGVzIGNoYW5n
ZWQsIDE2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZXYxLXUtYm9vdC5kdHNpCj4+Pj4+IGIvYXJj
aC9hcm0vZHRzL3N0bTMybXAxNTdjLWV2MS11LWJvb3QuZHRzaQo+Pj4+PiBpbmRleCA1YjE5ZTQ0
Li45OTQwOTJhIDEwMDY0NAo+Pj4+PiAtLS0gYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZXYx
LXUtYm9vdC5kdHNpCj4+Pj4+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1ldjEtdS1i
b290LmR0c2kKPj4+Pj4gQEAgLTU2LDEwICs1Niw2IEBACj4+Pj4+ICAJfTsKPj4+Pj4gIH07Cj4+
Pj4+Cj4+Pj4+IC0mdXNib3RnX2hzIHsKPj4+Pj4gLQlnLXR4LWZpZm8tc2l6ZSA9IDw1NzY+Owo+
Pj4+Cj4+Pj4gU2hvdWxkIHRoaXMgcmVhbGx5IGJlIGluIHRoaXMgcGF0Y2ggPwo+Pj4KPj4+IEFz
IEkgY2hhbmdlIHRoZSBiaW5kaW5nIHBhcnNpbmcsIHRoZSBzdG0zMm1wMSB3aWxsIGRvbid0IHdv
cmsgd2l0aG91dCB0aGlzCj4+IHBhdGNoLgo+Pj4gSSBtYWtlIGEgY29tbXVuIHBhdGNoIG9ubHkg
dG8gYWxsb3cgYmlzZWMsIGJ1dCBJIGNhbiBzcGxpdCB0aGUgc2VyaWUgd2l0aCAyCj4+IHBhdGNo
ZXMuCj4+Pgo+Pj4+Cj4+Pj4+IC19Owo+Pj4+PiAtCj4+Pj4+ICAmdjN2MyB7Cj4+Pj4+ICAJcmVn
dWxhdG9yLWFsd2F5cy1vbjsKPj4+Pj4gIH07Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9nYWRnZXQvZHdjMl91ZGNfb3RnLmMKPj4+Pj4gYi9kcml2ZXJzL3VzYi9nYWRnZXQvZHdjMl91
ZGNfb3RnLmMKPj4+Pj4gaW5kZXggNDk0YWI1My4uN2U2YjVmYyAxMDA2NDQKPj4+Pj4gLS0tIGEv
ZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRjX290Zy5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvdXNi
L2dhZGdldC9kd2MyX3VkY19vdGcuYwo+Pj4+PiBAQCAtMTAzOSw2ICsxMDM5LDggQEAgc3RhdGlj
IGludAo+Pj4+PiBkd2MyX3VkY19vdGdfb2ZkYXRhX3RvX3BsYXRkYXRhKHN0cnVjdAo+Pj4+IHVk
ZXZpY2UgKmRldikKPj4+Pj4gIAlpbnQgbm9kZSA9IGRldl9vZl9vZmZzZXQoZGV2KTsKPj4+Pj4g
IAl1bG9uZyBkcnZkYXRhOwo+Pj4+PiAgCXZvaWQgKCpzZXRfcGFyYW1zKShzdHJ1Y3QgZHdjMl9w
bGF0X290Z19kYXRhICpkYXRhKTsKPj4+Pj4gKwl1MzIgdHhfZmlmb19zel9hcnJheVtEV0MyX01B
WF9IV19FTkRQT0lOVFNdOwo+Pj4+Cj4+Pj4gQ2FuJ3QgeW91IGp1c3QgcmVhZCBkaXJlY3RseSBp
bnRvIHBsYXRkYXRhLT50eF9maWZvX3N6X2FycmF5W10gYmVsb3csCj4+Pj4gYW5kIHRodXMgZHJv
cCB0aGlzIHRlbXBvcmFyeSB2YXJpYWJsZSA/Cj4+Pgo+Pj4gSXQgd2FzIHRoZSBjYXNlIGluIGlu
IG15IGZpcnN0IGludGVybmFsIHZlcnNpb24uCj4+Pgo+Pj4gaWYgKHBsYXRkYXRhLT50eF9maWZv
X3N6X25iKSB7Cj4+PiAJCXJldCA9IGRldl9yZWFkX3UzMl9hcnJheShkZXYsICJnLXR4LWZpZm8t
c2l6ZSIsCj4+PiAJCQkJCSAmcGxhdGRhdGEtPnR4X2ZpZm9fc3pfYXJyYXksCj4+PiAJCQkJCSBw
bGF0ZGF0YS0+dHhfZmlmb19zel9uYik7Cj4+PiAJCWlmIChyZXQpCj4+PiAJCQlyZXR1cm4gcmV0
Owo+Pj4gCX0KPj4+Cj4+PiBBbmQgSSBhZGQgaXQgdG8gYXZvaWQgdGhlIHdhcm5pbmcgLyBwb3Rl
bnRpYWwgaXNzdWU6Cj4+Pgo+Pj4gL2xvY2FsL2hvbWUvZnJxMDc2MzIvdmlld3MvdS1ib290L3Ut
Cj4+IGJvb3QvZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRjX290Zy5jOjEwNjI6NzoKPj4+IAl3
YXJuaW5nOiBwYXNzaW5nIGFyZ3VtZW50IDMgb2Yg4oCYZGV2X3JlYWRfdTMyX2FycmF54oCZIGZy
b20gaW5jb21wYXRpYmxlCj4+IHBvaW50ZXIgdHlwZSBbLVdpbmNvbXBhdGlibGUtcG9pbnRlci10
eXBlc10KPj4+ICAgICAgICAmcGxhdGRhdGEtPnR4X2ZpZm9fc3pfYXJyYXksCj4+PiAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+PiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2xv
Y2FsL2hvbWUvZnJxMDc2MzIvdmlld3MvdS1ib290L3UtYm9vdC9pbmNsdWRlL2RtLmg6MTIsCj4+
PiAgICAgICAgICAgICAgZnJvbSAvbG9jYWwvaG9tZS9mcnEwNzYzMi92aWV3cy91LWJvb3QvdS0K
Pj4gYm9vdC9kcml2ZXJzL3VzYi9nYWRnZXQvZHdjMl91ZGNfb3RnLmM6MjI6Cj4+PiAJL2xvY2Fs
L2hvbWUvZnJxMDc2MzIvdmlld3MvdS1ib290L3UtYm9vdC9pbmNsdWRlL2RtL3JlYWQuaDo3MTA6
MTU6IG5vdGU6Cj4+IGV4cGVjdGVkIOKAmHUzMiAq4oCZIHtha2Eg4oCYdW5zaWduZWQgaW50ICri
gJl9IGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlIOKAmHVuc2lnbmVkIGludCAoKilbMTZd4oCZCj4+
PiAgICAgICAgICAgdTMyICpvdXRfdmFsdWVzLCBzaXplX3Qgc3opCj4+PiAgICAgICAgICAgfn5+
fn5efn5+fn5+fn5+Cj4+Cj4+IExvb2tzIGxpa2UgR0NDIGlzIGNvbXBsYWluaW5nIGJlY2F1c2Ug
eW91J3JlIHBhc3NpbmcgYW4gYXJyYXkgb2YgcG9pbnRlcnMgdG8KPj4gZGV2X3JlYWRfdTMyX2Fy
cmF5KCkgLCBpbnN0ZWFkIG9mIHBsYWluIHBvaW50ZXIgLgo+Pgo+PiBUcnkKPj4KPj4gIAkJcmV0
ID0gZGV2X3JlYWRfdTMyX2FycmF5KGRldiwgImctdHgtZmlmby1zaXplIiwKPj4gLSAJCQkJCSAm
cGxhdGRhdGEtPnR4X2ZpZm9fc3pfYXJyYXksCj4+ICsgCQkJCQkgcGxhdGRhdGEtPnR4X2ZpZm9f
c3pfYXJyYXksCj4+ICAJCQkJCSBwbGF0ZGF0YS0+dHhfZmlmb19zel9uYik7Cj4gCj4gWW91IGFy
ZSByaWdodCwgaXQgaXMgd29ya2luZwo+IEkgZG9uJ3QgZG91YmxlIGNoZWNrIHRoZSB0eXBlIG9m
IHRoZSBidWZmZXIgOi08Cj4gPT4gSSB3aWxsIHB1c2ggdXBkYXRlIGluIFYyCgpUaGFua3MKCi0t
IApCZXN0IHJlZ2FyZHMsCk1hcmVrIFZhc3V0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
