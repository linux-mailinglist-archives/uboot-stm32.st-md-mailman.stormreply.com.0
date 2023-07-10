Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E1674E06E
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Jul 2023 23:50:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71EDDC6B44C;
	Mon, 10 Jul 2023 21:50:08 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA3E0C6A61D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 21:50:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D3ECD86793;
 Mon, 10 Jul 2023 23:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1689025806;
 bh=V042CkCz7dLvLkgx3ERhTcHX+vLPJBdPHxkxJa6r2eM=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=YmuMwiO27KW4MRpVcUeMfDIYt7jNTvYO3nAPVJRrXGifJn5NZuQCTrS+ENeaPLKeC
 H15hFfH18MMizlJyzg4uA3r2xt3Kx0e4DrEItd3M7biFRK39aj6uoJ7YSvRAAqXLx9
 KHMhvUxN+gxp12kwlKDKZ9UvtAkgbhpvCvFHsAI/ImMUGKSCgzHFvw1bkAe08low/c
 H8qGuQXUrymiG9S3MwsBKAzdgrpRX/hBwFRay2UK+otMT59W8f73NQRNjvPRXdx2k9
 13UfLf41/8hiEa4+feWet9sWJYrM/5l8SS03xyo94PzjnTznuHRHJIikGw3dizsYxT
 1HKwQZVGAFKpg==
Message-ID: <40efc460-899d-f4d6-e79f-5c0e635f4387@denx.de>
Date: Mon, 10 Jul 2023 23:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Marek Vasut <marex@denx.de>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20230517220239.329807-1-marex@denx.de>
 <e171b09d-0e7d-1815-6133-0946212a08d9@foss.st.com>
 <607a112c-4320-5a5f-b988-98e5ea8e3267@denx.de>
 <cb59086b-3212-3b46-990f-c8223a6122a4@denx.de>
 <f418e766-9063-496d-dd5c-05758cbabd38@foss.st.com>
 <bba7dcb0-285a-f3ed-1dcb-d631466c1ee2@denx.de>
Content-Language: en-US
In-Reply-To: <bba7dcb0-285a-f3ed-1dcb-d631466c1ee2@denx.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com, christophe.priouzeau@foss.st.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Power cycle Buck3 in reset on
	DHSOM
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

T24gNi8xNy8yMyAwMjozNiwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNi8xNi8yMyAxNTowNCwg
UGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4gSGksCj4gCj4gSGksCj4gCj4+PiBbwqDCoCAzOS40
MjYwMTVdIERpc2FibGluZyBub24tYm9vdCBDUFVzIC4uLgo+Pj4gW8KgwqAgMzkuNDQ4NjM1XSBS
ZXRyeWluZyBhZ2FpbiB0byBjaGVjayBmb3IgQ1BVIGtpbGwKPj4+IFvCoMKgIDM5LjQ1MTkwOV0g
Q1BVMSBraWxsZWQuCj4+PiBVLUJvb3QgU1BMIDIwMjMuMDctcmM0LTAwMDA4LWcyZjQ2NjRmNWMz
ZSAoSnVuIDE1IDIwMjMgLSAwODozNjo1MiArMDIwMCkKPj4+IFJBTTogRERSMy1ERFIzTCAzMmJp
dHMgNTMzMDAwa0h6Cj4+PiBERFIgaW52YWxpZCBzaXplIDogMHg0LCBleHBlY3RlZCAweDQwMDAw
MDAwCj4+PiBEUkFNIGluaXQgZmFpbGVkOiAtMjIKPj4+ICMjIyBFUlJPUiAjIyMgUGxlYXNlIFJF
U0VUIHRoZSBib2FyZCAjIyMKPj4+Cj4+PiBQcmVzcyBSRVNFVCBidXR0b24KPj4+Cj4+PiBVLUJv
b3QgU1BMIDIwMjMuMDctcmM0LTAwMDA4LWcyZjQ2NjRmNWMzZSAoSnVuIDE1IDIwMjMgLSAwODoz
Njo1MiArMDIwMCkKPj4+IFJBTTogRERSMy1ERFIzTCAzMmJpdHMgNTMzMDAwa0h6Cj4+PiBERFIg
aW52YWxpZCBzaXplIDogMHg0LCBleHBlY3RlZCAweDQwMDAwMDAwCj4+PiBEUkFNIGluaXQgZmFp
bGVkOiAtMjIKPj4+ICMjIyBFUlJPUiAjIyMgUGxlYXNlIFJFU0VUIHRoZSBib2FyZCAjIyMKPj4+
Cj4+Pgo+PiBJIHRyeSBpdCB3aXRoIHRoZSBsYXRlc3QgU1RNaWNyb2VsZWN0cm9uaWNzIE9TUyBp
bWFnZS4KPj4KPj4gSSBqdXN0IGNoYW5nZSBpbiBVLUJvb3QgY29uZmlnIHRvIGJlIGFsaWduZWQg
dGhlIGV4cGVjdGVkIFNELUNhcmQgCj4+IHBhcnRpb25uaW5nCj4+Cj4+IGNvbmZpZ3Mvc3RtMzJt
cDE1X2Jhc2ljX2RlZmNvbmZpZzoKPj4KPj4gLUNPTkZJR19TWVNfTU1DU0RfUkFXX01PREVfVV9C
T09UX1BBUlRJVElPTj0zCj4+ICtDT05GSUdfU1lTX01NQ1NEX1JBV19NT0RFX1VfQk9PVF9QQVJU
SVRJT049NQo+Pgo+PiBCdXQgbG93IHBvd2VyIGlzIG5vdCBzdXBwb3J0ZWQgaW4gdGhpcyBkb3du
c3RyZWFtIGNvbmZpZyA6LTwKPiAKPiBVc2UgbXVsdGlfdjdfZGVmY29uZmlnIG9yIHNvbWUgc3Vj
aCA/Cj4gCj4+IEkgZ290IHRoZSBlcnJvcjoKPj4KPj4KPj4gLi4uLi4uLgo+PiBVLUJvb3QgU1BM
IDIwMjMuMDctcmM0LTAwMDA4LWcyZjQ2NjRmNWMzZWQtZGlydHkgKEp1biAxNiAyMDIzIC0gCj4+
IDExOjM3OjUyICswMjAwKQo+PiBSQU06IEREUjMtRERSM0wgMzJiaXRzIDUzMzAwMGtIego+PiBX
RFQ6wqDCoCBTdGFydGVkIHdhdGNoZG9nQDVhMDAyMDAwIHdpdGggc2VydmljaW5nIGV2ZXJ5IDEw
MDBtcyAoMzJzIAo+PiB0aW1lb3V0KQo+PiBpbWFnZSBlbnRyeSBwb2ludDogMHhjMDEwMDAwMAo+
Pgo+Pgo+PiBVLUJvb3QgMjAyMy4wNy1yYzQtMDAwMDgtZzJmNDY2NGY1YzNlZC1kaXJ0eSAoSnVu
IDE2IDIwMjMgLSAxMTozNzo1MiAKPj4gKzAyMDApCj4+Cj4+IENQVTogU1RNMzJNUDE1N0ZBQSBS
ZXYuWgo+PiBNb2RlbDogU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyTVAxNTdDIGV2YWwgZGF1Z2h0
ZXIgb24gZXZhbCBtb3RoZXIKPj4gQm9hcmQ6IHN0bTMybXAxIGluIGJhc2ljIG1vZGUgKHN0LHN0
bTMybXAxNTdjLWV2MSkKPj4gQm9hcmQ6IE1CMTI2MyBWYXI0LjAgUmV2LkMtMDMKPj4gRFJBTTrC
oCAxIEdpQgo+PiBDbG9ja3M6Cj4+IC0gTVBVIDogODAwIE1Iego+PiAtIE1DVSA6IDIwOC44Nzgg
TUh6Cj4+IC0gQVhJIDogMjY2LjUwMCBNSHoKPj4gLSBQRVIgOiAyNCBNSHoKPj4gLSBERFIgOiA1
MzMgTUh6Cj4+IENvcmU6wqAgMjg4IGRldmljZXMsIDQyIHVjbGFzc2VzLCBkZXZpY2V0cmVlOiBz
ZXBhcmF0ZQo+PiBXRFQ6wqDCoCBTdGFydGVkIHdhdGNoZG9nQDVhMDAyMDAwIHdpdGggc2Vydmlj
aW5nIGV2ZXJ5IDEwMDBtcyAoMzJzIAo+PiB0aW1lb3V0KQo+PiBOQU5EOsKgIDEwMjQgTWlCCj4+
IE1NQzrCoMKgIFNUTTMyIFNEL01NQzogMCwgU1RNMzIgU0QvTU1DOiAxCj4+IExvYWRpbmcgRW52
aXJvbm1lbnQgZnJvbSBNTUMuLi4gSW52YWxpZCBFTlYgb2Zmc2V0IGluIE1NQywgY29weT0wCj4+
IEluOsKgwqDCoCBzZXJpYWwKPj4gT3V0OsKgwqAgc2VyaWFsCj4+IEVycjrCoMKgIHNlcmlhbAo+
PiBOZXQ6wqDCoCBldGgwOiBldGhlcm5ldEA1ODAwYTAwMAo+PiBIaXQgYW55IGtleSB0byBzdG9w
IGF1dG9ib290OsKgIDAKPj4KPj4gLi4uLgo+PiBbwqDCoMKgIDAuMDAwMDAwXSBCb290aW5nIExp
bnV4IG9uIHBoeXNpY2FsIENQVSAweDAKPj4gW8KgwqDCoCAwLjAwMDAwMF0gTGludXggdmVyc2lv
biA2LjQuMC1yYzYgKG9lLXVzZXJAb2UtaG9zdCkgCj4+IChhcm0tb3N0bC1saW51eC1nbnVlYWJp
LWdjYyAoR0NDKSAxMi4yLjAsIEdOVSBsZCAoR05VIEJpbnV0aWxzKSAKPj4gMi40MC4yMDIzMDEx
OSkgIzEgU01QIFBSRUVNUFQgU3VuIEp1biAxMSAyMTozNTozMCBVVEMgMjAyMwo+PiAuLi4uCj4+
IHJvb3RAc3RtMzJtcDEtZGlzY28tb3NzOn4jIHdoaWxlIHRydWUgOyBkbyBydGN3YWtlIC1zIDEw
MCAtbSBtZW0gOyBkb25lCj4+IHJ0Y3dha2U6IHVucmVjb2duaXplZCBzdXNwZW5kIHN0YXRlICdt
ZW0nCj4gCj4gUGxlYXNlIGZpeCB5b3VyIGtlcm5lbCBjb25maWcgYW5kIGVuYWJsZSBzdXNwZW5k
IHRvIG1lbSwgSSBhbSBzdXJlIHRoYXQgCj4gaXMgbm90IGRpZmZpY3VsdC4KPiAKPj4gSSBjaGVj
ayBhbHNvIHdpdGggZG93bnN0cmVhbSAoT3BlblNUTGludXggVjQuMCksCj4gCj4gVGhpcyBpcyBu
b3QgcmVsZXZhbnQgdG8gdGhpcyBkaXNjdXNzaW9uLgo+IAo+PiBhbmQgSSBjYW4ndCByZXByb2R1
Y2VkIHRoZSBpc3N1ZSBidXQgd2UgYXJlIHVzaW5nIFRGLUHCoCAvIE9QLVRFRSAvIAo+PiBTQ01J
IHRvIHN1cHBvcnQgYWxsIHRoZSBsb3cgcG93ZXIgbW9kZXMuCj4+Cj4+Cj4+IEFuZCB0aGlzIGxv
dyBwb3dlciBzdXBwb3J0IChpbiBURi1BLyBPUC1URUUgLyBMaW51eCB3aXRoIFNDTUkpIGlzIG5v
dCAKPj4geWV0IHVwIHN0cmVhbWVkLgo+Pgo+Pgo+PiBQUzogaWYgeW91IGFyZSBub3QgYWJsZSB0
byByZXN0YXJ0IGV2ZW4gYWZ0ZXIgYSBSRVNFVCwKPj4gwqDCoMKgwqDCoMKgIEkgYXNzdW1lIHNv
bWV0aGluZyBpcyB3cm9uZyBpbiB0aGUgUE1JQyBjb25maWd1cmF0aW9uCj4+Cj4+IMKgwqDCoMKg
wqDCoCAoZm9yIGV4YW1wbGUgaW4gTlZNIG9yIGluIGluaXRpYWwgcmVndWxhdG9yIGNvbmZpZ3Vy
YXRpb24pCj4+Cj4+IMKgwqDCoMKgwqDCoCBzbyB5b3UgaGF2ZSBubyBwb3dlciBjeWNsZSBvbiBE
RFIgZHVyaW5nIHJlc2V0Li4uCj4+Cj4+IMKgwqAgwqAgwqDCoCA9PiBzb21ldGhpbmcgaXMgd3Jv
bmcgaW4gUE1JQyBjb25maWd1cmF0aW9uIGluIGxpbnV4ID8KPiAKPiBQb3NzaWJseSwgYnV0IHRo
ZW4gaXQgaXMgYWxzbyBzb21ldGhpbmcgd3Jvbmcgb24gU1RNMzJNUDE1N0MgRVYxLCAKPiBiZWNh
dXNlIEkgY2FuIHJlcHJvZHVjZSB0aGUgZmFpbHVyZSBvbiBFVjEgdG9vLiBJIHNwZWNpZmljYWxs
eSBkaWQgY2hlY2sgCj4gdGhpcyBvbiB0aGUgRVYxLiBQbGVhc2UgZml4IHlvdXIga2VybmVsIGNv
bmZpZyBhbmQgdHJ5IGFnYWluLCB0aGVuIHlvdSAKPiBzaG91bGQgYmUgYWJsZSB0byBzZWUgaXQg
eW91cnNlbGYuCgpIYXMgdGhlcmUgYmVlbiBhbnkgbmV3cyBvbiB0aGlzIGRlZmVjdCBvZiBFVjEg
b3IgaGFzIHRoaXMgYmVlbiBpZ25vcmVkIApieSBTVCA/Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
