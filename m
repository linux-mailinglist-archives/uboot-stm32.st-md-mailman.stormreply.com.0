Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C597C62BC
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Oct 2023 04:28:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9474C6B45E;
	Thu, 12 Oct 2023 02:28:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EE71C6B44B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 02:28:50 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4D14386B36;
 Thu, 12 Oct 2023 04:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1697077729;
 bh=CTYrLo/Tab4P/z3iSlwnJgvCZb5gn41sja33LOKnZKw=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Qnztq23X8bJPlC78kZ+aVnzwsWWZC8/jizW1eHswnUl2MKbOKYm3467ewNEUIZNDT
 Pj7BXhCCKmwfim5emNV/r6ptNQIUmzbpNs0w0CJ+UfT0W6TQMUMb4BoE6+CRIyYpm+
 7weVpdE5u5zf0v3q0MIK9nr6GhXXrUipAwI5SH+OnlPeJmBbc1a/uTm5ioIZ4fKyjx
 szuxf7pdOQA+yn3oAG0OIXHtekfyIacdxe8CjVlMP8OVUpz30ToAaCxwVHfR4eyQKT
 KEQjvBQ9qOoMBcCo3Yf00wAAGHyg/DYz+7C1tL/WsrgCxWsavcX+1ndWZOGkBywnBZ
 OJwOz75YLHLyQ==
Message-ID: <aa9347dc-9d2e-48af-b8be-5b0db4d398db@denx.de>
Date: Thu, 12 Oct 2023 04:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20230517220239.329807-1-marex@denx.de>
 <e171b09d-0e7d-1815-6133-0946212a08d9@foss.st.com>
 <607a112c-4320-5a5f-b988-98e5ea8e3267@denx.de>
 <cb59086b-3212-3b46-990f-c8223a6122a4@denx.de>
 <f418e766-9063-496d-dd5c-05758cbabd38@foss.st.com>
 <bba7dcb0-285a-f3ed-1dcb-d631466c1ee2@denx.de>
 <40efc460-899d-f4d6-e79f-5c0e635f4387@denx.de>
 <fe65f376-a188-3f72-b6f8-58bd2a65542c@foss.st.com>
 <532a3a0c-389f-6945-9a20-0a523caebeae@denx.de>
In-Reply-To: <532a3a0c-389f-6945-9a20-0a523caebeae@denx.de>
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

T24gOC8xNi8yMyAxNToyOCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gOC8xNi8yMyAxNToyMiwg
UGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+Pgo+Pgo+PiBPbiA3LzEwLzIzIDIzOjQzLCBNYXJlayBW
YXN1dCB3cm90ZToKPj4+IE9uIDYvMTcvMjMgMDI6MzYsIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4+
IE9uIDYvMTYvMjMgMTU6MDQsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+Pj4+IEhpLAo+Pj4+
Cj4+Pj4gSGksCj4+Pj4KPj4+Pj4+IFvCoMKgIDM5LjQyNjAxNV0gRGlzYWJsaW5nIG5vbi1ib290
IENQVXMgLi4uCj4+Pj4+PiBbwqDCoCAzOS40NDg2MzVdIFJldHJ5aW5nIGFnYWluIHRvIGNoZWNr
IGZvciBDUFUga2lsbAo+Pj4+Pj4gW8KgwqAgMzkuNDUxOTA5XSBDUFUxIGtpbGxlZC4KPj4+Pj4+
IFUtQm9vdCBTUEwgMjAyMy4wNy1yYzQtMDAwMDgtZzJmNDY2NGY1YzNlIChKdW4gMTUgMjAyMyAt
IDA4OjM2OjUyIAo+Pj4+Pj4gKzAyMDApCj4+Pj4+PiBSQU06IEREUjMtRERSM0wgMzJiaXRzIDUz
MzAwMGtIego+Pj4+Pj4gRERSIGludmFsaWQgc2l6ZSA6IDB4NCwgZXhwZWN0ZWQgMHg0MDAwMDAw
MAo+Pj4+Pj4gRFJBTSBpbml0IGZhaWxlZDogLTIyCj4+Pj4+PiAjIyMgRVJST1IgIyMjIFBsZWFz
ZSBSRVNFVCB0aGUgYm9hcmQgIyMjCj4+Pj4+Pgo+Pj4+Pj4gUHJlc3MgUkVTRVQgYnV0dG9uCj4+
Pj4+Pgo+Pj4+Pj4gVS1Cb290IFNQTCAyMDIzLjA3LXJjNC0wMDAwOC1nMmY0NjY0ZjVjM2UgKEp1
biAxNSAyMDIzIC0gMDg6MzY6NTIgCj4+Pj4+PiArMDIwMCkKPj4+Pj4+IFJBTTogRERSMy1ERFIz
TCAzMmJpdHMgNTMzMDAwa0h6Cj4+Pj4+PiBERFIgaW52YWxpZCBzaXplIDogMHg0LCBleHBlY3Rl
ZCAweDQwMDAwMDAwCj4+Pj4+PiBEUkFNIGluaXQgZmFpbGVkOiAtMjIKPj4+Pj4+ICMjIyBFUlJP
UiAjIyMgUGxlYXNlIFJFU0VUIHRoZSBib2FyZCAjIyMKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+PiBJIHRy
eSBpdCB3aXRoIHRoZSBsYXRlc3QgU1RNaWNyb2VsZWN0cm9uaWNzIE9TUyBpbWFnZS4KPj4+Pj4K
Pj4+Pj4gSSBqdXN0IGNoYW5nZSBpbiBVLUJvb3QgY29uZmlnIHRvIGJlIGFsaWduZWQgdGhlIGV4
cGVjdGVkIFNELUNhcmQgCj4+Pj4+IHBhcnRpb25uaW5nCj4+Pj4+Cj4+Pj4+IGNvbmZpZ3Mvc3Rt
MzJtcDE1X2Jhc2ljX2RlZmNvbmZpZzoKPj4+Pj4KPj4+Pj4gLUNPTkZJR19TWVNfTU1DU0RfUkFX
X01PREVfVV9CT09UX1BBUlRJVElPTj0zCj4+Pj4+ICtDT05GSUdfU1lTX01NQ1NEX1JBV19NT0RF
X1VfQk9PVF9QQVJUSVRJT049NQo+Pj4+Pgo+Pj4+PiBCdXQgbG93IHBvd2VyIGlzIG5vdCBzdXBw
b3J0ZWQgaW4gdGhpcyBkb3duc3RyZWFtIGNvbmZpZyA6LTwKPj4+Pgo+Pj4+IFVzZSBtdWx0aV92
N19kZWZjb25maWcgb3Igc29tZSBzdWNoID8KPj4+Pgo+Pj4+PiBJIGdvdCB0aGUgZXJyb3I6Cj4+
Pj4+Cj4+Pj4+Cj4+Pj4+IC4uLi4uLi4KPj4+Pj4gVS1Cb290IFNQTCAyMDIzLjA3LXJjNC0wMDAw
OC1nMmY0NjY0ZjVjM2VkLWRpcnR5IChKdW4gMTYgMjAyMyAtIAo+Pj4+PiAxMTozNzo1MiArMDIw
MCkKPj4+Pj4gUkFNOiBERFIzLUREUjNMIDMyYml0cyA1MzMwMDBrSHoKPj4+Pj4gV0RUOsKgwqAg
U3RhcnRlZCB3YXRjaGRvZ0A1YTAwMjAwMCB3aXRoIHNlcnZpY2luZyBldmVyeSAxMDAwbXMgKDMy
cyAKPj4+Pj4gdGltZW91dCkKPj4+Pj4gaW1hZ2UgZW50cnkgcG9pbnQ6IDB4YzAxMDAwMDAKPj4+
Pj4KPj4+Pj4KPj4+Pj4gVS1Cb290IDIwMjMuMDctcmM0LTAwMDA4LWcyZjQ2NjRmNWMzZWQtZGly
dHkgKEp1biAxNiAyMDIzIC0gCj4+Pj4+IDExOjM3OjUyICswMjAwKQo+Pj4+Pgo+Pj4+PiBDUFU6
IFNUTTMyTVAxNTdGQUEgUmV2LloKPj4+Pj4gTW9kZWw6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0z
Mk1QMTU3QyBldmFsIGRhdWdodGVyIG9uIGV2YWwgbW90aGVyCj4+Pj4+IEJvYXJkOiBzdG0zMm1w
MSBpbiBiYXNpYyBtb2RlIChzdCxzdG0zMm1wMTU3Yy1ldjEpCj4+Pj4+IEJvYXJkOiBNQjEyNjMg
VmFyNC4wIFJldi5DLTAzCj4+Pj4+IERSQU06wqAgMSBHaUIKPj4+Pj4gQ2xvY2tzOgo+Pj4+PiAt
IE1QVSA6IDgwMCBNSHoKPj4+Pj4gLSBNQ1UgOiAyMDguODc4IE1Iego+Pj4+PiAtIEFYSSA6IDI2
Ni41MDAgTUh6Cj4+Pj4+IC0gUEVSIDogMjQgTUh6Cj4+Pj4+IC0gRERSIDogNTMzIE1Iego+Pj4+
PiBDb3JlOsKgIDI4OCBkZXZpY2VzLCA0MiB1Y2xhc3NlcywgZGV2aWNldHJlZTogc2VwYXJhdGUK
Pj4+Pj4gV0RUOsKgwqAgU3RhcnRlZCB3YXRjaGRvZ0A1YTAwMjAwMCB3aXRoIHNlcnZpY2luZyBl
dmVyeSAxMDAwbXMgKDMycyAKPj4+Pj4gdGltZW91dCkKPj4+Pj4gTkFORDrCoCAxMDI0IE1pQgo+
Pj4+PiBNTUM6wqDCoCBTVE0zMiBTRC9NTUM6IDAsIFNUTTMyIFNEL01NQzogMQo+Pj4+PiBMb2Fk
aW5nIEVudmlyb25tZW50IGZyb20gTU1DLi4uIEludmFsaWQgRU5WIG9mZnNldCBpbiBNTUMsIGNv
cHk9MAo+Pj4+PiBJbjrCoMKgwqAgc2VyaWFsCj4+Pj4+IE91dDrCoMKgIHNlcmlhbAo+Pj4+PiBF
cnI6wqDCoCBzZXJpYWwKPj4+Pj4gTmV0OsKgwqAgZXRoMDogZXRoZXJuZXRANTgwMGEwMDAKPj4+
Pj4gSGl0IGFueSBrZXkgdG8gc3RvcCBhdXRvYm9vdDrCoCAwCj4+Pj4+Cj4+Pj4+IC4uLi4KPj4+
Pj4gW8KgwqDCoCAwLjAwMDAwMF0gQm9vdGluZyBMaW51eCBvbiBwaHlzaWNhbCBDUFUgMHgwCj4+
Pj4+IFvCoMKgwqAgMC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNi40LjAtcmM2IChvZS11c2VyQG9l
LWhvc3QpIAo+Pj4+PiAoYXJtLW9zdGwtbGludXgtZ251ZWFiaS1nY2MgKEdDQykgMTIuMi4wLCBH
TlUgbGQgKEdOVSBCaW51dGlscykgCj4+Pj4+IDIuNDAuMjAyMzAxMTkpICMxIFNNUCBQUkVFTVBU
IFN1biBKdW4gMTEgMjE6MzU6MzAgVVRDIDIwMjMKPj4+Pj4gLi4uLgo+Pj4+PiByb290QHN0bTMy
bXAxLWRpc2NvLW9zczp+IyB3aGlsZSB0cnVlIDsgZG8gcnRjd2FrZSAtcyAxMDAgLW0gbWVtIDsg
Cj4+Pj4+IGRvbmUKPj4+Pj4gcnRjd2FrZTogdW5yZWNvZ25pemVkIHN1c3BlbmQgc3RhdGUgJ21l
bScKPj4+Pgo+Pj4+IFBsZWFzZSBmaXggeW91ciBrZXJuZWwgY29uZmlnIGFuZCBlbmFibGUgc3Vz
cGVuZCB0byBtZW0sIEkgYW0gc3VyZSAKPj4+PiB0aGF0IGlzIG5vdCBkaWZmaWN1bHQuCj4+Pj4K
Pj4+Pj4gSSBjaGVjayBhbHNvIHdpdGggZG93bnN0cmVhbSAoT3BlblNUTGludXggVjQuMCksCj4+
Pj4KPj4+PiBUaGlzIGlzIG5vdCByZWxldmFudCB0byB0aGlzIGRpc2N1c3Npb24uCj4+Pj4KPj4+
Pj4gYW5kIEkgY2FuJ3QgcmVwcm9kdWNlZCB0aGUgaXNzdWUgYnV0IHdlIGFyZSB1c2luZyBURi1B
wqAgLyBPUC1URUUgLyAKPj4+Pj4gU0NNSSB0byBzdXBwb3J0IGFsbCB0aGUgbG93IHBvd2VyIG1v
ZGVzLgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBBbmQgdGhpcyBsb3cgcG93ZXIgc3VwcG9ydCAoaW4gVEYt
QS8gT1AtVEVFIC8gTGludXggd2l0aCBTQ01JKSBpcyAKPj4+Pj4gbm90IHlldCB1cCBzdHJlYW1l
ZC4KPj4+Pj4KPj4+Pj4KPj4+Pj4gUFM6IGlmIHlvdSBhcmUgbm90IGFibGUgdG8gcmVzdGFydCBl
dmVuIGFmdGVyIGEgUkVTRVQsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgIEkgYXNzdW1lIHNvbWV0aGlu
ZyBpcyB3cm9uZyBpbiB0aGUgUE1JQyBjb25maWd1cmF0aW9uCj4+Pj4+Cj4+Pj4+IMKgwqDCoMKg
wqDCoMKgIChmb3IgZXhhbXBsZSBpbiBOVk0gb3IgaW4gaW5pdGlhbCByZWd1bGF0b3IgY29uZmln
dXJhdGlvbikKPj4+Pj4KPj4+Pj4gwqDCoMKgwqDCoMKgwqAgc28geW91IGhhdmUgbm8gcG93ZXIg
Y3ljbGUgb24gRERSIGR1cmluZyByZXNldC4uLgo+Pj4+Pgo+Pj4+PiDCoMKgwqAgwqAgwqDCoCA9
PiBzb21ldGhpbmcgaXMgd3JvbmcgaW4gUE1JQyBjb25maWd1cmF0aW9uIGluIGxpbnV4ID8KPj4+
Pgo+Pj4+IFBvc3NpYmx5LCBidXQgdGhlbiBpdCBpcyBhbHNvIHNvbWV0aGluZyB3cm9uZyBvbiBT
VE0zMk1QMTU3QyBFVjEsIAo+Pj4+IGJlY2F1c2UgSSBjYW4gcmVwcm9kdWNlIHRoZSBmYWlsdXJl
IG9uIEVWMSB0b28uIEkgc3BlY2lmaWNhbGx5IGRpZCAKPj4+PiBjaGVjayB0aGlzIG9uIHRoZSBF
VjEuIFBsZWFzZSBmaXggeW91ciBrZXJuZWwgY29uZmlnIGFuZCB0cnkgYWdhaW4sIAo+Pj4+IHRo
ZW4geW91IHNob3VsZCBiZSBhYmxlIHRvIHNlZSBpdCB5b3Vyc2VsZi4KPj4+Cj4+PiBIYXMgdGhl
cmUgYmVlbiBhbnkgbmV3cyBvbiB0aGlzIGRlZmVjdCBvZiBFVjEgb3IgaGFzIHRoaXMgYmVlbiAK
Pj4+IGlnbm9yZWQgYnkgU1QgPwo+Pgo+PiBIaSBNYXJlawo+IAo+IEhpLAo+IAo+PiBTb3JyeSBm
b3IgdGhlIGRlbGF5LAo+IAo+IE5vIHdvcnJpZXMuCj4gCj4gV2hhdCBJIGFtIG1vcmUgY29uY2Vy
bmVkIGFib3V0IGlzIC0tIHdoeSBpcyB0aGlzIHByb2JsZW0gcHJlc2VudCBvbiBFVjEgCj4gdG9v
IGFuZCBob3cgdG8gc29sdmUgaXQgdGhlcmUgPyAoYW5kIG5vLCAiYWRkIG1vcmUgdW5uZWNlc3Nh
cnkgc29mdHdhcmUgCj4gdG8gdGhlIHN0YWNrIHRvIGNvdmVyIHRoaXMgdXAiIGlzIG5vdCB0aGUg
YW5zd2VyKQoKSSByYW4gaW50byB0aGlzIGRlZmVjdCBhZ2FpbiwgaXQgc2VlbXMgdGhlIEVWMSBw
cm9ibGVtIGlzIGlnbm9yZWQgYnkgU1QsIApvciBhcmUgdGhlcmUgYW55IG5ld3MgPwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
