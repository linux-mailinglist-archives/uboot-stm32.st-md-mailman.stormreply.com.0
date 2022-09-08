Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B082B5B1B3D
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 13:20:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 626FAC63327;
	Thu,  8 Sep 2022 11:20:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8DACC03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 11:20:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2887R3aV031642;
 Thu, 8 Sep 2022 13:20:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Rc9B2kkDf8daB/r8ofN4gZu2s0HEbvGw2nBXnN6T+Ik=;
 b=Qvr3KEoZ88zFreHRgCs+PAsMnJSsJyiynOC3P7I54IGrq0dF1Z3Zy14KjmvtI34v75RW
 aW5phGovoE0gTFgX7X0HDb2pFYPlVyWddbJj6EQl9MTAcWNOwPjTJPwBdBJO1bqainW1
 4chZ6flbYfxNfYX5nn098w68BXmfBRck6GDV09pxM6419SAM21I6I5lqjG+f2S5ixSbL
 gGhxnXr8G7v6tSNX3TV5udXdE+dQFVCwOfj14Pf9g7DoX6V/KmXQN+jUBnvWQ5HXt7K6
 iVFZtsiY0xWyoW+NRCxPEu5c6llTGaUMl9l9mDnCOOXiRnKsvTpNIJY9lC3zpCzh15EW Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jergb8n2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 13:20:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B7DC100038;
 Thu,  8 Sep 2022 13:20:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1FBB2226FD5;
 Thu,  8 Sep 2022 13:20:12 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.121) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 8 Sep
 2022 13:20:11 +0200
Message-ID: <4dda40ad-4025-e4e2-4296-c85227369db4@foss.st.com>
Date: Thu, 8 Sep 2022 13:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20220704124540.1.Ic02e6fb44225d1cfe15506c7c85f70a0893fb880@changeid>
 <20220704124540.2.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
 <0e84778e-0ac5-5547-5a29-c8d12df3498d@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <0e84778e-0ac5-5547-5a29-c8d12df3498d@denx.de>
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_07,2022-09-07_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] usb: hub: increase
	HUB_DEBOUNCE_TIMEOUT
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

SGkgTWFyZWssCgpPbiA3LzgvMjIgMTc6MzQsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDcvNC8y
MiAxMjo0NSwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPj4gSW5jcmVhc2UgSFVCX0RFQk9VTkNF
X1RJTUVPVVQgdG8gMjAwMCBiZWNhdXNlIHNvbWUgdXNiIGRldmljZQo+PiBuZWVkcyBhcm91bmQg
MS41cyBvciBtb3JlIHRvIG1ha2UgdGhlIGh1YiBwb3J0IHN0YXR1cyB0byBiZQo+PiBjb25uZWN0
ZWQgc3RlYWRpbHkgYWZ0ZXIgYmVpbmcgcG93ZXJlZCBvZmYgYW5kIHBvd2VyZWQgb24uCj4+Cj4+
IFRoZXNlIHZhbHVlIGlzIGFsaWduZWQgd2l0aCBMaW51eCBkcml2ZXIgYW5kIGF2b2lkcyB0byBj
b25maWd1cmUKPj4gInVzYl9wZ29vZF9kZWxheSIgYXMgYSB3b3JrYXJvdW5kIGZvciBjb25uZWN0
aW9uIHRpbWVvdXQgb24KPj4gc29tZSBVU0IgZGV2aWNlOyBub3JtYWxseSB0aGUgZW52IHZhcmlh
YmxlICJ1c2JfcGdvb2RfZGVsYXkiIGlzIHVzZWQKPj4gdG8gZGVsYXkgdGhlIGZpcnN0IHF1ZXJ5
IGFmdGVyIHBvd2VyIE9OIGFuZCB0aHVzIHRoZSBkZXZpY2UgYW5zd2VyLAo+PiBidXQgdGhpcyB2
YXJpYWJsZSBub3QgdG8gaW5jcmVhc2UgdGhlIGNvbm5lY3Rpb24gdGltZW91dCBkZWxheS4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3Nz
LnN0LmNvbT4KPj4gLS0tCj4+IEhpLAo+Pgo+PiBJIHRoaW5rIHRoaXMgcGF0Y2ggc29sdmVzIGEg
Z2VuZXJhbCBpc3N1ZSBiZWNhdXNlIGEgMXMgdGltZW91dCBmb3IKPj4gVVNCIGNvbm5lY3Rpb24g
aXMgdG9vIHNob3J0IG9uIHByb2JsZW1hdGljIFVTQiBrZXlzIC8gVVNCIEhVQi4KPj4gVGhlIGlz
c3VlIHdhcyBpbnRyb2R1Y2VkIGJ5IHRoZSBjb21taXQgYzk5OGRhMGQ2NzA5ICgidXNiOiBDaGFu
Z2UKPj4gcG93ZXItb24gLyBzY2FubmluZyB0aW1lb3V0IGhhbmRsaW5nIikKPj4KPj4gUGF0Y2hp
bmcgdXNiX2h1YiBhbGxvd3MgdG8gYXZvaWQgdG8gcGF0Y2ggaW4gZWFjaCBib2FyZC9kcml2ZXIu
Cj4+Cj4+IEZvciBleGFtcGxlLCBjb21taXQgMDQxNzE2OTA1NGNiICgiaW14OiB2ZW50YW5hOiBh
ZGQgdXNiX3Bnb29kX2RlbGF5Cj4+IDJzZWMgZGVmYXVsdCIpID0+IHVzZSBwZ29vZF9kZWxheSA9
IDJzICE/Cj4+Cj4+IG9yICgiQVJNOiBzdG0zMjogSW5jcmVhc2UgVVNCIHBvd2VyLWdvb2QgZGVs
YXkgb24gREhTT00iKQo+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvdWJv
b3QvcGF0Y2gvMjAyMTExMTMwMjI0NDQuMjMxODAxLTEtbWFyZXhAZGVueC5kZS8gCj4+Cj4+Cj4+
IG9yIGNvbW1pdCAyYmYzNTJmMGMxYjcgKCJ1c2I6IGR3YzI6IEFkZCBkZWxheSB0byBmaXggdGhl
IFVTQgo+PiBkZXRlY3Rpb24gcHJvYmxlbSBvbiBTb0NGUEdBIikgPT4gcGF0Y2ggaW4gVVNCIERX
QzIgZHJpdmVyIHRvIGFkZAo+PiBhIHRpbWVvdXQgaW4gZHJpdmVyCj4+Cj4+IFRoZSBjb21taXQg
MzE5NDE4YzAxYzk1ICgidXNiOiBodWI6IGFsbG93IHBnb29kX2RlbGF5IHRvIGJlCj4+IHNwZWNp
ZmllZCB2aWEgZW52IikgaW50cm9kdWNlcyBhbiBlbnYgdmFyaWFibGUgZm9yIHdhcm0tdXAgdGlt
ZXMKPj4gbWFuYWdlZCBieSBodWItPnF1ZXJ5X2RlbGF5Lgo+Pgo+PiBCdXQgaXQgaXMgbm90IGxp
bmtlZCB0byB0aGUgY29ubmVjdCB0aW1lb3V0IGFmdGVyIHBvd2VyIG9uCj4+IG1hbmFnZWQgYnkg
aHViLT5jb25uZWN0X3RpbWVvdXQuCj4+Cj4+IFRoaXMgcGF0Y2ggY2FuIGluY3JlYXNlIHRoZSBi
b290IHRpbWUgZm9yIHNvbWUgYm9hcmQgd2hlbiBVU0IgZGV2aWNlIGlzCj4+IG5vdCBhdmFpbGFi
bGU7IGlmIGl0IGlzIGEgcHJvYmxlbSBJIGNhbiBpbnRyb2R1Y2UgYSBuZXcgY29uZmlnOgo+PiBD
T05GSUdfVVNCX0hVQl9ERUJPVU5DRV9USU1FT1VUIHRvIGRlZmluZSB0aGlzIHZhbHVlIHdpdGgg
ZGVmYXVsdCA9IDFzCj4+IHRvIGtlZXAgdGhlIGN1cnJlbnQgYmVoYXZpb3IuCj4+Cj4+IFRoaXMg
aXNzdWUgYXBwZWFycyB3aXRoIERXQzIgYW5kIFVTQiBIVUIgdXNlZCBpbiBTVE0zMk1QMTM1Ri1E
SyBib2FyZDsKPj4gcGdvb2RfZGVsYXk9MiBpcyBub3QgZW5vdWdoIHRvIHNvbHZlZCBhbGwgdGhl
IFVTQiBrZXkgZGV0ZWN0aW9uIGlzc3Vlcy4KPj4KPj4gUGF0cmljawo+Pgo+Pgo+PiDCoCBjb21t
b24vdXNiX2h1Yi5jIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2NvbW1vbi91c2JfaHViLmMgYi9jb21t
b24vdXNiX2h1Yi5jCj4+IGluZGV4IGQ3MzYzODk1MGI5Li5lNjgxZjFiMzA3MyAxMDA2NDQKPj4g
LS0tIGEvY29tbW9uL3VzYl9odWIuYwo+PiArKysgYi9jb21tb24vdXNiX2h1Yi5jCj4+IEBAIC00
Nyw3ICs0Nyw3IEBACj4+IMKgICNkZWZpbmUgSFVCX1NIT1JUX1JFU0VUX1RJTUXCoMKgwqAgMjAK
Pj4gwqAgI2RlZmluZSBIVUJfTE9OR19SRVNFVF9USU1FwqDCoMKgIDIwMAo+PiDCoCAtI2RlZmlu
ZSBIVUJfREVCT1VOQ0VfVElNRU9VVMKgwqDCoCAxMDAwCj4+ICsjZGVmaW5lIEhVQl9ERUJPVU5D
RV9USU1FT1VUwqDCoMKgIDIwMDAKPgo+IERvIHlvdSB0aGluayBpdCBpcyBwb3NzaWJsZSB0byBt
YWtlIHRoaXMgc29tZWhvdyBkeW5hbWljICwgc28gbm90IGFsbCAKPiBkZXZpY2VzIHdvdWxkIHdh
aXQgc28gbG9uZyA/CgoKWWVzIEkgZG8gaXQgaW4gVjIuCgoKUGF0cmljawoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
