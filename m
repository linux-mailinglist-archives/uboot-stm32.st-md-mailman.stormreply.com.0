Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A89317238
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Feb 2021 22:23:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01CB1C57B52;
	Wed, 10 Feb 2021 21:23:10 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80F50C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 21:23:09 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DbXmW36Tgz1rwZq;
 Wed, 10 Feb 2021 22:23:07 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DbXmW202lz1qqkT;
 Wed, 10 Feb 2021 22:23:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id EblX5dhaKCm1; Wed, 10 Feb 2021 22:23:06 +0100 (CET)
X-Auth-Info: qNQytAEh/UiDKx7X7MJPO5boHdWVP+FAYwHZohMvwKQ=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 10 Feb 2021 22:23:06 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210209111438.1.If6218391a7cf47afdeda5e5e6c79937b4e8ab085@changeid>
 <804006bd-a6bc-0352-374d-6d2b33e42db9@denx.de>
 <a64dfb56-e43c-5adf-4c07-8935f900a47f@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <84ce2245-b731-41e0-7654-e8da7bf4332a@denx.de>
Date: Wed, 10 Feb 2021 22:23:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a64dfb56-e43c-5adf-4c07-8935f900a47f@foss.st.com>
Content-Language: en-US
Cc: uboot-stm32@st-md-mailman.stormreply.com, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: change compatible st,
 stm32mp1-hsotg to st, stm32mp15-hsotg
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

T24gMi85LzIxIDg6NTEgUE0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gCj4gT24gMi85LzIx
IDExOjM5IEFNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gMi85LzIxIDExOjE0IEFNLCBQYXRy
aWNrIERlbGF1bmF5IHdyb3RlOgo+PiBIaSwKPj4KPj4gWy4uLl0KPj4KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9nYWRnZXQvZHdjMl91ZGNfb3RnLmMgCj4+PiBiL2RyaXZlcnMvdXNiL2dh
ZGdldC9kd2MyX3VkY19vdGcuYwo+Pj4gaW5kZXggZTM4NzFlMzgxZS4uZWNhYzgwZmMxMSAxMDA2
NDQKPj4+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9kd2MyX3VkY19vdGcuYwo+Pj4gKysrIGIv
ZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRjX290Zy5jCj4+PiBAQCAtMTE3Niw3ICsxMTc2LDcg
QEAgc3RhdGljIGludCBkd2MyX3VkY19vdGdfcmVtb3ZlKHN0cnVjdCB1ZGV2aWNlIAo+Pj4gKmRl
dikKPj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdWRldmljZV9pZCBkd2MyX3VkY19vdGdfaWRz
W10gPSB7Cj4+PiDCoMKgwqDCoMKgIHsgLmNvbXBhdGlibGUgPSAic25wcyxkd2MyIiB9LAo+Pj4g
wqDCoMKgwqDCoCB7IC5jb21wYXRpYmxlID0gImJyY20sYmNtMjgzNS11c2IiIH0sCj4+PiAtwqDC
oMKgIHsgLmNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEtaHNvdGciLAo+Pj4gK8KgwqDCoCB7IC5j
b21wYXRpYmxlID0gInN0LHN0bTMybXAxNS1oc290ZyIsCj4+PiDCoMKgwqDCoMKgwqDCoCAuZGF0
YSA9ICh1bG9uZylkd2MyX3NldF9zdG0zMm1wMV9oc290Z19wYXJhbXMgfSwKPj4KPj4gSSBoYXZl
IHRvIHBvaW50IG91dCB0aGUgb2J2aW91cywgRFQgaXMgQUJJLCB0aGlzIGJyZWFrcyBBQkkuIEhv
d2V2ZXIsIAo+PiBkbyB3ZSBjYXJlIGFib3V0IG91dC1vZi10cmVlIERUcyBoZXJlID8KPiAKPiAK
PiBJIGtub3cgdGhhdCB0aGUgYmluZGluZyBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IGFuZCAiYmlu
YXJ5IGNvbXBhdGlibGUiIAo+IHRoZSBpcyBhIGtleSBlbGVtZW50IG9mIERUCj4gCj4gZm9yIHRo
ZSBMaW51eCBrZXJuZWwgKGZvciBleGFtcGxlIHRoZSBsYXRlc3Qga2VybmVsIGltYWdlIHNob3Vs
ZCB3b3JrIAo+IHdpdGggYSBvbGQgZGV2aWNlIHRyZWUpLgo+IAo+IAo+IEkgZG9uJ3Qgc2VlIHRo
ZSBzYW1lIHJlcXVpcmVtZW50IGZvciBVLUJvb3QgYXMgZXh0ZXJuYWwgRFQgKHdpdGggRVhUX0RU
QiAKPiBvcHRpb24pIGlzIG5vdCBjb21tb24gLgo+IAo+IAo+IFNvIHRvZGF5IEkgYXNzdW1lIHRo
YXQgVS1Cb290IHVzZSBvbmx5IGluLXRyZWUgRFQgZm9yIHN0bTMybXAxNSAKPiBwbGF0Zm9ybXMg
dW50aWwgd2UgaGF2ZSBhCj4gCj4gMTAwJSB1cHN0cmVhbSBsZXZlbCBvZiB0aGUgc3RtMzJtcDEg
cGxhdGZvcm0gd2l0aCBiaW5kaW5nIGFsaWduZWQgd2l0aCAKPiBMaW51eCBrZXJuZWwgYmluZGlu
Z3MKPiAKPiAoZm9yIGV4YW1wbGUgd2UgaGF2ZSBzb21lIG90aGVyIHBlbmRpbmcgaXNzdWUgZm9y
IFVTQlBIWUMgYmluZGluZykuCj4gCj4gCj4gQnV0IGlmIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkg
aXMgcmVhbGx5IGJsb2NraW5nIGZvciBVLUJvb3QgdXNlciwgSSBjYW4gCj4gY2hhbmdlIG15IG1p
bmQuCj4gCj4gCj4gUFM6IEkgY29ycmVjdCBhIGlzc3VlIGhlcmUsIGJlY2F1c2UgSSB1cHN0cmVh
bSB0aGUgc3RtMzJtcCBkb3duc3RyZWFtIAo+IGJpbmRpbmcgZm9yIGR3YzIsCj4gCj4gYnV0IHRo
aXMgY29tcGF0aWJsZSBoYWQgYmUgbW9kaWZpZWQgYmVmb3JlIGFjY2VwdGVkIGJ5IExpbnV4IGtl
cm5lbCBEVCAKPiBtYWludGFpbmVlcnMKPiAKPiA9PiB0b2RheSBVU0IgaW4gTGludXgga2VybmVs
IGNhbid0IHdvcmsgd2l0aCB0aGUgRFQgdXNlZCBieSBVLUJvb3QKCkFsbCByaWdodCwgYXBwbGll
ZCwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby91Ym9vdC1zdG0zMgo=
