Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B13A77E28B
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Aug 2023 15:28:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10D9FC6B45F;
	Wed, 16 Aug 2023 13:28:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EDA7C6B45E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 13:28:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7FC0E80740;
 Wed, 16 Aug 2023 15:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1692192485;
 bh=iQNXWnjnNjxsM7qrXx78M/cR39jkYt4MdG05ioQEopU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wEZLe8HtPeXcTQ56mCSVeXwAVNBcLq4fXi0+FX+KgRq2PE2aYc3hy8fYHknxnp/ek
 zY4nAooF14DWwMY/oGm76Xp6nYR4GiXfLT9EA/Yw7ykgmEnkQN/llqlW9BYqP6ec1L
 XTR+1EEBtvjwpoCeepB9u7C9dEhUUqPqadx9Uxv3SYOLP1+vBEmLwAgrlL8tE7LVdl
 57uBANZO7OuS6j6uy99dVa6WHMbLvTHiI9g6lJH3sRd814srnWDThTbWqlSLKQix5i
 lkysLk9PAjtYPeeeSSHabEkKDMm8M7iTOLpzgCb/wHaoZk02iRBN2BSpyFGIa7zDKf
 OUbuaNhciTsSg==
Message-ID: <532a3a0c-389f-6945-9a20-0a523caebeae@denx.de>
Date: Wed, 16 Aug 2023 15:28:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <fe65f376-a188-3f72-b6f8-58bd2a65542c@foss.st.com>
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

T24gOC8xNi8yMyAxNToyMiwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IAo+IAo+IE9uIDcvMTAv
MjMgMjM6NDMsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiA2LzE3LzIzIDAyOjM2LCBNYXJlayBW
YXN1dCB3cm90ZToKPj4+IE9uIDYvMTYvMjMgMTU6MDQsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6
Cj4+Pj4gSGksCj4+Pgo+Pj4gSGksCj4+Pgo+Pj4+PiBbwqDCoCAzOS40MjYwMTVdIERpc2FibGlu
ZyBub24tYm9vdCBDUFVzIC4uLgo+Pj4+PiBbwqDCoCAzOS40NDg2MzVdIFJldHJ5aW5nIGFnYWlu
IHRvIGNoZWNrIGZvciBDUFUga2lsbAo+Pj4+PiBbwqDCoCAzOS40NTE5MDldIENQVTEga2lsbGVk
Lgo+Pj4+PiBVLUJvb3QgU1BMIDIwMjMuMDctcmM0LTAwMDA4LWcyZjQ2NjRmNWMzZSAoSnVuIDE1
IDIwMjMgLSAwODozNjo1MiArMDIwMCkKPj4+Pj4gUkFNOiBERFIzLUREUjNMIDMyYml0cyA1MzMw
MDBrSHoKPj4+Pj4gRERSIGludmFsaWQgc2l6ZSA6IDB4NCwgZXhwZWN0ZWQgMHg0MDAwMDAwMAo+
Pj4+PiBEUkFNIGluaXQgZmFpbGVkOiAtMjIKPj4+Pj4gIyMjIEVSUk9SICMjIyBQbGVhc2UgUkVT
RVQgdGhlIGJvYXJkICMjIwo+Pj4+Pgo+Pj4+PiBQcmVzcyBSRVNFVCBidXR0b24KPj4+Pj4KPj4+
Pj4gVS1Cb290IFNQTCAyMDIzLjA3LXJjNC0wMDAwOC1nMmY0NjY0ZjVjM2UgKEp1biAxNSAyMDIz
IC0gMDg6MzY6NTIgKzAyMDApCj4+Pj4+IFJBTTogRERSMy1ERFIzTCAzMmJpdHMgNTMzMDAwa0h6
Cj4+Pj4+IEREUiBpbnZhbGlkIHNpemUgOiAweDQsIGV4cGVjdGVkIDB4NDAwMDAwMDAKPj4+Pj4g
RFJBTSBpbml0IGZhaWxlZDogLTIyCj4+Pj4+ICMjIyBFUlJPUiAjIyMgUGxlYXNlIFJFU0VUIHRo
ZSBib2FyZCAjIyMKPj4+Pj4KPj4+Pj4KPj4+PiBJIHRyeSBpdCB3aXRoIHRoZSBsYXRlc3QgU1RN
aWNyb2VsZWN0cm9uaWNzIE9TUyBpbWFnZS4KPj4+Pgo+Pj4+IEkganVzdCBjaGFuZ2UgaW4gVS1C
b290IGNvbmZpZyB0byBiZSBhbGlnbmVkIHRoZSBleHBlY3RlZCBTRC1DYXJkIHBhcnRpb25uaW5n
Cj4+Pj4KPj4+PiBjb25maWdzL3N0bTMybXAxNV9iYXNpY19kZWZjb25maWc6Cj4+Pj4KPj4+PiAt
Q09ORklHX1NZU19NTUNTRF9SQVdfTU9ERV9VX0JPT1RfUEFSVElUSU9OPTMKPj4+PiArQ09ORklH
X1NZU19NTUNTRF9SQVdfTU9ERV9VX0JPT1RfUEFSVElUSU9OPTUKPj4+Pgo+Pj4+IEJ1dCBsb3cg
cG93ZXIgaXMgbm90IHN1cHBvcnRlZCBpbiB0aGlzIGRvd25zdHJlYW0gY29uZmlnIDotPAo+Pj4K
Pj4+IFVzZSBtdWx0aV92N19kZWZjb25maWcgb3Igc29tZSBzdWNoID8KPj4+Cj4+Pj4gSSBnb3Qg
dGhlIGVycm9yOgo+Pj4+Cj4+Pj4KPj4+PiAuLi4uLi4uCj4+Pj4gVS1Cb290IFNQTCAyMDIzLjA3
LXJjNC0wMDAwOC1nMmY0NjY0ZjVjM2VkLWRpcnR5IChKdW4gMTYgMjAyMyAtIDExOjM3OjUyICsw
MjAwKQo+Pj4+IFJBTTogRERSMy1ERFIzTCAzMmJpdHMgNTMzMDAwa0h6Cj4+Pj4gV0RUOsKgwqAg
U3RhcnRlZCB3YXRjaGRvZ0A1YTAwMjAwMCB3aXRoIHNlcnZpY2luZyBldmVyeSAxMDAwbXMgKDMy
cyB0aW1lb3V0KQo+Pj4+IGltYWdlIGVudHJ5IHBvaW50OiAweGMwMTAwMDAwCj4+Pj4KPj4+Pgo+
Pj4+IFUtQm9vdCAyMDIzLjA3LXJjNC0wMDAwOC1nMmY0NjY0ZjVjM2VkLWRpcnR5IChKdW4gMTYg
MjAyMyAtIDExOjM3OjUyICswMjAwKQo+Pj4+Cj4+Pj4gQ1BVOiBTVE0zMk1QMTU3RkFBIFJldi5a
Cj4+Pj4gTW9kZWw6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMk1QMTU3QyBldmFsIGRhdWdodGVy
IG9uIGV2YWwgbW90aGVyCj4+Pj4gQm9hcmQ6IHN0bTMybXAxIGluIGJhc2ljIG1vZGUgKHN0LHN0
bTMybXAxNTdjLWV2MSkKPj4+PiBCb2FyZDogTUIxMjYzIFZhcjQuMCBSZXYuQy0wMwo+Pj4+IERS
QU06wqAgMSBHaUIKPj4+PiBDbG9ja3M6Cj4+Pj4gLSBNUFUgOiA4MDAgTUh6Cj4+Pj4gLSBNQ1Ug
OiAyMDguODc4IE1Iego+Pj4+IC0gQVhJIDogMjY2LjUwMCBNSHoKPj4+PiAtIFBFUiA6IDI0IE1I
ego+Pj4+IC0gRERSIDogNTMzIE1Iego+Pj4+IENvcmU6wqAgMjg4IGRldmljZXMsIDQyIHVjbGFz
c2VzLCBkZXZpY2V0cmVlOiBzZXBhcmF0ZQo+Pj4+IFdEVDrCoMKgIFN0YXJ0ZWQgd2F0Y2hkb2dA
NWEwMDIwMDAgd2l0aCBzZXJ2aWNpbmcgZXZlcnkgMTAwMG1zICgzMnMgdGltZW91dCkKPj4+PiBO
QU5EOsKgIDEwMjQgTWlCCj4+Pj4gTU1DOsKgwqAgU1RNMzIgU0QvTU1DOiAwLCBTVE0zMiBTRC9N
TUM6IDEKPj4+PiBMb2FkaW5nIEVudmlyb25tZW50IGZyb20gTU1DLi4uIEludmFsaWQgRU5WIG9m
ZnNldCBpbiBNTUMsIGNvcHk9MAo+Pj4+IEluOsKgwqDCoCBzZXJpYWwKPj4+PiBPdXQ6wqDCoCBz
ZXJpYWwKPj4+PiBFcnI6wqDCoCBzZXJpYWwKPj4+PiBOZXQ6wqDCoCBldGgwOiBldGhlcm5ldEA1
ODAwYTAwMAo+Pj4+IEhpdCBhbnkga2V5IHRvIHN0b3AgYXV0b2Jvb3Q6wqAgMAo+Pj4+Cj4+Pj4g
Li4uLgo+Pj4+IFvCoMKgwqAgMC4wMDAwMDBdIEJvb3RpbmcgTGludXggb24gcGh5c2ljYWwgQ1BV
IDB4MAo+Pj4+IFvCoMKgwqAgMC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNi40LjAtcmM2IChvZS11
c2VyQG9lLWhvc3QpIChhcm0tb3N0bC1saW51eC1nbnVlYWJpLWdjYyAoR0NDKSAxMi4yLjAsIEdO
VSBsZCAoR05VIEJpbnV0aWxzKSAyLjQwLjIwMjMwMTE5KSAjMSBTTVAgUFJFRU1QVCBTdW4gSnVu
IDExIDIxOjM1OjMwIFVUQyAyMDIzCj4+Pj4gLi4uLgo+Pj4+IHJvb3RAc3RtMzJtcDEtZGlzY28t
b3NzOn4jIHdoaWxlIHRydWUgOyBkbyBydGN3YWtlIC1zIDEwMCAtbSBtZW0gOyBkb25lCj4+Pj4g
cnRjd2FrZTogdW5yZWNvZ25pemVkIHN1c3BlbmQgc3RhdGUgJ21lbScKPj4+Cj4+PiBQbGVhc2Ug
Zml4IHlvdXIga2VybmVsIGNvbmZpZyBhbmQgZW5hYmxlIHN1c3BlbmQgdG8gbWVtLCBJIGFtIHN1
cmUgdGhhdCBpcyBub3QgZGlmZmljdWx0Lgo+Pj4KPj4+PiBJIGNoZWNrIGFsc28gd2l0aCBkb3du
c3RyZWFtIChPcGVuU1RMaW51eCBWNC4wKSwKPj4+Cj4+PiBUaGlzIGlzIG5vdCByZWxldmFudCB0
byB0aGlzIGRpc2N1c3Npb24uCj4+Pgo+Pj4+IGFuZCBJIGNhbid0IHJlcHJvZHVjZWQgdGhlIGlz
c3VlIGJ1dCB3ZSBhcmUgdXNpbmcgVEYtQcKgIC8gT1AtVEVFIC8gU0NNSSB0byBzdXBwb3J0IGFs
bCB0aGUgbG93IHBvd2VyIG1vZGVzLgo+Pj4+Cj4+Pj4KPj4+PiBBbmQgdGhpcyBsb3cgcG93ZXIg
c3VwcG9ydCAoaW4gVEYtQS8gT1AtVEVFIC8gTGludXggd2l0aCBTQ01JKSBpcyBub3QgeWV0IHVw
IHN0cmVhbWVkLgo+Pj4+Cj4+Pj4KPj4+PiBQUzogaWYgeW91IGFyZSBub3QgYWJsZSB0byByZXN0
YXJ0IGV2ZW4gYWZ0ZXIgYSBSRVNFVCwKPj4+PiAgwqDCoMKgwqDCoMKgIEkgYXNzdW1lIHNvbWV0
aGluZyBpcyB3cm9uZyBpbiB0aGUgUE1JQyBjb25maWd1cmF0aW9uCj4+Pj4KPj4+PiAgwqDCoMKg
wqDCoMKgIChmb3IgZXhhbXBsZSBpbiBOVk0gb3IgaW4gaW5pdGlhbCByZWd1bGF0b3IgY29uZmln
dXJhdGlvbikKPj4+Pgo+Pj4+ICDCoMKgwqDCoMKgwqAgc28geW91IGhhdmUgbm8gcG93ZXIgY3lj
bGUgb24gRERSIGR1cmluZyByZXNldC4uLgo+Pj4+Cj4+Pj4gIMKgwqAgwqAgwqDCoCA9PiBzb21l
dGhpbmcgaXMgd3JvbmcgaW4gUE1JQyBjb25maWd1cmF0aW9uIGluIGxpbnV4ID8KPj4+Cj4+PiBQ
b3NzaWJseSwgYnV0IHRoZW4gaXQgaXMgYWxzbyBzb21ldGhpbmcgd3Jvbmcgb24gU1RNMzJNUDE1
N0MgRVYxLCBiZWNhdXNlIEkgY2FuIHJlcHJvZHVjZSB0aGUgZmFpbHVyZSBvbiBFVjEgdG9vLiBJ
IHNwZWNpZmljYWxseSBkaWQgY2hlY2sgdGhpcyBvbiB0aGUgRVYxLiBQbGVhc2UgZml4IHlvdXIg
a2VybmVsIGNvbmZpZyBhbmQgdHJ5IGFnYWluLCB0aGVuIHlvdSBzaG91bGQgYmUgYWJsZSB0byBz
ZWUgaXQgeW91cnNlbGYuCj4+Cj4+IEhhcyB0aGVyZSBiZWVuIGFueSBuZXdzIG9uIHRoaXMgZGVm
ZWN0IG9mIEVWMSBvciBoYXMgdGhpcyBiZWVuIGlnbm9yZWQgYnkgU1QgPwo+IAo+IEhpIE1hcmVr
CgpIaSwKCj4gU29ycnkgZm9yIHRoZSBkZWxheSwKCk5vIHdvcnJpZXMuCgpXaGF0IEkgYW0gbW9y
ZSBjb25jZXJuZWQgYWJvdXQgaXMgLS0gd2h5IGlzIHRoaXMgcHJvYmxlbSBwcmVzZW50IG9uIEVW
MSAKdG9vIGFuZCBob3cgdG8gc29sdmUgaXQgdGhlcmUgPyAoYW5kIG5vLCAiYWRkIG1vcmUgdW5u
ZWNlc3Nhcnkgc29mdHdhcmUgCnRvIHRoZSBzdGFjayB0byBjb3ZlciB0aGlzIHVwIiBpcyBub3Qg
dGhlIGFuc3dlcikKCj4gUGF0Y2ggYXBwbGllZCBvbiBzdG0zMi1tYXN0ZXIKClRoYW5rIHlvdQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0z
MiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9v
dC1zdG0zMgo=
