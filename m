Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B6E90A320
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Jun 2024 06:50:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BDA2C6B45B;
	Mon, 17 Jun 2024 04:50:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4758C69067
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 04:50:28 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7A64788246;
 Mon, 17 Jun 2024 06:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718599828;
 bh=E2KTRfhWmt/bftxDylkrBH0v08bsrmXsZ96uKgDWc9E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ojn9I8WU3+KPPS5fTzL2K5YlJ/w2f6s1H/exVk+0oscPm/Wl53rIRg2jLllKPvFBt
 fiFNACotu8lxc8n6ncPHNjIrPZoVzqU+J/gAud+9qRaFr8qq2vl9GQmqz6XhWD4Khm
 rCvTvf/c/37+Q1FfvAT+c9gw+dcr2l0BiAvvqIONiT/ZPRHCqcK5adr/ruBNGHhc3U
 V7s1p3bkzhdcSWAjCzzfG0cs6YE1IZSOVOlNsbdxwZgCzFdtwotpK9GQGLSNfR7of6
 baBCoAdjz3H05XMapdnT/+nqguavGsJMCJ1NFS3zhUSd7P7g7lPfoghhURAOM6QM1p
 GtLuE7pWrLeoA==
Message-ID: <fad7f06b-6c32-42c0-a895-29ceed99a207@denx.de>
Date: Mon, 17 Jun 2024 04:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20240419220331.277574-1-marex@denx.de>
 <433560cb-8d8a-4db4-bc9b-d49a05da127b@foss.st.com>
 <ca3c6071-2adf-452b-b4af-574fa57443f9@denx.de>
 <64efe66a-40d9-4df2-aad6-60e75eb3b0c4@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <64efe66a-40d9-4df2-aad6-60e75eb3b0c4@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Ping IWDG on exit from PSCI
	suspend code
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

T24gNi8xNC8yNCA0OjAyIFBNLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4gCj4gCj4gT24gNi8x
NC8yNCAxNTowNiwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDYvMTQvMjQgMjowMCBQTSwgUGF0
cmljZSBDSE9UQVJEIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiA0LzIwLzI0IDAwOjAzLCBNYXJlayBW
YXN1dCB3cm90ZToKPj4+PiBNYWtlIHN1cmUgdGhlIE9TIHdvdWxkIG5vdCBnZXQgYW55IHNwdXJp
b3VzIElXREcgcHJldGltZW91dCBJUlEKPj4+PiByaWdodCBhZnRlciB0aGUgc3lzdGVtIHdha2Vz
IHVwLiBUaGlzIG1heSBoYXBwZW4gaW4gY2FzZSB0aGUgU29DCj4+Pj4gZ290IHdva2VuIHVwIGJ5
IGFub3RoZXIgc291cmNlIHRoYW4gdGhlIElXREcgcHJldGltZW91dCBhbmQgdGhlCj4+Pj4gcHJl
dGltZW91dCBJUlEgYXJyaXZlZCBpbW1lZGlhdGVseSBhZnRlcndhcmQsIGJ1dCB0b28gbGF0ZSB0
byBiZQo+Pj4+IGhhbmRsZWQgYnkgdGhlIHN1c3BlbmQgbWFpbiBsb29wLiBJbiBjYXNlIGVpdGhl
ciBvZiB0aGUgSVdERyBpcwo+Pj4+IGVuYWJsZWQsIHBpbmcgaXQgZmlyc3QgYW5kIHRoZW4gcmV0
dXJuIHRvIHRoZSBPUy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJl
eEBkZW54LmRlPgo+Pj4+IC0tLQo+Pj4+IENjOiBJZ29yIE9wYW5pdWsgPGlnb3Iub3Bhbml1a0Bm
b3VuZHJpZXMuaW8+Cj4+Pj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZv
c3Muc3QuY29tPgo+Pj4+IENjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZv
c3Muc3QuY29tPgo+Pj4+IENjOiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4KPj4+PiBD
YzogVG9tIFJpbmkgPHRyaW5pQGtvbnN1bGtvLmNvbT4KPj4+PiBDYzogdS1ib290QGRoLWVsZWN0
cm9uaWNzLmNvbQo+Pj4+IENjOiB1Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCj4+Pj4gLS0tCj4+Pj4gIMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9wc2Np
LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDIx
IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMy
bXAvc3RtMzJtcDEvcHNjaS5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL3BzY2ku
Ywo+Pj4+IGluZGV4IDRmMjM3OWRmNDVmLi5lOTkxMDM5MTBkOSAxMDA2NDQKPj4+PiAtLS0gYS9h
cmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDEvcHNjaS5jCj4+Pj4gKysrIGIvYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL3N0bTMybXAxL3BzY2kuYwo+Pj4+IEBAIC04MDgsNiArODA4LDI3IEBAIHZv
aWQgX19zZWN1cmUgcHNjaV9zeXN0ZW1fc3VzcGVuZCh1MzIgX19hbHdheXNfdW51c2VkIGZ1bmN0
aW9uX2lkLAo+Pj4+ICDCoMKgwqDCoMKgIHdyaXRlbChTWVNDRkdfQ01QRU5SX01QVUVOLCBTVE0z
Ml9TWVNDRkdfQkFTRSArIFNZU0NGR19DTVBFTlNFVFIpOwo+Pj4+ICDCoMKgwqDCoMKgIGNscmJp
dHNfbGUzMihTVE0zMl9TWVNDRkdfQkFTRSArIFNZU0NGR19DTVBDUiwgU1lTQ0ZHX0NNUENSX1NX
X0NUUkwpOwo+Pj4+ICDCoCArwqDCoMKgIC8qCj4+Pj4gK8KgwqDCoMKgICogTWFrZSBzdXJlIHRo
ZSBPUyB3b3VsZCBub3QgZ2V0IGFueSBzcHVyaW91cyBJV0RHIHByZXRpbWVvdXQgSVJRCj4+Pj4g
K8KgwqDCoMKgICogcmlnaHQgYWZ0ZXIgdGhlIHN5c3RlbSB3YWtlcyB1cC4gVGhpcyBtYXkgaGFw
cGVuIGluIGNhc2UgdGhlIFNvQwo+Pj4+ICvCoMKgwqDCoCAqIGdvdCB3b2tlbiB1cCBieSBhbm90
aGVyIHNvdXJjZSB0aGFuIHRoZSBJV0RHIHByZXRpbWVvdXQgYW5kIHRoZQo+Pj4+ICvCoMKgwqDC
oCAqIHByZXRpbWVvdXQgSVJRIGFycml2ZWQgaW1tZWRpYXRlbHkgYWZ0ZXJ3YXJkLCBidXQgdG9v
IGxhdGUgdG8gYmUKPj4+PiArwqDCoMKgwqAgKiBoYW5kbGVkIGJ5IHRoZSBtYWluIGxvb3AgYWJv
dmUuIEluIGNhc2UgZWl0aGVyIG9mIHRoZSBJV0RHIGlzCj4+Pj4gK8KgwqDCoMKgICogZW5hYmxl
ZCwgcGluZyBpdCBmaXJzdCBhbmQgdGhlbiByZXR1cm4gdG8gdGhlIE9TLgo+Pj4+ICvCoMKgwqDC
oCAqLwo+Pj4+ICsKPj4+PiArwqDCoMKgIC8qIFBpbmcgSVdERzEgYW5kIEFDSyBwcmV0aW1lciBJ
UlEgKi8KPj4+PiArwqDCoMKgIGlmIChnaWNfZW5hYmxlZFs0XSAmIEJJVCgyMikpIHsKPj4+PiAr
wqDCoMKgwqDCoMKgwqAgd3JpdGVsKElXREdfS1JfUkVMT0FEX0tFWSwgU1RNMzJfSVdERzFfQkFT
RSArIElXREdfS1IpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZWwoSVdER19FV0NSX0VXSUMs
IFNUTTMyX0lXREcxX0JBU0UgKyBJV0RHX0VXQ1IpOwo+Pj4+ICvCoMKgwqAgfQo+Pj4+ICsKPj4+
PiArwqDCoMKgIC8qIFBpbmcgSVdERzIgYW5kIEFDSyBwcmV0aW1lciBJUlEgKi8KPj4+PiArwqDC
oMKgIGlmIChnaWNfZW5hYmxlZFs0XSAmIEJJVCgyMykpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAg
d3JpdGVsKElXREdfS1JfUkVMT0FEX0tFWSwgU1RNMzJfSVdERzJfQkFTRSArIElXREdfS1IpOwo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZWwoSVdER19FV0NSX0VXSUMsIFNUTTMyX0lXREcyX0JB
U0UgKyBJV0RHX0VXQ1IpOwo+Pj4+ICvCoMKgwqAgfQo+Pj4+ICsKPj4+PiAgwqDCoMKgwqDCoCAv
Kgo+Pj4+ICDCoMKgwqDCoMKgwqAgKiBUaGUgc3lzdGVtIGhhcyByZXN1bWVkIHN1Y2Nlc3NmdWxs
eS4gUmV3cml0ZSBMUiByZWdpc3RlciBzdG9yZWQKPj4+PiAgwqDCoMKgwqDCoMKgICogb24gc3Rh
Y2sgd2l0aCAnZXAnIHZhbHVlLCBzbyB0aGF0IG9uIHJldHVybiBmcm9tIHRoaXMgUFNDSSBjYWxs
LAo+Pj4gQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbmV4dAo+Pgo+PiBUaGlzIGlzIGEgZml4LCBz
aG91bGQgZ28gaW50byAvbWFzdGVyIC4KPiAKPiBBaCB5ZXMgOi0oICwgaSB3aWxsIHNlbmQgYW5v
dGhlciBQUiBmb3IgZml4ZXMgb24gbW9uZGF5CgpUaGFuayB5b3UgIQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
