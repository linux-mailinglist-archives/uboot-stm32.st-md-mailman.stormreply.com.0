Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F4179667AC8
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 17:28:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3885C65E4C;
	Thu, 12 Jan 2023 16:28:43 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11B80C65E4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 16:28:42 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F0C0985368;
 Thu, 12 Jan 2023 17:28:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1673540921;
 bh=cvdAwxw+5lIJWhm9X+vh/YG4mKOTa2rpoEM+bOxziIE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SSJ3gUXiyPQIl7wdndwO4GzQEclLoXEbD2WERsEyilpruNYcpiLC68l9Nsf8uZFR1
 1spbQ9CGxiP6Vb5eQLpMbkVw5Ji50wcVKDfqYlBHuYjZxzeDOv5PySvpFg4fCVAslu
 G/3CcsJ+Z+GkdhSO21j0SMGJGr0+y+EgwFILeWZy/iXjdCG9kbvTL+/imxeu7/WbDd
 hU51VGjewixMogV0hqOauGrASULesEKU/Rr+SmmXmmZXpJLdKQEcZaTzKmwAJDgg6j
 5FS+LXhUMkM22XN86WTVoMZOzCCRs6zxfwr6ZCbBPQh9pYNF7+RjRVxN+IQDrkO4xn
 aJHpJxTFWYQEQ==
Message-ID: <33eaee89-3450-1c6f-c117-e48dfbdb92ba@denx.de>
Date: Thu, 12 Jan 2023 17:24:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, u-boot@lists.denx.de
References: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
 <20221212104437.15838-2-fabrice.gasnier@foss.st.com>
 <530438bb-c270-f36b-025e-5d3d3f335fc3@foss.st.com>
 <ddf2dde7-683e-8329-ee46-9c2e83d757f2@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ddf2dde7-683e-8329-ee46-9c2e83d757f2@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Thomas Huth <thuth@redhat.com>, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/3] usb: onboard-hub: add driver to
 manage onboard hub supplies
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

T24gMS8xMi8yMyAxNjoyNCwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IEhpIEZhYnJpY2UKPiAK
PiBPbiAxLzMvMjMgMTc6MzQsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBP
biAxMi8xMi8yMiAxMTo0NCwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+Pj4gVGhlIG1haW4gaXNz
dWUgdGhlIGRyaXZlciBhZGRyZXNzZXMgaXMgdGhhdCBhIFVTQiBodWIgbmVlZHMgdG8gYmUKPj4+
IHBvd2VyZWQgYmVmb3JlIGl0IGNhbiBiZSBkaXNjb3ZlcmVkLiBUaGlzIGlzIG9mdGVuIHNvbHZl
ZCBieSB1c2luZwo+Pj4gInJlZ3VsYXRvci1hbHdheXMtb24iLgo+Pj4KPj4+IFRoaXMgZHJpdmVy
IGlzIGluc3BpcmVkIGJ5IHRoZSBMaW51eCB2Ni4xIGRyaXZlci4gSXQgb25seSBlbmFibGVzIChv
cgo+Pj4gZGlzYWJsZXMpIHRoZSBodWIgdmRkICgzdjMpIHN1cHBseSwgc28gaXQgY2FuIGJlIGVu
dW1lcmF0ZWQuCj4+PiBTY2FubmluZyBvZiB0aGUgZGV2aWNlIHRyZWUgaXMgZG9uZSBpbiBhIHNp
bWlsYXIgbWFubmVyIHRvIHRoZSBzYW5kYm94LAo+Pj4gYnkgdGhlIHVzYi11Y2xhc3MuIERUIHBh
cnQgbG9va3MgbGlrZToKPj4+Cj4+PiAmdXNiaF9laGNpIHsKPj4+ICDCoMKgwqDCoC4uLgo+Pj4g
IMKgwqDCoMKgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+PiAgwqDCoMKgwqAjc2l6ZS1jZWxscyA9
IDwwPjsKPj4+ICDCoMKgwqDCoGh1YkAxIHsKPj4+ICDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxl
ID0gInVzYjQyNCwyNTE0IjsKPj4+ICDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MT47Cj4+PiAgwqDC
oMKgwqDCoMKgwqAgdmRkLXN1cHBseSA9IDwmdjN2Mz47Cj4+PiAgwqDCoMKgwqB9Owo+Pj4gfTsK
Pj4+Cj4+PiBXaGVuIHRoZSBidXMgZ2V0cyBwcm9iZWQsIHRoZSBkcml2ZXIgaXMgYXV0b21hdGlj
YWxseSBwcm9iZWQvcmVtb3ZlZCBmcm9tCj4+PiB0aGUgYnVzIHRyZWUsIGFzIGFuIGV4YW1wbGUg
b24gc3RtMzI6Cj4+PiBTVE0zMk1QPiB1c2Igc3RhcnQKPj4+IHN0YXJ0aW5nIFVTQi4uLgo+Pj4g
U1RNMzJNUD4gZG0gdHJlZQo+Pj4gIMKgIENsYXNzwqDCoMKgwqAgSW5kZXjCoCBQcm9iZWTCoCBE
cml2ZXLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTmFtZQo+Pj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+ICDCoCB1
c2LCoMKgwqDCoMKgwqDCoMKgwqDCoCAwwqAgWyArIF3CoMKgIGVoY2lfZ2VuZXJpY8KgwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoCB8LS0gdXNiQDU4MDBkMDAwCj4+PiAgwqAgdXNiX2h1YsKgwqDCoMKg
wqDCoCAwwqAgWyArIF3CoMKgIHVzYl9vbmJvYXJkX2h1YsKgwqDCoMKgwqDCoCB8wqDCoCB8wqDC
oCBgLS0gaHViQDEKPj4+ICDCoCB1c2JfaHViwqDCoMKgwqDCoMKgIDHCoCBbICsgXcKgwqAgdXNi
X2h1YsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgfMKgwqDCoMKgwqDCoCBgLS0g
dXNiX2h1Ygo+Pj4KPj4+IFNUTTMyTVA+IHVzYiB0cmVlCj4+PiBVU0IgZGV2aWNlIHRyZWU6Cj4+
PiAgwqDCoCAxwqAgSHViICg0ODAgTWIvcywgMG1BKQo+Pj4gIMKgwqAgfMKgIHUtYm9vdCBFSENJ
IEhvc3QgQ29udHJvbGxlcgo+Pj4gIMKgwqAgfAo+Pj4gIMKgwqAgKy0ywqAgSHViICg0ODAgTWIv
cywgMm1BKQo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5n
YXNuaWVyQGZvc3Muc3QuY29tPgo+Pj4gLS0tCj4+Pgo+Pj4gIMKgIGNvbW1vbi9NYWtlZmlsZcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+Pj4gIMKgIGNvbW1vbi91c2Jfb25i
b2FyZF9odWIuY8KgwqDCoMKgwqAgfCA2MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+Pj4gIMKgIGRyaXZlcnMvdXNiL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEw
ICsrKysrKwo+Pj4gIMKgIGRyaXZlcnMvdXNiL2hvc3QvdXNiLXVjbGFzcy5jIHwgMTYgKysrKyst
LS0tCj4+PiAgwqAgNCBmaWxlcyBjaGFuZ2VkLCA4MyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+Pj4gIMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb21tb24vdXNiX29uYm9hcmRfaHViLmMK
Pj4+Cj4+Cj4+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5
QGZvc3Muc3QuY29tPgo+Pgo+PiBUaGFua3MKPj4gUGF0cmljawo+Pgo+Pgo+IAo+IEFwcGxpZWQg
b24gdS1ib290LXN0bTMyL21hc3RlcgoKVGhlcmUgaXMgdS1ib290LXVzYiB0cmVlIGZvciB0aGVz
ZSBwYXRjaGVzIGFuZCAxLzMgc2hvdWxkIGdvIHRocm91Z2ggaXQuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApV
Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
