Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D92B791B68
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Sep 2023 18:24:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AFAAC6B454;
	Mon,  4 Sep 2023 16:24:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3285CC6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 16:24:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 345568692D;
 Mon,  4 Sep 2023 18:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1693844675;
 bh=xAfkAU5hAqEOfe4PCJiXX8M39R+UqKM76SpAbjVwOHw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cBRixEP+Z/YWBs+zSibmQQAjSaEGWB4udM1kyqxFj6kAlEBPj13ts7re/pHb2dnVg
 Bvaz6QVhzkJtZT84/ozd7UCBt2aRnR4xflwB708cblKVaNOah1mayZjCHRc3Cqa3Fx
 xbTEPRzyEzzRXrj3sXLGywjXZ5Ud1uXGlHaqUGtjpKz13YpZxsii3FqVtirxdtHu4J
 Ibe38mjGcHcJ6z+sb+5A9LuW7HTwLuyfJ9iEL4e+oXxLw73OXdVrB0GROsRhXN9/fq
 W94FHwRI5zSThEXVBoSR6+scq9bPHLbd3IwThmoDhu/ZESIfQXS8m3FEp4qTy25JTs
 gbS6qsPVG/kJw==
Message-ID: <7f0ba663-1e4d-4c14-b2a3-534be2505e3f@denx.de>
Date: Mon, 4 Sep 2023 18:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, u-boot@lists.denx.de
References: <20230901095201.3874129-1-fabrice.gasnier@foss.st.com>
 <29d44f7f-ffca-d8cd-ce88-5e2fb6103ff4@denx.de>
 <9c06f5ec-c278-e00d-873f-99ef54098816@foss.st.com>
 <fef0778b-4850-fb73-9d8f-da48a6138e13@denx.de>
 <7b2d0448-d7f0-e5f8-a6eb-beb1746921f1@foss.st.com>
 <cb4278ea-1cf9-a2c5-1310-7e6419315d38@denx.de>
 <0ad3304f-c0cf-3c8b-890d-8824b9987afe@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <0ad3304f-c0cf-3c8b-890d-8824b9987afe@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2] usb: check for companion controller in
	uclass
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

T24gOS80LzIzIDE4OjIxLCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4gT24gOS80LzIzIDE1OjU0
LCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gOS80LzIzIDE0OjM0LCBGYWJyaWNlIEdhc25pZXIg
d3JvdGU6Cj4+PiBPbiA5LzEvMjMgMTg6MDAsIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4+IE9uIDkv
MS8yMyAxNDoxMiwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+Pj4+PiBPbiA5LzEvMjMgMTI6NDgs
IE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4+Pj4gT24gOS8xLzIzIDExOjUyLCBGYWJyaWNlIEdhc25p
ZXIgd3JvdGU6Cj4+Pj4+Pj4gRUhDSSBpcyB1c3VhbGx5IHVzZWQgd2l0aCBjb21wYW5pb24gY29u
dHJvbGxlciAobGlrZSBPSENJKSBhcwo+Pj4+Pj4+IGNvbXBhbmlvbgo+Pj4+Pj4+IGNvbnRyb2xs
ZXIuIFRoaXMgaW5mb3JtYXRpb24gb24gdGhlIGNvbXBhbmlvbiBpcyBtaXNzaW5nIGN1cnJlbnRs
eSBpbgo+Pj4+Pj4+IGNvbXBhbmlvbiBkcml2ZXJzLgo+Pj4+Pj4+IFNvLCBpZiB0aGUgdXNiLXVj
bGFzcyBpc24ndCBhd2FyZSwgaXQgbWF5IHNjYW4gYnVzc2VzIGluIGFueSBvcmRlcjoKPj4+Pj4+
PiBPSENJCj4+Pj4+Pj4gZmlyc3QsIHRoZW4gRUhDSS4KPj4+Pj4+PiBUaGlzIGlzIHNlZW4gb24g
U1RNMzJNUDEgd2hlcmUgRFQgcHJvYmluZyBtYWtlcyB0aGUgcHJvYmUgb3JkZXIgdG8KPj4+Pj4+
PiBvY2N1cgo+Pj4+Pj4+IGJ5IGluY3JlYXNpbmcgYWRkcmVzcyAoT0hDSSBhZGRyZXNzIDwgRUhD
SSBhZGRyZXNzKS4KPj4+Pj4+Pgo+Pj4+Pj4+IFdoZW4gYSBsb3cgc3BlZWQgb3IgZnVsbC1zcGVl
ZCBkZXZpY2UgaXMgcGx1Z2dlZCBpbiwgaXQncyBub3QKPj4+Pj4+PiBkZXRlY3RlZCBhcwo+Pj4+
Pj4+IEVIQ0kgc2hvdWxkIGZpcnN0IGRldGVjdCBpdCwgYW5kIGdpdmUgb3duZXJzaGlwIChoYW5k
b3ZlcikgdG8gT0hDSS4KPj4+Pj4+Pgo+Pj4+Pj4+IEN1cnJlbnQgc2l0dWF0aW9uIG9uIFNUTTMy
TVAxICh3aXRoIGEgbG93IHNwZWVkIGRldmljZSBwbHVnZ2VkLWluKQo+Pj4+Pj4+IFNUTTMyTVA+
IHVzYiBzdGFydAo+Pj4+Pj4+IHN0YXJ0aW5nIFVTQi4uLgo+Pj4+Pj4+IEJ1cyB1c2JANTgwMGMw
MDA6IFVTQiBPSENJIDEuMAo+Pj4+Pj4+IEJ1cyB1c2JANTgwMGQwMDA6IFVTQiBFSENJIDEuMDAK
Pj4+Pj4+PiBzY2FubmluZyBidXMgdXNiQDU4MDBjMDAwIGZvciBkZXZpY2VzLi4uIDEgVVNCIERl
dmljZShzKSBmb3VuZAo+Pj4+Pj4+IHNjYW5uaW5nIGJ1cyB1c2JANTgwMGQwMDAgZm9yIGRldmlj
ZXMuLi4gMSBVU0IgRGV2aWNlKHMpIGZvdW5kCj4+Pj4+Pj4gIMKgwqDCoMKgwqAgc2Nhbm5pbmcg
dXNiIGZvciBzdG9yYWdlIGRldmljZXMuLi4gMCBTdG9yYWdlIERldmljZShzKSBmb3VuZAo+Pj4+
Pj4+Cj4+Pj4+Pj4gVGhlICJjb21wYW5pb24iIHByb3BlcnR5IGluIHRoZSBkZXZpY2UgdHJlZSBh
bGxvdyB0byByZXRyaWV2ZQo+Pj4+Pj4+IGNvbXBhbmlvbgo+Pj4+Pj4+IGNvbnRyb2xsZXIgaW5m
b3JtYXRpb24sIGZyb20gdGhlIEVIQ0kgbm9kZS4gVGhpcyBhbGxvdyBtYXJraW5nIHRoZQo+Pj4+
Pj4+IGNvbXBhbmlvbiBkcml2ZXIgYXMgc3VjaC4KPj4+Pj4+Pgo+Pj4+Pj4+IFdpdGggdGhpcyBw
YXRjaCAoc2FtZSBsb3cgc3BlZWQgZGV2aWNlIHBsdWdnZWQgaW4pOgo+Pj4+Pj4+IFNUTTMyTVA+
IHVzYiBzdGFydAo+Pj4+Pj4+IHN0YXJ0aW5nIFVTQi4uLgo+Pj4+Pj4+IEJ1cyB1c2JANTgwMGMw
MDA6IFVTQiBPSENJIDEuMAo+Pj4+Pj4+IEJ1cyB1c2JANTgwMGQwMDA6IFVTQiBFSENJIDEuMDAK
Pj4+Pj4+PiBzY2FubmluZyBidXMgdXNiQDU4MDBkMDAwIGZvciBkZXZpY2VzLi4uIDEgVVNCIERl
dmljZShzKSBmb3VuZAo+Pj4+Pj4+IHNjYW5uaW5nIGJ1cyB1c2JANTgwMGMwMDAgZm9yIGRldmlj
ZXMuLi4gMiBVU0IgRGV2aWNlKHMpIGZvdW5kCj4+Pj4+Pj4gIMKgwqDCoMKgwqAgc2Nhbm5pbmcg
dXNiIGZvciBzdG9yYWdlIGRldmljZXMuLi4gMCBTdG9yYWdlIERldmljZShzKSBmb3VuZAo+Pj4+
Pj4+IFNUTTMyTVA+IHVzYiB0cmVlCj4+Pj4+Pj4gVVNCIGRldmljZSB0cmVlOgo+Pj4+Pj4+IDHC
oCBIdWIgKDEyIE1iL3MsIDBtQSkKPj4+Pj4+PiB8wqDCoCBVLUJvb3QgUm9vdCBIdWIKPj4+Pj4+
PiB8Cj4+Pj4+Pj4gKy0ywqAgSHVtYW4gSW50ZXJmYWNlICgxLjUgTWIvcywgMTAwbUEpCj4+Pj4+
Pj4gIMKgwqDCoMKgwqAgSFAgSFAgVVNCIDEwMDBkcGkgTGFzZXIgTW91c2UKPj4+Pj4+Pgo+Pj4+
Pj4+IDHCoCBIdWIgKDQ4MCBNYi9zLCAwbUEpCj4+Pj4+Pj4gIMKgwqDCoCB1LWJvb3QgRUhDSSBI
b3N0IENvbnRyb2xsZXIKPj4+Pj4+Pgo+Pj4+Pj4+IFRoaXMgYWxzbyBvcHRpbWl6ZSBidXMgc2Nh
biB3aGVuIGEgSGlnaCBzcGVlZCBkZXZpY2UgaXMgcGx1Z2dlZAo+Pj4+Pj4+IGluLCBhcwo+Pj4+
Pj4+IHRoZSB1c2ItdWNsYXNzIHNraXBzIE9IQ0kgaW4gdGhpcyBjYXNlOgo+Pj4+Pj4+Cj4+Pj4+
Pj4gU1RNMzJNUD4gdXNiIHJlc2V0Cj4+Pj4+Pj4gcmVzZXR0aW5nIFVTQi4uLgo+Pj4+Pj4+IEJ1
cyB1c2JANTgwMGMwMDA6IFVTQiBPSENJIDEuMAo+Pj4+Pj4+IEJ1cyB1c2JANTgwMGQwMDA6IFVT
QiBFSENJIDEuMDAKPj4+Pj4+PiBzY2FubmluZyBidXMgdXNiQDU4MDBkMDAwIGZvciBkZXZpY2Vz
Li4uIDIgVVNCIERldmljZShzKSBmb3VuZAo+Pj4+Pj4+ICDCoMKgwqDCoMKgIHNjYW5uaW5nIHVz
YiBmb3Igc3RvcmFnZSBkZXZpY2VzLi4uIDEgU3RvcmFnZSBEZXZpY2UocykgZm91bmQKPj4+Pj4+
PiBTVE0zMk1QPiB1c2IgdHJlZQo+Pj4+Pj4+IFVTQiBkZXZpY2UgdHJlZToKPj4+Pj4+PiAxwqAg
SHViICg0ODAgTWIvcywgMG1BKQo+Pj4+Pj4+IHzCoCB1LWJvb3QgRUhDSSBIb3N0IENvbnRyb2xs
ZXIKPj4+Pj4+PiB8Cj4+Pj4+Pj4gKy0ywqAgTWFzcyBTdG9yYWdlICg0ODAgTWIvcywgMjAwbUEp
Cj4+Pj4+Pj4gIMKgwqDCoMKgwqAgU2FuRGlzayBDcnV6ZXIgQmxhZGUgMDMwMDM0MzIwMjE5MjIw
MTE0MDcKPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFi
cmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2hh
bmdlcyBpbiB2MjoKPj4+Pj4+PiAtIG1vdmUgY29tcGFuaW9uIHByb2JpbmcgZnJvbSBnZW5lcmlj
IGVoY2kgZHJpdmVyIHRvIHVzYi11Y2xhc3MsCj4+Pj4+Pj4gYWZ0ZXIKPj4+Pj4+PiAgwqDCoMKg
wqAgTWFyZWsncyBxdWVzdGlvbnMgb24gZGVzaWduIGNob2ljZS4KPj4+Pj4+PiAtIHJlbmFtZSBj
b21taXQgdGl0bGUgdG8gZm9sbG93IHRoaXMgY2hhbmdlCj4+Pj4+Pj4KPj4+Pj4+PiAtLS0KPj4+
Pj4+PiAgwqDCoMKgIGRyaXZlcnMvdXNiL2hvc3QvdXNiLXVjbGFzcy5jIHwgMzYKPj4+Pj4+PiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+Pj4+ICDCoMKgwqAgMSBmaWxl
IGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9ob3N0L3VzYi11Y2xhc3MuYwo+Pj4+Pj4+IGIvZHJpdmVycy91c2IvaG9zdC91
c2ItdWNsYXNzLmMKPj4+Pj4+PiBpbmRleCAwMmMwMTM4YTIwNjUuLmUyMzhlZWU4Yzg0ZCAxMDA2
NDQKPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3VzYi11Y2xhc3MuYwo+Pj4+Pj4+ICsr
KyBiL2RyaXZlcnMvdXNiL2hvc3QvdXNiLXVjbGFzcy5jCj4+Pj4+Pj4gQEAgLTI0OSw2ICsyNDks
MzcgQEAgc3RhdGljIHZvaWQgcmVtb3ZlX2luYWN0aXZlX2NoaWxkcmVuKHN0cnVjdAo+Pj4+Pj4+
IHVjbGFzcyAqdWMsIHN0cnVjdCB1ZGV2aWNlICpidXMpCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKg
IH0KPj4+Pj4+PiAgwqDCoMKgIH0KPj4+Pj4+PiAgwqDCoMKgICtzdGF0aWMgaW50IHVzYl9wcm9i
ZV9jb21wYW5pb24oc3RydWN0IHVkZXZpY2UgKmJ1cykKPj4+Pj4+PiArewo+Pj4+Pj4+ICvCoMKg
wqAgc3RydWN0IHVkZXZpY2UgKmNvbXBhbmlvbl9kZXY7Cj4+Pj4+Pj4gK8KgwqDCoCBpbnQgcmV0
Owo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqDCoMKgIC8qCj4+Pj4+Pj4gK8KgwqDCoMKgICogRW5mb3Jj
ZSBvcHRpb25hbCBjb21wYW5pb24gY29udHJvbGxlciBpcyBtYXJrZWQgYXMgc3VjaCBpbgo+Pj4+
Pj4+IG9yZGVyIHRvCj4+Pj4+Pj4gK8KgwqDCoMKgICogMXN0IHNjYW4gdGhlIHByaW1hcnkgY29u
dHJvbGxlciwgYmVmb3JlIHRoZSBjb21wYW5pb24KPj4+Pj4+PiBjb250cm9sbGVyCj4+Pj4+Pj4g
K8KgwqDCoMKgICogKG93bmVyc2hpcCBpcyBnaXZlbiB0byBjb21wYW5pb24gd2hlbiBsb3cgb3Ig
ZnVsbCBzcGVlZAo+Pj4+Pj4+IGRldmljZXMKPj4+Pj4+PiArwqDCoMKgwqAgKiBoYXZlIGJlZW4g
ZGV0ZWN0ZWQpLgo+Pj4+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+Pj4+ICvCoMKgwqAgcmV0ID0gdWNs
YXNzX2dldF9kZXZpY2VfYnlfcGhhbmRsZShVQ0xBU1NfVVNCLCBidXMsICJjb21wYW5pb24iLAo+
Pj4+Pj4+ICZjb21wYW5pb25fZGV2KTsKPj4+Pj4+PiArwqDCoMKgIGlmICghcmV0KSB7Cj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCB1c2JfYnVzX3ByaXYgKmNvbXBhbmlvbl9idXNfcHJp
djsKPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRlYnVnKCIlcyBpcyB0aGUgY29t
cGFuaW9uIG9mICVzXG4iLCBjb21wYW5pb25fZGV2LT5uYW1lLAo+Pj4+Pj4+IGJ1cy0+bmFtZSk7
Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhbmlvbl9idXNfcHJpdiA9IGRldl9nZXRfdWNs
YXNzX3ByaXYoY29tcGFuaW9uX2Rldik7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhbmlv
bl9idXNfcHJpdi0+Y29tcGFuaW9uID0gdHJ1ZTsKPj4+Pj4+PiArwqDCoMKgIH0gZWxzZSBpZiAo
cmV0ICYmIHJldCAhPSAtRU5PRU5UICYmIHJldCAhPSAtRU5PREVWKSB7Cj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIC8qCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBUcmVhdCBldmVyeXRoaW5n
IGVsc2UgdGhhbiBubyBjb21wYW5pb24gb3IgZGlzYWJsZWQKPj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoCAqIGNvbXBhbmlvbiBhcyBhbiBlcnJvci4gKEl0IG1heSBub3QgYmUgZW5hYmxlZCBvbiBi
b2FyZHMKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHRoYXQgaGF2ZSBhIEhpZ2gtU3BlZWQg
SFVCIHRvIGhhbmRsZSBGUyBhbmQgTFMgdHJhZmZpYykuCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqAgKi8KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJGYWlsZWQgdG8gZ2V0IGNvbXBh
bmlvbiAocmV0PSVkKVxuIiwgcmV0KTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsKPj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gMDsK
Pj4+Pj4+PiArfQo+Pj4+Pj4+ICsKPj4+Pj4+PiAgwqDCoMKgIGludCB1c2JfaW5pdCh2b2lkKQo+
Pj4+Pj4+ICDCoMKgwqAgewo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBpbnQgY29udHJvbGxlcnNf
aW5pdGlhbGl6ZWQgPSAwOwo+Pj4+Pj4+IEBAIC0yOTksNiArMzMwLDExIEBAIGludCB1c2JfaW5p
dCh2b2lkKQo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJw
cm9iZSBmYWlsZWQsIGVycm9yICVkXG4iLCByZXQpOwo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fQo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gdXNiX3Byb2JlX2NvbXBh
bmlvbihidXMpOwo+Pgo+PiBPbmUgbW9yZSB0aGluZywgc2hvdWxkbid0IHRoaXMgZG8KPj4KPj4g
aWYgKHJldCkKPj4gIMKgIGNvbnRpbnVlOwo+Pgo+PiBmb3IgbWF4aW11bSBjb21wYXRpYmlsaXR5
ID8KPiAKPiBJIHRoaW5rIGl0IGRvZXMgOi0pIE9yIEkgbWlzcyB5b3VyIHF1ZXN0aW9uIGhlcmUs
IGNvdWxkIHlvdSBjbGFyaWZ5ID8KPiAKPiBJbiB0aGUgb3JpZ2luYWwgUEFUQ0ggdGhlcmUgaXM6
Cj4gKwo+ICsJCXJldCA9IHVzYl9wcm9iZV9jb21wYW5pb24oYnVzKTsKPiArCQlpZiAocmV0KQo+
ICsJCQljb250aW51ZTsKPiArCgpUaGVuIGFsbCBpcyBPSywgdGhhbmtzLiBUaGUgbWlzc2luZyBj
b250ZXh0IGNvbmZ1c2VkIG1lLgoKQnV0IHNpbmNlIHJjNCB3YXMganVzdCB0YWdnZWQsIEknbGwg
YmUgcHV0dGluZyB0aGlzIGludG8gbmV4dCwgd2UncmUgdG9vIApjbG9zZSB0byB0aGUgcmVsZWFz
ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
